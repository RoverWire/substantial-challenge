describe 'rake parse' do
  before(:each) do
    Rake::Task.clear
    load File.expand_path('../../Rakefile', __dir__)
  end

  it 'performs file parsing' do
    argv = %w[parse -- -i spec/fixtures/sample-input.txt]
    str_output = rake_task_output('parse', argv)
    expect(str_output).to include('1. Tarantulas, 6 pts')
  end

  it 'can handle invalid files' do
    argv = %w[parse -- -i foo-file.txt]
    str_output = rake_task_output('parse', argv)
    expect(str_output).to eq("#{App.error_message(:invalid_file)}\n")
  end

  it 'can handle invalid options' do
    argv = %w[parse -- -x]
    str_output = rake_task_output('parse', argv)
    expect(str_output).to eq("#{App.error_message(:invalid_option)}\n")
  end

  it 'displays help options' do
    argv = %w[parse -- --help]
    str_output = rake_task_output('parse', argv)
    expect(str_output).to include('Usage: rake parse -- [options]')
  end
end
