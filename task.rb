require 'date'
class Task < Post
  def initialize
    super
    @dui_date = Time.now
  end

  def read_from_console
    puts 'Что нужно сделать?'
    @text = STDIN.gets.strip

    puts 'До какого числа нужно это сделать'
    input = STDIN.gets.strip

    @dui_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"
    deadline = "Крайний срок: #{@dui_date}"
    return [deadline, @text, time_string]
  end
end
