require_relative '../greeting'

RSpec.describe '#greeting' do
  it 'return if age less than 18' do
    allow($stdout).to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Denis", "Mukha", "15")
    expect(greeting).to eq("Привет, Denis Mukha. Тебе меньше 18, но начать учиться программировать никогда не рано")
  end
  it 'return if age more than 18 or equal' do
    allow($stdout).to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Denis", "Mukha", "21")
    expect(greeting).to eq("Привет, Denis Mukha. Самое время заняться делом!")
  end
end