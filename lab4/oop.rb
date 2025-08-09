class CashMachine
  attr_accessor :balance
  def initialize(start_balance = 100)
    if File.exist?('balance.txt') && !File.zero?('balance.txt')
      @balance = File.read('balance.txt').to_i
    else
      @balance = start_balance
      save_balance
    end
    
  end

  def deposit
    puts 'Введите сумму для пополнения'
    sum = gets.to_i
    while sum <= 0
      puts 'Сумма должна быть больше нуля. Попробуйте ещё раз'
      sum = gets.to_i
    end
    if sum > 0
      @balance += sum
    end
    puts "#{sum} успешно внесены. Ваш баланс: #{@balance}"
    save_balance
  end

  def withdraw
    puts 'Введите сумму для снятия'
    sum = gets.to_i
    now_balance = @balance
    while sum <= 0 or sum > now_balance
      puts "Сумма должна быть больше нуля и меньше или равна текущему балансу:"
      sum = gets.to_i
    end
    if sum >= 0 and sum <= now_balance
      @balance -= sum
    end
    puts "#{sum} списаны. Остаток: #{@balance}"
    save_balance
  end

  def save_balance
    File.write('balance.txt', "#{@balance}")
  end

  def show_balance
    @balance
  end

  def self.init
    user = CashMachine.new()
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
          user.deposit
        when 'W'
          user.withdraw
        when 'B'
          puts "Ваш баланс: #{user.balance}"
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
  end
end
