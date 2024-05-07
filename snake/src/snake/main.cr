require "raylib-cr"

require "./board"
require "./fruit"
require "./player"

struct GameSettings
  def initialize(@screen_width : Int32, @screen_height : Int32)
  end
end

class Main
  SCREEN_WIDTH  = 800
  SCREEN_HEIGHT = 450
  SQUARE_SIZE   =  31

  getter :name

  def initialize(@name : String = "Snake game")
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
  def draw
    offset = Raylib::Vector2.new(
      x: SCREEN_WIDTH % SQUARE_SIZE,
      y: SCREEN_HEIGHT % SQUARE_SIZE
    )

    player = Player.new(
      position: Raylib::Vector2.new(x: offset.x / 2, y: offset.y / 2),
      size: Raylib::Vector2.new(x: SQUARE_SIZE, y: SQUARE_SIZE),
      speed: Raylib::Vector2.new(x: SQUARE_SIZE, y: 0),
      color: Raylib::BLUE
    )

    food = Fruit.new(
      position: Raylib::Vector2.new(x: offset.x / 2, y: offset.y / 2),
      size: Raylib::Vector2.new(x: SQUARE_SIZE, y: SQUARE_SIZE),
      active: true,
      color: Raylib::RED
    )

    Raylib.begin_drawing

    Raylib.clear_background(Raylib::RAYWHITE)

    index = 0
    while index < SCREEN_WIDTH / SQUARE_SIZE + 1
      Raylib.draw_line_v(
        Raylib::Vector2.new(x: (SQUARE_SIZE * index) + offset.x / 2, y: offset.y / 2),
        Raylib::Vector2.new(x: (SQUARE_SIZE * index) + offset.x / 2, y: SCREEN_HEIGHT - offset.y / 2),
        Raylib::GRAY
      )
      index += 1
    end

    index = 0
    while index < SCREEN_HEIGHT / SQUARE_SIZE + 1
      Raylib.draw_line_v(
        Raylib::Vector2.new(x: offset.x / 2, y: (SQUARE_SIZE * index) + offset.y / 2),
        Raylib::Vector2.new(x: SCREEN_WIDTH - offset.x / 2, y: (SQUARE_SIZE * index) + offset.y / 2),
        Raylib::GRAY
      )
      index += 1
    end

    Raylib.draw_rectangle_v(player.position, player.size, player.color)

    Raylib.end_drawing
  end
end
