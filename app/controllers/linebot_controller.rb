# frozen_string_literal: true

class LinebotController < ApplicationController
  require 'line/bot'
  protect_from_forgery except: :callback

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error :bad_request do 'Bad Request' end
    end

    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = { type: 'text', text: LinebotMessage.new(event.message['text']).reply }
          client.reply_message(event['replyToken'], message)
        when Line::Bot::Event::MessageType::Sticker, Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
          sticker = { type: 'sticker', packageId: 1, stickerId: [*1..17,21,*100..139,*401..430].sample }
          client.reply_message(event['replyToken'], sticker)
        end
      end
    end
    head :ok
  end

  private

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end
end
