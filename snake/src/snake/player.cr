require "raylib-cr"

class Player
  MAX_LENGTH = 256
  property position : Raylib::Vector2, size : Raylib::Vector2, speed : Raylib::Vector2, color : Raylib::Color

  def initialize(position, size, speed, color)
    @position = position
    @size = size
    @speed = speed
    @color = color
  end
end
