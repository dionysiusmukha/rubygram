# 1. Написать скрипт, который будет принимать слово, если
# слово заканчивается на "CS" (в любом регистре) - выводит на
# экран цифру 2 в степени (длины введённого слова), если не
# заканчивается - выводит слово задом наперёд
def transformator()
  puts "Введите слово: "
   wordToTransform = gets.chomp
   wordToTransform = wordToTransform.downcase
   wordReverse = wordToTransform.reverse
   if wordToTransform.end_with?("cs")
     return 2**(wordToTransform.length)
   else
    return wordReverse
   end
end
