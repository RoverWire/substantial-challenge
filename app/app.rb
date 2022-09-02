class App
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
    order = 1
    data.each do |k, v|
      puts "#{order}. #{k}, #{v} #{v == 1 ? 'pt' : 'pts'}"
      order += 1
    end
  end

  def self.error_message(error)
    messages = {
      invalid_file: 'Invalid file name or file does not exists.',
      invalid_content: 'Invalid file contents.',
      empty_results: 'Empty board, there are no results.'
    }
    return '' unless messages.key? error

    "Parse Error: #{messages[error]}"
  end
end
