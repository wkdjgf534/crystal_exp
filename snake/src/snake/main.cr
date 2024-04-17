require "raylib-cr"

require "./food"
require "./player"

struct GameSettings
  def initialize(@screen_width : Int32, @screen_height : Int32)
  end
end

class Main
  SCREEN_WIDTH  = 800
  SCREEN_HEIGHT = 450

  getter :name

  def initialize(@name : String = "Snake")
  end

  def run!
    Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, name)
    Raylib.set_target_fps(60)
    init
    until Raylib.close_window?
      draw
    end

    Raylib.close_window
  end

  def init
  end

  # Draw method
  private def draw
    Raylib.begin_drawing

    Raylib.clear_background(Raylib::RAYWHITE)

    Raylib.end_drawing
  end
end
