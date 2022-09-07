module App
  def self.run(file)
    unless BoardParser.valid_file?(file)
      puts error_message(:invalid_file)
      return false
    end

    handle_execution(file)
  end

  def self.handle_execution(file)
    board = BoardParser.new
    board.load_data(file)
    output(board.teams)
  rescue NoMethodError
    puts error_message(:invalid_content)
  end

  def self.output(data)
    order = 0
    last_value = 0
    data.each do |k, v|
      order += 1 unless last_value == v
      puts "#{order}. #{k}, #{v} #{v == 1 ? 'pt' : 'pts'}"
      last_value = v
    end
  end

  def self.error_message(error)
    messages = {
      empty_results: 'Empty board, there are no results.',
      invalid_content: 'Invalid file contents.',
      invalid_file: 'Invalid file name or file does not exists.',
      invalid_option: 'Invalid option, please try again or use -h for help'
    }
    return '' unless messages.key? error

    "Parse Error: #{messages[error]}"
  end
end
