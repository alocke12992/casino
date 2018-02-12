class Table 
  attr_accessor :colors, :numbers 

  def initialize(colors, numbers, even)
    @colors = colors
    @numbers = numbers 
    @even = even
  end
end