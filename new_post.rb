require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'

puts 'Я твой блокнот'
puts 'Что хотите записать в блокнот'

choices = Post.post_types.keys

choice = -1
until choice >= 0 && choice < choices.size
  choices.each_with_index do |el, i|
    puts "#{i} - #{el}"
  end
  choice = STDIN.gets.to_i
end

entry = Post.create choices[choice]

entry.read_from_console

id = entry.save_to_db

puts "Запись добавлена , id: #{id}"