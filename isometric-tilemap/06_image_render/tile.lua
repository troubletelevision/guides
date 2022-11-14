local lib = require('lib')
local assets = require('assets')

-- a tile
return function(x, y, width, height, offsetX, offsetY)
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

			local scale = (width/1920)

			love.graphics.draw(
				assets:get('cube'),
				self.x()-(width/2),
				self.y()-height,
				0,
				scale,
				scale
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

		self.hovered = lib.point_in_polygon(
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