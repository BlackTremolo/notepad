class Memo < Post
  def initialize
    super
  end
  def read_from_console
    puts 'Новая заметка. Чтобы закончить введите end'
    line = ''
    @text = []

    while line != 'end'
      line = STDIN.gets.strip
      @text << line
    end
    @text.pop
  end
  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"
    @text.unshift time_string
  end

  def to_db_hash
    super.merge(
      {
        'text': @text.join('\n\r')
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)
  end
end