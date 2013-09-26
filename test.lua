local LuaUnit = require('luaunit')
require('game.lua')

TestGame = {} --class

	--test "left" move. todo: repeat for right, up, down
    function TestGame:Game:left()
    
    	--get starting positions and energy
        x = get_x_position()
        y = get_y_position()
        energy = get_energy()
        left() -- todo: check if invalid move
        
        --after moving, get new positions and energy
        new_x = get_x_position()
        new_y = get_y_position()
        new_energy = get_energy()
        assert( x, new_x +1 )
        assert( y, new_y )
        assert(energy, new_energy +1)
    end

	--test offgrid/invalid move
    function Test:Game:offGrid()
      set_x_position(0)
      set_y_position(0)
      left()
      assert("Invalid Move")
    end
    
    --test winning game
    function Test:Game:winGame()
      set_energy = 99

      local function setup_positions()
        placeFood()
        x_food = get_x_food_location()
        y_food = get_y_food_location()
        x = x_food
      end
  
      setup_positions()
      --move down into food position
      if y_food < 5 then
        y = y_food + 1
        down()
      else --repeat this step if moving down not possible
        setup_positions()
      end
      
      assert("Awesome, you win!")
    end

	--todo: losing game, finding food
-- class TestGame

LuaUnit:run()