local LuaUnit = require('luaunit')

TestGame = {} --class

    function TestGame:left()
        x = get_x_position()
        y = get_y_position()
        left()
        new_x = get_x_position()
        new_y = get_y_position()
        assert( x, new_x +1 )
        assert( y, new_y )
    end

    function Test:Game:offGrid()
      set_x_position(0)
      set_y_position(0)
      left()
      assert("Invalid Move")
    end
    
    function Test:Game:winGame()
      set_energy = 99

      local function setup_positions()
        placeFood()
        x_food = get_x_food_location()
        y_food = get_y_food_location()
        x = x_food
      end
  
      setup_positions()
      if y_food < 5 then
        y = y_food + 1
        down()
      else
        setup_positions()
      end
      
      assert("Awesome, you win!")
    end

-- class TestGame

LuaUnit:run()