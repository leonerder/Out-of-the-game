-- main.lua
-- Entry point for the Love2D game
push = require 'push' -- Import the push library
Class = require 'class' -- Import the class library

VIRTUAL_WIDTH = 800 -- Virtual width of the game window
VIRTUAL_HEIGHT = 600 -- Virtual height of the game window
WINDOW_WIDTH = 1280 -- Actual width of the game window
WINDOW_HEIGHT = 720 -- Actual height of the game window

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest') -- Set the default filter for graphics
    love.window.setTitle("Snake Game") -- Set the window title

    math.randomseed(os.time()) -- Seed the random number generator

    -- load fonts
    smallFont = love.graphics.newFont('retro.ttf', 8)
    bigFont = love.graphics.newFont('Howdy Koala.ttf', 32)

    -- end fonts

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    }) -- Setup the screen using push

end

function love.update(dt)
    -- Update game logic
end

function love.draw()
    push:apply("start") -- Start the push library

    -- render background
    love.graphics.clear(0.1, 0.1, 0.1, 1) -- Clear the screen with dark grey color

    -- Render game objects
    love.graphics.setFont(bigFont) -- Set the font to bigFont
    love.graphics.print("Welcome to Snake Game!", VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 1, 1, bigFont:getWidth("Welcome to Snake Game!")/2, bigFont:getHeight()/2) -- Print the welcome message
     
    displayFPS()
    push:apply("end") -- End the push library
end

function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end