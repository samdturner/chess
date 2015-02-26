class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play_turn
    format_error = ArgumentError.new "Please use this format: x y"
    letter_error = ArgumentError.new "Only numbers!"
    move = {}

    puts "Enter your start position: x y"
    move["start"] = gets.chomp.split
    raise format_error unless move["start"].length == 2
    move["start"].each do |string|
      raise letter_error unless string == string.to_i.to_s
    end
    move["start"].map!(&:to_i)


    puts "Enter your end position: x y"
    move["end"] = gets.chomp.split.map(&:to_i)
    raise format_error unless move["end"].length == 2
    move["end"].each do |string|
      raise letter_error unless string == string.to_i.to_s
    end
    move["end"].map!(&:to_i)

    move
  end
end
