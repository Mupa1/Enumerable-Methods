load 'enumerable.rb'

puts '****my_each****'
[1, 2, 3].my_each { |item| puts item * 2 }

puts '****my_each_with_index****'
[1, 2, 3].my_each_with_index { |item, index| puts "#{item} : #{index}" }
