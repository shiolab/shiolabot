class LinebotMessage

  attr_accessor :text

  def initialize(text)
  	@text = text
  end

  def reply
  	@text
  end
end