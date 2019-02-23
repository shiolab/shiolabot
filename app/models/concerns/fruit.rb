module Fruit

  def fruit
    case @event_message
    when "fruit"
      "フルーツ"
    when "バナナ"
      "１袋１７１円(フィリピン産)"
    when "甘栗"
      "１袋３８０円(むいてある)"
    when "みかん"
      "2玉　323円"
    when "いよかん"
      "8個　538円"
    when "いちご"
      "(大粒)1パック430円"
    when "いちご"  
       "(ふつう)1パック410円"     
    end
  end
end
