Pry.config.theme = "monokai"

prompt = "ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} * " }
]

def smart_colored(str)
  Pry.config.color ? "\e[32m#{str}\e[0m" : str
end

default_command_set = Pry::CommandSet.new do
  command 'pbcopy', 'Copy to clipboard' do |input|
    input = _pry_.last_result unless input
    IO.popen('pbcopy', 'r+') { |io| io.print input }
    output.puts %Q(=> "#{smart_colored(input)}")
  end

  command 'pbpaste', 'Paste clipboard' do
    `pbpaste`
  end
end

Pry.config.commands.import default_command_set
