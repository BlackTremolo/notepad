require 'sqlite3'
require 'date'
class Post
  @@SQLITE_DB_FILE = 'notepad.sqlite'
  def self.post_types
    {'Memo' => Memo,'Task' => Task, 'Link' => Link}
  end

  def self.create(type)
    post_types[type].new
  end

  def self.find(type, id, limit)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)

    if !id.nil?
      db.results_as_hash = true

      result = db.execute("select * from posts where rowid=?", id)
      result = result[0] if result.is_a? Array
      db.close

      if result.empty?
        puts "Запись с id: #{id} не найдена"
        nil
      else
        post = create(result["type"])
        post.load_data(result)
        return post
      end
    else
      db.results_as_hash = false

      query = "select rowid, * from posts "
      query += "where type = :type " unless type.nil?
      query += "order by rowid desc "
      query += "limit :limit" unless limit.nil?

      statment = db.prepare(query)
      statment.bind_param('type', type) unless  type.nil?
      statment.bind_param('limit', limit) unless  limit.nil?

      result = statment.execute!
      statment.close
      db.close

      result
    end

  end
  def initialize
    @text = nil
    @created_at = (Time.now).to_s
  end
  #запись данных из консоли в нужные поля
  def read_from_console

  end

  #запись данных в массив строк
  def to_strings

  end

  #сохранение в файл
  def save_to_file
    file = File.new(file_path, 'w')

    for el in to_strings
      file.puts el
    end

    file.close
  end

  def file_path
    #current_path = File.dirname(__FILE__)
    file_name = @created_at.strftime("#{self.class.name}_%Y.%m.%d, %H:%M:%S")

    #current_path + "/blabla/#{self.class.name}/" + file_name
    "./blabla/#{self.class.name}/" + file_name
  end

  #сохранение в базу данных
  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)
    db.results_as_hash = true

    db.execute(
      "INSERT INTO posts (" + to_db_hash.keys.join(', ') + ")" +
      "VALUES (" + ('?,' * to_db_hash.keys.size).chomp(',') + ")",
      to_db_hash.values
    )
    insert_row_id = db.last_insert_row_id
    db.close

    insert_row_id
  end

  #записть данных в хэш
  def to_db_hash
    {
      'type': self.class.name,
      'created_at': @created_at,
      'text': @text
    }
  end

  def load_data(data_hash)
    @created_at = data_hash['created_at']
    @text = data_hash['text']
  end
  # PS: Весь набор методов, объявленных в родительском классе называется интерфейсом класса
  # Дети могут по–разному реализовывать методы, но они должны подчиняться общей идее
  # и набору функций, которые заявлены в базовом (родительском классе)
end