class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  protect_from_forgery :except => [:callback]

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          image_url = "https://s3.shiolab.com/camera/sip/2017/12/10/2017-12-10_1540-thumbnail.jpeg"
          message = {
            tyep: 'image',
            originalContentUrl: image_url,
            previewImageUrl: image_url
#            type: 'text',
#            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        end
      end
    end
    head :ok
  end

private
  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end
  end
end