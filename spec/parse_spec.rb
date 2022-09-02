describe 'CLI parse' do
  it 'displays options by default' do
    expect { system %(ruby parse.rb) }
      .to output(a_string_including('Usage: parse.rb [options]'))
      .to_stdout_from_any_process
  end

  it 'can handle invalid options' do
    expect { system %(ruby parse.rb -x) }
      .to output(a_string_including(App.error_message(:invalid_option)))
      .to_stdout_from_any_process
  end

  it 'can handle invalid file names' do
    expect { system %(ruby parse.rb -i foo-file.txt) }
      .to output(a_string_including(App.error_message(:invalid_file)))
      .to_stdout_from_any_process
  end

  it 'performs a data parsing from file' do
    expect { system %(ruby parse.rb -i spec/fixtures/sample-input.txt) }
      .to output(a_string_including('1. Tarantulas, 6 pts'))
      .to_stdout_from_any_process
  end
end
