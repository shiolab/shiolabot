module Foods

  def foods
    case @event_message
    when "foods"
      "食品"
 when "米"
      "石川県産こしひかり税込3219円"
 when"たまご"
      "1パック税込106円"
 when "豚肉"
      "九州産ロース100ｇ税込172円"
 when "鶏肉"
      "国産若鶏もも肉100ｇ税込107円"
 when "牛肉"
      "オーストラリア産サーロインステーキ100ｇ税込322円"
 when "豆腐"
      "国産大豆3コ税込85円"
 when "食パン"
      "超熟食パン1袋税込127円"
    end
  end
end
