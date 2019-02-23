module Drugstore

  def drugstore
    case @event_message
    when "drugstore"
      "ドラッグストア"
    when "点鼻薬"
      "698yenn"
    end
  end
end
