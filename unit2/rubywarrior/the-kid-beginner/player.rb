class Player
  
  @@minimumHealth = 15

  def initialize()
    @health = 0
    @xOffset = 0
    @yOffset = 0
    @captives = 1
    @reachedBack = false
  end
  
  def beingAttacked?(wHealth) 
    if (@health > wHealth)
      return true
    end
    return false
  end


  def lowHealth?(wHealth)
    if (wHealth < @@minimumHealth)
      return true
    end
    return false
  end

  def play_turn(warrior)
    # add your code here

    beingAttacked = beingAttacked?(warrior.health)
    lowHealth = lowHealth?(warrior.health)
    rest = true




    #add check to see if remaning monsters. if not dont rest.
    
    #if (warrior.beingAttacked?())
    #  rest = false
    #end

    puts "@health:  #{@health} warhealth: #{warrior.health}"
    
    @health = warrior.health
  

    if (warrior.feel.captive?)
      warrior.rescue!
    elsif (warrior.feel.enemy?)
    	warrior.attack!
    elsif (lowHealth && (!beingAttacked))
    	warrior.rest!
    elsif (warrior.feel(:backward).captive?)
      warrior.rescue!(:backward)
    else
      if (!@reachedBack)
        warrior.walk!(:backward)
        if (warrior.feel(:backward).wall?)
          @reachedBack = true
        end
      else
        if (beingAttacked && (warrior.health < 8))
          warrior.walk!(:backward)
        else
    	   warrior.walk!
        end
      end
    end



  end
end
