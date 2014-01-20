class Player
  
  @@minimumHealth = 16

  def initialize()
    @health = 0
    @xOffset = 0
    @yOffset = 0
    @captives = 1
    @reachedBack = false
    @killedEnemies = 0
    # hash that holds list of enemies that should be approached
    @meleeEnemies = Hash.new()
    @meleeEnemies = {"Thick Sludge" => true, "Archer" => true, "Captive" => true,}
    # minimum hp required to beat one of each enemy
    @minHP = Hash.new()
    @friendly = {"Thick Sludge" => 13, "Archer" => 5,  "Wizard" => 0}
  end
  
# notes

# need 13 hp to survive thick sludge

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

  # determines if it is safe to approach an archer
  def approachArcher?(health, look)
    a1 = (look[1].to_s == "Archer")
    a2 = (look[2].to_s == "Archer")
    if (a1 and !a2)
      if (health > 5)
        return true
      else
        return false
      end
    elsif (!a1 and a2)
      if (health > 8)
        return true
      else
        return false
      end
    elsif (a1 and a2)
      puts "-----------------------------------------"
      if (health > 16)
        return true
      else
        return false
      end
    end
  end

  # determine if there is a safe path to the stairs to eliminate wasted healing
  def safePathToStairs?(look)
    s0 = look[0]
    s1 = look[1]
    s2 = look[2]
    if (s0.stairs? or s1.stairs? or s2.stairs?)
      if (!(s1.enemy? or s2.enemy? or s0.enemy?))
        return true
      end
    else
      return false  
    end
  end  

  # determine if there is a safe path to a captive
  def safePathToCaptive?(look)
    s0 = look[0]
    s1 = look[1]
    s2 = look[2]
    if (s0.captive? or s1.captive? or s2.captive?)
      if (!(s1.enemy? or s2.enemy? or s0.enemy?))
        return true
      end
    else
      return false  
    end
  end  

  # look for objects of interest. go left first but prioritize captives
  # stop healing after 2 enemies killed
  


  def play_turn(warrior)
    # add your code here
    gatherInfo()
    #puts warrior.look
    beingAttacked = beingAttacked?(warrior.health)
    lowHealth = lowHealth?(warrior.health)
    


    puts "@health:  #{@health} warhealth: #{warrior.health}"
    
    @health = warrior.health
  
    
    # primary logic block
    
    # detect captives
    if (warrior.feel.captive?)
      warrior.rescue!
    elsif (warrior.feel(:backward).captive?)
      warrior.rescue!(:backward)
    # if there is a safe path to captives, prioritize that.
    elsif (safePathToCaptive?(warrior.look(:backward))) 
      warrior.walk!(:backward)
    elsif ((!@meleeEnemies[warrior.look[0].to_s]) and (!@meleeEnemies[warrior.look[1].to_s]) and ((warrior.look[1].to_s == "Wizard") or warrior.look[2].to_s == "Wizard"))
      warrior.shoot!
    elsif (warrior.feel.enemy?)
    	warrior.attack!
    # detect enemies behind the player
    elsif (warrior.feel(:backward).enemy?)
      warrior.pivot!
    # approach one or more archers if safe
    elsif (approachArcher?(warrior.health, warrior.look))
      warrior.walk!
    # rest when appropriate
    elsif (lowHealth and (!beingAttacked) and (!safePathToStairs?(warrior.look)))
    	warrior.rest!
    #elsif (warrior.feel(:backward).captive?)
    #  warrior.rescue!(:backward)
    else
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
