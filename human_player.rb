class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play_turn
    move = {}
    move['start'] = get_pos('start')
    move['end'] = get_pos('end')

    move
  end

  def get_pos(turn)
    puts "Enter your " + turn + " position: b2"
    pos = gets.chomp.split("")
    error_handling(pos)
    pos[0] = letter_to_num(pos[0].downcase)
    pos.map!(&:to_i)
  end

  private

    def error_handling(pos)
      format_error = ArgumentError.new "Please use this format: b2"
      letter_error = ArgumentError.new "First character must be a letter!"
      number_error = ArgumentError.new "Second character must be a number!"

      raise format_error unless pos.length == 2
      raise letter_error unless is_let(pos[0])
      raise number_error unless is_int(pos[1])
    end

    def letter_to_num(let)
      let.ord - 97
    end

    def is_int(str)
      str == str.to_i.to_s
    end

    def is_let(let)
      !(let =~ /[[:alpha:]]/).nil?
    end
end
