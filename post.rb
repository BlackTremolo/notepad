class Post
  def self.post_types
    [Memo, Task, Link]
  end

  def self.create(type_index)
    post_types[type_index].new
  end
  def initialize
    @text = nil
    @created_at = Time.now
  end
  #запись данных из консоли в нужные поля
  def read_from_console

  end

  #запись данных в массив строк
  def to_strings

  end

  #сохранение в файл
  def save
    file = File.new(file_path, 'w')

    for el in to_strings
      file.puts el
    end

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)
    file_name = @created_at.strftime("#{self.class.name}_%Y.%m.%d, %H:%M:%S")

    current_path + '/' + file_name
  end
  # PS: Весь набор методов, объявленных в родительском классе называется интерфейсом класса
  # Дети могут по–разному реализовывать методы, но они должны подчиняться общей идее
  # и набору функций, которые заявлены в базовом (родительском классе)
end