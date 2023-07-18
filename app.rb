require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")   
player2 = Player.new("José")
puts 
while player1.life_points > 0 && player2.life_points > 0 do
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state
    puts
    puts "Passons à la phase d'attaque :"
    player1.attacks(player2)
    if player2.life_points <= 0
        break
    end
    puts    
    puts "José se défend!:"
    player2.attacks(player1) 
    if player1.life_points <= 0
        break
    end  
    puts
end
puts "Le combat est terminé"
puts 
puts "Rentre ton nom de joueur"
human_player_choose = gets.chomp 
humanplayer1 = HumanPlayer.new(human_player_choose)
humanplayer1.search_health_pack



# binding.pry

