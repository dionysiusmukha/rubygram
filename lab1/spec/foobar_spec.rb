require_relative '../foobar'

RSpec.describe '#foobar' do
  it 'return second number if first is 20' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("20", "5")
    expect(foobar).to eq(5)
  end

  it 'return second number if first is 20' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("7", "20")
    expect(foobar).to eq(20)
  end

  it 'return sum if no number equal 20' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3", "4")
    expect(foobar).to eq(7)
  end
end