module RakeHelpers
  def rake_task_output(task_name, argv = [])
    stub_const('ARGV', argv) unless argv.empty?
    stdout = StringIO.new
    $stdout = stdout
    Rake::Task[task_name].invoke
    $stdout = STDOUT
    Rake::Task[task_name].reenable
    stdout.string
  end
end
