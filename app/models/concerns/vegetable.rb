module Vegetable

  def vegetable
    case @event_message
    when "vegetable"
      "野菜"
    when "にんじん"
      "１本　　４１円　　３本　　１０６円　　(税込  デリシア)"
    end
  end
end
