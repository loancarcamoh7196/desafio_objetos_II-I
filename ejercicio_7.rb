class MyPet

  def initialize(name)
    @name = name
    @sleep = false
    @satisfied = 10 # Esta lleno
    @fullIntestine = 0 # No necesita ir
    puts "La perrita #{@name} ha nacido."
  end
  
  def caminar
    puts "Sacas a pasear a #{@name} y va al baño."
    @satisfied -= 3
    @fullIntestine -= 4
    @sleep = false
    timeLapse
  end
  
  def comer
    puts "#{@name} se ha comido su comida."
    @satisfied += 6
    @fullIntestine += 2
    @sleep = false
    timeLapse
  end
  
  def dormir
    puts "#{@name} se ha dormido."
    @satisfied -= 3
    @fullIntestine += 4
    @sleep = true
    timeLapse
  end
  
  def needToGo?
    @fullIntestine >= 8
  end

  def hungry?
    @satisfied <= 2
  end
  
  def timeLapse
    if @satisfied > 0
      # Mueve el alimento del estomago al intestino.
      @satisfied = @satisfied - 1
      @fullIntestine = @fullIntestine + 1
    else # Nuestro mascota esta hambrienta!
        if @sleep
        @sleep = false
        puts "¡Se despierta de repente!"
        end
      puts "¡#{@name} esta hambriento! En su desesperacion, ¡Murio de Hambre!"
      exit # Sale del programa.
    end

    if @fullIntestine >= 10
      @fullIntestine = 0
      puts "¡Uy! #{@name} tuvo un accidente..."
    end
  
    if hungry?
      if @sleep
        @sleep = false
        puts "¡Se despierta de repente!"
      end
      puts "El estomago de #{@name} retumba..."
    end
  
    if needToGo?
      if @sleep
        @sleep = false
        puts "Se despierta de repente!"
      end
      puts "#{@name} hace la danza del baño..."
    end
  
  end
end
  
def menu
  puts "\n *-------------- Menu ------------------*"
  puts "1.- La sacas a pasear y va al baño."
  puts "2.- Alimenta a tu mascota."
  puts "3.- Tu mascota se va a dormir."
  puts "4.- Salir."
  puts "Escoje tu opción:"
end

  opcion = 5
  
while opcion != 4
  menu
  opcion = gets.chomp.to_i

  if opcion == 1
    mascota.caminar
  elsif opcion == 2
    mascota.comer
  elsif opcion == 3
    mascota.dormir
  else
      puts 'Esta opción no es válida.'
  end
end