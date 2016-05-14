class MainController < UIViewController
  extend IB

  ## ib outlets
  outlet :display, UILabel
  outlet :entries, UILabel


  def clear_entry(sender)
    label.text = ""
  end

  def clear_last(sender)
    @entries.pop
    self.update_entries_display
  end

  def add_entry(sender)
    @entries ||= []
    @entries << sender.text
    self.update_entries_display
  end

  def update_entries_display
    entries.text = @entries.join(" ")
  end
end
