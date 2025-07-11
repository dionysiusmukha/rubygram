#2. 👉 2. Написать скрипт, который будет выводить массив покемонов
=begin
-Спросит сколько добавить покемонов
-Указанное на предыдущем этапе число раз спросит имя и цвет каждого покемона
-Выведет в консоль массив содержащий хеши покемонов в формате [{ name: 'Pikachu', color: 'Yellow' }, … n times{}]
Код должен быть организован в методы
=end

def howManyPokemons()
  puts 'Сколько добавить покемонов?'
  quantityOfPokemons = gets.to_i
  quantityOfPokemons
end

def pokemonCharacteristics(quantityOfPokemons)
  pokemonArray = []
  for x in 1..quantityOfPokemons do
    puts 'Напишите имя покемона'
    name = gets.chomp
    puts 'Напишите цвет покемоана'
    color = gets.chomp
    pokemonCollection = {name: name, color: color}
    pokemonArray.push(pokemonCollection) 
  end
  pokemonArray
end

def printPokemons(pokemonArray)
  p pokemonArray
end

printPokemons(pokemonCharacteristics(howManyPokemons))