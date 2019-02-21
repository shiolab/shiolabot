module Drugstore

  def drugstore
    case @event_message
    when "drugstore"
      "ドラッグストア"
    end
  end
end