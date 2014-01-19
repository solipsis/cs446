class Player
  
  @@minimumHealth = 15

  def initialize()
    @health = 0
    @xOffset = 0
    @yOffset = 0
    @captives = 1
    @reachedBack = false
    # hash that holds list of enemies that should be approached
    @meleeEnemies = Hash.new()
    @meleeEnemies = {"Thick Sludge" => true, "Archer" => true, "Captive" => true,}
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

  def gatherInfo()
    #warrior.look
    #puts warrior.look
  end


  # look for objects of interest. go left first but prioritize captives
  # stop healing after 2 enemies killed
  


  def play_turn(warrior)
    # add your code here
    gatherInfo()
    puts warrior.look
    beingAttacked = beingAttacked?(warrior.health)
    lowHealth = lowHealth?(warrior.health)
    


    puts "@health:  #{@health} warhealth: #{warrior.health}"
    
    @health = warrior.health
  
    puts warrior.look[0].to_s
    puts warrior.look[1].to_s
    puts warrior.look[2].to_s

    if (warrior.feel.captive?)
      warrior.rescue!
    #elsif ((warrior.look[1].to_s == "Thick Sludge"))
     # puts "WIZARD YONUTOTUHNTOU"
    elsif ((!@meleeEnemies[warrior.look[0].to_s]) and (!@meleeEnemies[warrior.look[1].to_s]) and ((warrior.look[1].to_s == "Wizard") or warrior.look[2].to_s == "Wizard"))
      warrior.shoot!
    elsif (warrior.feel.enemy?)
    	warrior.attack!
    elsif (warrior.feel(:backward).enemy?)
      warrior.pivot!
    elsif (lowHealth && (!beingAttacked))
    	warrior.rest!
    elsif (warrior.feel(:backward).captive?)
      warrior.rescue!(:backward)
    else
      #if (!@reachedBack)
      #  warrior.walk!(:backward)
      #  if (warrior.feel(:backward).wall?)
      #    @reachedBack = true
      #  end
      if (warrior.feel.wall?) 
        warrior.pivot!
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
