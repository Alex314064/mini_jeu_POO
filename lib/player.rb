class Player
  attr_accessor :name, :life_points
  
  def initialize(player_name, number, life_points = 10)
    @name = player_name
    @life_points = life_points
    @number = number
  end
  def show_state
    puts "#{@number} - #{@name} a #{@life_points} points de vie"
  end
  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0 
      puts "le joueur #{@name} a été tué"
    end
  end
  def attacks(attacked_player)
    puts "#{@name} attaque #{attacked_player.name}" 
    damaged_inflicted = compute_damage 
    puts "il lui inflige #{damaged_inflicted} points de dommages"
    attacked_player.gets_damage(damaged_inflicted) 
  end
  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize(player_name) 
    @name = player_name 
    @life_points = 100
    @weapon_level = 1
  end
  
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end
  
  def compute_damage
    return rand(1..6) * @weapon_level
  end
  
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level 
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon_level
    else 
      puts "Damned... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  def search_health_pack
    health_pack_level = rand(1..6)
    if health_pack_level == 1
      puts "Tu n'as rien trouvé"
    elsif health_pack_level.between?(2, 5)
      @life_points += 50
      
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else 
      @life_points += 80 
      
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
    if @life_points > 100
      @life_points = 100
    end
  end
end 

