local tiles = {}

for x=1,10 do
	for y=1,10 do
		table.insert(tiles, {x=x, y=y})
	end
end

local offset = 10

function love.draw() 
	love.graphics.clear()
	love.graphics.setColor(1, 0, 0)

	for _, tile in pairs(tiles) do
		love.graphics.points(tile.x * offset, tile.y * offset)
	end
end