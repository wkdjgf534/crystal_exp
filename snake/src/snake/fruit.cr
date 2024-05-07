require "raylib-cr"

class Fruit
  property position : Raylib::Vector2, size : Raylib::Vector2, active : Bool, color : Raylib::Color

  def initialize(position, size, active, color)
    @position = position
    @size = size
    @active = active
    @color = color
  end
end
