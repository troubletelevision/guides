local tiles = {}

local gameWidth, gameHeight = love.graphics.getPixelDimensions()

local function tile(x, y, width, height, offsetX, offsetY)
	offsetX = offsetX or 10
	offsetY = offsetY or 10

	local t = {tx=x, ty=y}

	function t.x()
		return (x + y) * (width/2) + offsetX
	end

	function t.y()
		return (x - y) * (height/2) + offsetY
	end

	return t
end

for x=1,10 do
	for y=1,10 do
		table.insert(tiles, tile(x, y, 50, 25, (gameWidth/2) - (5*50), (gameHeight/2)))
	end
end

function love.draw() 
	love.graphics.clear()
	love.graphics.setColor(1, 0, 0)

	for _, tile in pairs(tiles) do
		love.graphics.points(tile.x(), tile.y())
	end
end