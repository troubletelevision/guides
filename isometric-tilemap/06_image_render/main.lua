-- import tilemap
local tilemap = require('tilemap')(love.graphics.getPixelDimensions())

local assets = require('assets')

function love.load()
	--            | number tiles
	--            |   | tile width
	--            ↓   ↓   ↓ tile height
	tilemap:setup(10, 50, 25)

	assets:add('cube', love.graphics.newImage('cube.png'))
end

function love.mousemoved(mx, my)
	tilemap:mouseMoved(mx, my)
end

function love.draw() 
	love.graphics.clear()
	tilemap:draw()
end