class Player
  
  def play_turn(warrior)
    # add your code here
    
    if (warrior.feel.enemy?)
    	warrior.attack!
    elsif (warrior.health < 7)
    	warrior.rest!
    else
    	warrior.walk!
    	
    end

  end
end
