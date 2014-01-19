class Player
  
  @@minimumHealth = 13

  def initialize()
    @health = 0
  end
 

  def play_turn(warrior)
    # add your code here

    rest = true
    #add check to see if remaning monsters. if not dont rest.
    #if (warrior.listen == 0)
    #  rest = false
    #end


    
    puts "@health:  #{@health} warhealth: #{warrior.health}"
    if (@health > warrior.health)
      rest = false
    end
    @health = warrior.health
    
    if (warrior.feel.captive?)
      warrior.rescue!
    elsif (warrior.feel.enemy?)
    	warrior.attack!
    elsif (warrior.health < @@minimumHealth && (rest))
    	warrior.rest!
    else
    	warrior.walk!
    end



  end
end
