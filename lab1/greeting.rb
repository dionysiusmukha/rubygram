def greeting()
  puts "Введите имя"
  name = gets.chomp
  puts "Введите фамилию"
  lastname = gets.chomp
  puts "Введите возраст"
  age = gets.to_i
  if age < 18
    message = "Привет, #{name} #{lastname}. Тебе меньше 18, но начать учиться программировать никогда не рано"
  else
    message = "Привет, #{name} #{lastname}. Самое время заняться делом!"
  end

  puts message
  return message
end