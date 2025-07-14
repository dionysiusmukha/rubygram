findAge = 21
File.foreach('info.txt') do |infStd|
        spltStr = infStd.split(' ')
        ageOfStd = spltStr[2]
        puts ageOfStd
        if ageOfStd.to_i == findAge
          File.open('result.txt', 'a') {|f| f.write infStd}
        end
end