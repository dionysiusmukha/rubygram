require_relative '../number_two'

RSpec.describe 'pokemons' do
  it 'returns array of hashes pokemons with name and color' do
    allow($stdout). to receive(:puts)
    allow_any_instance_of(Kernel).to receive(:gets).and_return('2', 'Pikachu','Yellow','Denis','Green')

    result = pokemonCharacteristics(howManyPokemons)

    expect(result). to eq([{name: 'Pikachu', color: 'Yellow'}, {name: 'Denis', color: 'Green'}])

  end
end