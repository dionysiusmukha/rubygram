def students
  File.write('buffer.txt', File.read('info.txt'))
  stopFactorIs = false
  while !stopFactorIs
    puts "Введите возраст студента: "
    findAge = gets.to_i
    if findAge == -1
      stopFactorIs = true
    end

    if File.zero?('buffer.txt')
      stopFactorIs = true
    end

    unusingLines = []
    if !stopFactorIs
      File.foreach('buffer.txt') do |infStd|
        spltStr = infStd.split(' ')
        ageOfStd = spltStr[2]
        if ageOfStd.to_i == findAge
          File.open('result.txt', 'a') {|f| f.write infStd}
        else
          unusingLines << infStd
        end
      end
    end
    File.write('buffer.txt', unusingLines.join)
    if unusingLines.size == 0
      stopFactorIs = true
    end
  end
  puts 'Программа завершена'
end