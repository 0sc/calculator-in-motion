class MainController < UIViewController
  extend IB

  ## ib outlets
  outlet :display, UILabel
  outlet :entries, UILabel


  def clear_entry(sender)
    @computation = []
    self.update_entries_display
  end

  def clear_last(sender)
    @computation.pop
    self.update_entries_display
  end

  def add_entry(sender)
    @computation ||= []
    @computation << sender.titleLabel.text
    self.update_entries_display
  end

  def update_entries_display
    entries.text = @computation.join(" ")
  end
end
