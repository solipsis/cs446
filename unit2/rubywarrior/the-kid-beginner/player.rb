class Player
  
  def initialize()
    @health = 0
  end
  #@rest = true

  def play_turn(warrior)
    # add your code here
    rest = true
    puts "@health:  #{@health} warhealth: #{warrior.health}"
    if (@health > warrior.health)
      rest = false
    end
    @health = warrior.health
    if (warrior.feel.enemy?)
    	warrior.attack!
    elsif (warrior.health < 13 && (rest))
    	warrior.rest!
    else
    	warrior.walk!
    end



  end
end
