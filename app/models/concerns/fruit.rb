module Fruit

  def fruit
    case @event_message
    when "fruit"
      "フルーツ"
    when "バナナ"
      "1袋171円/n(フィリピン産)"
    when "甘栗"
      "1袋380円\n(むいてある)"
    when "みかん"
      "2玉　323円"
    when "いよかん"
      "8個　538円"
    when "いちご"
      "(ふつう)1パック410円 \(大粒)1パック430円"
    end
  end
end
