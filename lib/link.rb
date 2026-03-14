class Link < Post
  def initialize
    super
    @url = nil
  end

  def read_from_console
    puts 'Введите адрес ссылки'
    @url = STDIN.gets.strip

    puts 'Введите описание'
    @text = STDIN.gets.strip
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"
    return [@url, @text, time_string]
  end
end