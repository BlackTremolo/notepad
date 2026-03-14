class Post
  def self.post_types
    [Meme, Task, Link]
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

  end
  # PS: Весь набор методов, объявленных в родительском классе называется интерфейсом класса
  # Дети могут по–разному реализовывать методы, но они должны подчиняться общей идее
  # и набору функций, которые заявлены в базовом (родительском классе)
end