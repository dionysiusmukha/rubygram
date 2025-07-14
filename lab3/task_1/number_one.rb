MAIN_FILE = 'guns.txt'
BUFFER = 'buffer.txt'

def index
  File.readlines(MAIN_FILE).map {|line| line.chomp}.each {|line| puts line}
end

def find(id)
  File.readlines(MAIN_FILE).each_with_index do |line, index|
    if index == id
      line.chomp
      break
    end
  end
end

def where(pattern)
  arrayWithPattern = []
  File.readlines(MAIN_FILE).map {|line| line.chomp}.each do |line|
    if line.include?(pattern)
      arrayWithPattern.push(line)
    end
  end
  arrayWithPattern
end

def update(id, text)
  buf = File.open(BUFFER, "w") 
  File.foreach(MAIN_FILE).with_index do |gun, index|
    if index == id
      buf.puts text
    else 
      buf.puts gun
    end
  end
  buf.close
  File.write(MAIN_FILE, File.read(BUFFER))
end

def delete(id)
  buf = File.open(BUFFER, "w")
  File.foreach(MAIN_FILE).with_index do |line, index|
    if index != id
      buf.puts line
    end
  end
  buf.close
  File.write(MAIN_FILE, File.read(BUFFER))
end

def create(name)
  File.open(MAIN_FILE, "a") {|f| f.write name}
end