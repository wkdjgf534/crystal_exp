require "./snake/main"

# Snake
module Snake
  VERSION = {{ `shards version #{__DIR__}`.strip.stringify }}

  snake = Main.new
  snake.run!
end
