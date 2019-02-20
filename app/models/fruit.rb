class Fruit < LinebotMessage

  def find
  	"f #{@event_message}"
  end
end