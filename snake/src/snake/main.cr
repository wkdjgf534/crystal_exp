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

  def initialize(@name : String = "Project")
  end

  def run!
    Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, name)
    Raylib.set_target_fps(60)

    until Raylib.close_window?
      draw
    end

    Raylib.close_window
  end

  def init
    @frames_counter = 0
    @game_over = false
    @pause = false
  end

  # Draw method
  private def draw
    Raylib.begin_drawing

    Raylib.clear_background(Raylib::RAYWHITE)
    Raylib.draw_text("Congrats! You created your first window!", 190, 200, 20, Raylib::LIGHTGRAY)

    Raylib.end_drawing
  end
end
