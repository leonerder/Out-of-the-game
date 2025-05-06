-- main.lua
-- Entry point for the Love2D game
push = require 'push' -- Import the push library
Class = require 'class' -- Import the class library

VIRTUAL_WIDTH = 320 -- Virtual width of the game window
VIRTUAL_HEIGHT = 200 -- Virtual height of the game window
WINDOW_WIDTH = 1280 -- Actual width of the game window
WINDOW_HEIGHT = 720 -- Actual height of the game window

STARTING_LENGTH = 5 -- Starting length of the snake
SNAKE_SIZE = 10 -- Size of each segment of the snake
STARTING_POS = {
    x = VIRTUAL_WIDTH / 2,
    y = VIRTUAL_HEIGHT / 2
} -- Starting position of the snake head

direction = 'right' -- Initial direction of the snake
snake = {} -- Table to hold the snake segments

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest') -- Set the default filter for graphics
    love.window.setTitle("Snake Game") -- Set the window title

    math.randomseed(os.time()) -- Seed the random number generator

    -- load fonts
    smallFont = love.graphics.newFont('retro.ttf', 8)
    bigFont = love.graphics.newFont('Howdy Koala.ttf', 16)
    -- end fonts

    -- setup Snake body, snake head
    for i = 1, STARTING_LENGTH do -- from 1 to STARTING_LENGTH 
        table.insert(snake, { -- Insert a new segment into the snake table
            x = STARTING_POS.x - (i * SNAKE_SIZE), -- Calculate the x position of the segment
            y = STARTING_POS.y -- Set the y position of the segment
        })
    end

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
    displaySnake() -- Call the function to display the snake

    -- displayTitle()
    displayFPS()
    push:apply("end") -- End the push library
end

function displaySnake()
    -- Display the snake on the screen
    for i, segment in ipairs(snake) do -- Iterate through each segment of the snake
        love.graphics.setColor(0, 255, 0, 255) -- Set color to green
        love.graphics.rectangle('fill', segment.x , segment.y , SNAKE_SIZE, SNAKE_SIZE) -- Draw each segment as a rectangle
    end
end

function displayTitle()
    love.graphics.setFont(bigFont) -- Set the font to bigFont
    love.graphics.print("Welcome to Snake Game!", VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, 0, 1, 1,
        bigFont:getWidth("Welcome to Snake Game!") / 2, bigFont:getHeight() / 2) -- Print the welcome message

end

function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end