class LinebotMessage

  include Estate
  include Vegetable
  include Fruit
  include Fish
  include Foods
  include Drugstore

  attr_accessor :event_message

  def initialize(text)
    @event_message = "#{text}"
  end

  def reply
    reply_message = estate || 
                    vegetable || 
                    fruit || 
                    fish || 
                    foods || 
                    drugstore
    reply_message = @event_message if reply_message.blank?
    reply_message
  end
end
