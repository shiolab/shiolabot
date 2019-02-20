class Vegetable < LinebotMessage

  def find
  	"v #{@event_message}"
  end
end