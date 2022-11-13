local tiles = {}
local funcs = require('lib')

local gameWidth, gameHeight = love.graphics.getPixelDimensions()

local function tile(x, y, width, height, offsetX, offsetY)
	offsetX = offsetX or 10
	offsetY = offsetY or 10

	local t = {tx=x, ty=y, hovered=false}

	function t.x()
		return (x + y) * (width/2) + offsetX
	end

	function t.y()
		return (x - y) * (height/2) + offsetY
	end

	function t:draw()
		local lx, ly = self.x() - width/2, self.y()
		local tx, ty = self.x(), self.y() - height/2
		local rx, ry = self.x() + width/2, self.y()
		local bx, by = self.x(), self.y() + height/2

		if self.hovered then
			love.graphics.polygon(
				'fill',
				lx, ly, 
				tx, ty, 
				rx, ry, 
				bx, by
			)
		else
			love.graphics.polygon(
				'line',
				lx, ly, 
				tx, ty, 
				rx, ry, 
				bx, by
			)
		end

		
	end

	function t:checkHover(mx, my)
		local lx, ly = self.x() - width/2, self.y()
		local tx, ty = self.x(), self.y() - height/2
		local rx, ry = self.x() + width/2, self.y()
		local bx, by = self.x(), self.y() + height/2

		self.hovered = funcs.point_in_polygon(
			{
				{x=lx, y=ly},
				{x=tx, y=ty},
				{x=rx, y=ry},
				{x=bx, y=by},
			},
			{x=mx, y=my}
		)
	end

	return t
end

for x=1,10 do
	for y=1,10 do
		table.insert(tiles, tile(x, y, 50, 25, (gameWidth/2) - (5*50), (gameHeight/2)))
	end
end

function love.mousemoved(mx, my)
	for _, tile in pairs(tiles) do
		tile:checkHover(mx, my)
	end
end

function love.draw() 
	love.graphics.clear()
	

	for _, tile in pairs(tiles) do
		love.graphics.setColor(1, 1, 1)
		tile:draw()

		love.graphics.setColor(1, 0, 0)
		love.graphics.points(tile.x(), tile.y())
	end
end