require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------------"
puts "|Bienvenue sur \"ILS VEULENT TOUS MA POO\" |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "---------------------------------------------------"
puts
puts "Rentre ton nom de joueur"
human_player_choose = gets.chomp 
human_player = HumanPlayer.new(human_player_choose)

player1 = Player.new("José", 0)
player2 = Player.new("Josiane", 1)
ennemies = [player1, player2]

while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) 
    puts human_player.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    ennemies.each do |ennemie|
        ennemie.show_state
    end
    print "> "
    choose = gets.chomp
    case choose
    when "a"
        human_player.search_weapon
    when "s"
        human_player.search_health_pack
    when "0"
        human_player.attacks(player2)
    when "1"
        human_player.attacks(player1)
        puts    
        puts "Les autres joueurs attaquent"
        ennemies.each do |ennemie|
            if ennemie.life_points > 0
                ennemie.attacks(human_player)
            end
        end
    end
end
# binding.pry
puts "La partie est finie!"
if human_player.life_points < 0
    puts "Loser ! Tu as perdu !"
else 
    puts "BRAVO ! TU AS GAGNE !"
end
