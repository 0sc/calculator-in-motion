class MainController < UIViewController
  extend IB

  ## ib outlets
  outlet :display, UILabel
  outlet :entries, UILabel

  def viewWillAppear(animated)
    clear_entry
  end

  def clear_entry
    @computation = ""
    @result = 0
    @values = ""
    @operator_position = nil

    update_entries_display
    update_result_entry
  end

  def clear_last(sender)
    @computation = @computation[0...-1]
    self.update_entries_display
  end

  def add_entry(sender)
    @computation += sender.titleLabel.text
    self.update_entries_display
  end

  def update_entries_display
    entries.text = @computation
  end

  def add_operator(sender)
    operator = sender.titleLabel.text
    if @operator_position
      if @computation.length == @operator_position
        @computation = @computation[0...-1] + operator
      else
        evaluate
        @computation = "#{@result}" + operator
        @operator_position = @computation.length
      end
    else
      @computation += operator
      @operator_position = @computation.length
    end
    update_entries_display
  end

  def evaluate
    op_pos = @operator_position - 1
    @result = @computation[0...op_pos].to_i.send(@computation[op_pos], @computation[(op_pos + 1)..-1].to_i)
    update_result_entry
  end

  def update_result_entry
    display.text = @result.to_s
  end

  # TODO:
  # fix equality sign
  # fix operator after equality
  # fix deleting past result
end
