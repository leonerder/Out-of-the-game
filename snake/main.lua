-- main.lua
-- Entry point for the Love2D game

function love.load()
    -- Initialize game state
    love.window.setTitle("Snake Game")
    love.window.setMode(800, 600) -- Set window size
end

function love.update(dt)
    -- Update game logic
end

function love.draw()
    -- Render game objects
    love.graphics.print("Welcome to Snake Game!", 300, 280)
end