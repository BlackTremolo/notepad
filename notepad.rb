require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'

puts 'Привет, я твой блокнот'
puts 'Что хотите записать в блокнот'

choices = Post.post_types
choice = -1
until choice >= 0 && choice < choices.size
  choices.each_with_index do |el, i|
    puts "#{i} - #{el}"
  end
  choice = STDIN.gets.to_i
end

entry = Post.create choice

entry.read_from_console
entry.save

puts 'Запись добавлена'