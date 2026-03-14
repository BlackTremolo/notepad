class Memo < Post
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
end