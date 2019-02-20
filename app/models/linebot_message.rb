class LinebotMessage

  attr_accessor :event_message

  def initialize(text)
  	@event_message = text
  end

  def reply
  	reply_message = Vegetable.new(@event_message).find || Fruit.new(@event_message).find
  	@event_message if reply_message.blank?
  end
end