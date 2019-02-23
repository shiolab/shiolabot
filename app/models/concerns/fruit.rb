module Fruit

  def fruit
    case @event_message
    when "fruit"
      "フルーツ"
    when "バナナ"
      "１袋１７１円(フィリピン産)"
    end
  end
end
