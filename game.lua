  print("Welcome to Energy Quest! Use left(), right(), down(), and up() to move. Use print_grid() to show the grid, and get_energy() to get your current energy level.")

  --get locations of player and food
  local function get_x_location()
    return x_location
  end
  
  local function get_y_location()
    return y_location
  end
  
  local function get_x_food_location()
    return x_food_location
  end
  
  local function get_y_food_location()
    return y_food_location
  end
  
  local function get_energy()
    return energy
  end
  --set locations of player
  function set_x_location(x)
    x_location = x
  end
  
  function set_y_location(y)
    y_location = y
  end
  
  --moving along grid
  function up()
    move(0,1)
  end
  
  function down()
    move(0,-1)
  end
  
  function left()
    move(-1,0)
  end
  
  function right()
    move(1,0)
  end
  
  function move(x_incr, y_inrc)
    energy = energy -1
    new_x_location = get_x_location() + x_incr
    new_y_location = get_y_location() + y_incr
  
    --check if off grid/invalid move
    if new_x_location() > 5 or new_x_location() < 0 or new_y_location() > 5 or new_y_location < 0 then
      invalid_move()
      return
    else -- valid location, move player
       set_y_location(new_y_location)
       set_x_location(new_x_location)
    end
      
    --if player finds food
    if get_x_location() == get_x_food_location() and get_y_location() == get_y_food_location() then
      energy = energy + 20
      print("You found the food!")
      place_food()
    end
    
    -- if player runs out of energy
    if energy == 0 then
      quit()
    end
    
    -- if player wins game
    if energy >= 100 then
      win()
    end
  end
  
  --place food in new location on grid after being found
  function place_food()
    local x_food_location = math.random(5)
    local y_food_location = math.random(5)
    
    --redo if food and player in same spot
    if x_food_location == get_x_location() and y_food_location == get_y_location() then
      place_food()
    end
  end
  
  -- show the grid to the user
  function print_grid()
    for y_pos = 0, 5, 1 do
      for x_pos = 0, 5, 1 do
        --player is in this location
         if get_x_location() == x_pos and get_y_location() == y_pos then
           print("[X]")
         else --player is not in location
           print("[ ]")
         end
      end
      print "\n" -- end of row
    end
  end
  
  -- invalid move
  function invalid_move()
    print("Invalid move")
  end
  
  -- win game
  function win()
    print("Awesome, you win!")
    os.exit()
  end
  
  --lose game or quit
  function quit()
    print("Sorry, you lose.")
    os.exit()
  end 
  
   --player start in random location on 5x5 grid
  local x_location = math.random(5)
  local y_location = math.random(5)
  
  --food starts in random location on grid
  place_food()
  
  --starting energy
  local energy = 50