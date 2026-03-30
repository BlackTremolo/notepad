require 'date'
class Task < Post
  def initialize
    super
    @dui_date = Date.today
  end

  def read_from_console
    puts 'Что нужно сделать?'
    @text = STDIN.gets.strip

    puts 'До какого числа нужно это сделать(д.м.г)'
    input = STDIN.gets.strip
    @dui_date = Date.parse(input)
  end

  def to_strings
    time_string = "Создано: #{@created_at}\n"
    deadline = "Крайний срок: #{@dui_date}"
    return [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge(
      {
        'due_date': @dui_date.to_s
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @dui_date = Date.parse(data_hash['due_date']).to_s
  end
end
