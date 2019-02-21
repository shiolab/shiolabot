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
          event_message = event.message['text']
          message = { type: 'text', text: LinebotMessage.new(event_message).reply }
          client.reply_message(event['replyToken'], message)
          if event_message =~ /(\d+)のスタンプ/
            sticker = { type: 'sticker', packageId: 1, stickerId: $1.to_i }
            client.reply_message(event['replyToken'], sticker)
          end
        when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
          nil
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
