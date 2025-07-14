START_BALANCE = 100.0
def show_balance
  balance = 0
  if File.zero?('balance.txt')
    File.open('balance.txt', 'a') {|f| f.write START_BALANCE}
    balance = START_BALANCE
  else
    arrayOfBalance = File.readlines('balance.txt').map {|line| line.chomp}
    balance = arrayOfBalance[0]
  end
  balance
end

def deposit
  puts 'Введите сумму для пополнения'
  sum = gets.to_i
  while sum <= 0
    puts 'Сумма должна быть больше нуля. Попробуйте ещё раз'
    sum = gets.to_i
  end
  if sum > 0
    File.write('balance.txt', "#{sum + show_balance.to_i}")
  end
  puts "#{sum} успешно внесены. Ваш баланс: #{show_balance}"
end

def withdraw
  puts 'Введите сумму для снятия'
  sum = gets.to_i
  now_balance = show_balance.to_i
  while sum <= 0 or sum > now_balance
    puts "Сумма должна быть больше нуля и меньше или равна текущему балансу:"
    sum = gets.to_i
  end
  if sum >= 0 and sum <= now_balance
    File.write('balance.txt', "#{show_balance.to_i - sum}")
  end
  puts "#{sum} списаны. Остаток: #{show_balance}"
end


puts 'Добрый день. Для использования терминала существуют команды:
D (deposit)
W (withdraw)
B (balance)
Q (quit)
'

userInput = gets.chomp.upcase
while userInput != 'Q'
    case userInput
    when 'D'
      deposit
    when 'W'
      withdraw
    when 'B'
      puts "Ваш баланс: #{show_balance}"
    else
      puts 'Вы ошиблись в написании команды'
    end
    puts 'Команды:
D (deposit)
W (withdraw)
B (balance)
Q (quit)
'
    userInput = gets.chomp.upcase
end 
puts 'Всего хорошего!'