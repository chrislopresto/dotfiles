Pry.config.theme = "monokai"

prompt = "ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} * " }
]

default_command_set = Pry::CommandSet.new do
  command 'pbcopy', 'Copy to clipboard' do |input|
    input = _pry_.last_result unless input
    IO.popen('pbcopy', 'w') { |io| io << input }
    input
  end

  command 'pbpaste', 'Paste clipboard' do
    `pbpaste`
  end
end

Pry.config.commands.import default_command_set
