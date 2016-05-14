class MainController < UIViewController
  extend IB

  attr_accessor


  ## ib outlets
  outlet :display, UILabel


  def clear_entry(sender)
    puts "I wanna clear something"
  end


end
