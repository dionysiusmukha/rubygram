def foobar()
  puts "Введите первое число"
  firstNumber = gets.to_i
  puts "Введите второе число"
  secondNumber = gets.to_i
  if firstNumber == 20 or secondNumber == 20
    return secondNumber
  else
    return firstNumber + secondNumber
  end
end
