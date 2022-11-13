local tiles = {}

local function tile(x, y, offsetX, offsetY)
	offsetX = offsetX or 10
	offsetY = offsetY or 10

	local t = {tx=x, ty=y}

	function t.x()
		return (x + y) + offsetX
	end

	function t.y()
		return (x - y) + offsetY
	end

	return t
end

for x=1,10 do
	for y=1,10 do
		table.insert(tiles, tile(x, y))
	end
end

local offset = 10

function love.draw() 
	love.graphics.clear()
	love.graphics.setColor(1, 0, 0)

	for _, tile in pairs(tiles) do
		love.graphics.points(tile.x() * offset, tile.y() * offset)
	end
end