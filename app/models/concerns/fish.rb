module Fish

  def fish
    case @event_message
    when "fish"
      "魚"
    when"あじ"
      "干物は五枚６９０円　開干は一枚税込１４０円"
    when"ホタテ"
      "貝柱は税込３８７円"
    when"ほたて"
      "貝柱は税込３８０円"
    end
  end
end
