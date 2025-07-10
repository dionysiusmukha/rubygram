require_relative '../number_one'

RSpec.describe '#transformator' do
  it 'returns number two to the power of size word if it ends in the letters CS (low register)' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel). to receive(:gets).and_return("Deniscs")
    expect(transformator). to eq(128)
  end
  it 'returns number two to the power of size word if it ends in the letters CS (up register)' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel). to receive(:gets).and_return("DenisCS")
    expect(transformator). to eq(128)
  end
  it 'returns number two to the power of size word if it ends in the letters CS (any register)' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel). to receive(:gets).and_return("DeniscS")
    expect(transformator). to eq(128)
  end

  it 'returns reversed word if it does not ends in the letter CS' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return("abc")
    expect(transformator). to eq("cba")
  end

end