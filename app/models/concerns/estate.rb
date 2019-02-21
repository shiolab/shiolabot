module Estate

  def estate
    case @event_message
    when "estate"
      "不動産"
    when "塩尻市広丘吉田"
      "2,398万円"
    end
  end
end
