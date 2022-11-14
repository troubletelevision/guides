local tile = require('tile')

-- a tilemap
return function(gameWidth, gameHeight)
	local tm = {tiles={}}

	function tm:setup(nTiles, tileWidth, tileHeight)
		for x=1,nTiles do
			for y=nTiles,1,-1 do
				table.insert(self.tiles, tile(
					x, 
					y, 
					tileWidth, 
					tileHeight, 
					(gameWidth/2) - (5*tileWidth), 
					(gameHeight/2)
				))
			end
		end
	end

	function tm:mouseMoved(mx, my)
		for _, tile in pairs(self.tiles) do
			tile:checkHover(mx, my)
		end
	end

	function tm:draw()
		for _, tile in pairs(self.tiles) do
			love.graphics.setColor(1, 1, 1)
			tile:draw()

			love.graphics.setColor(1, 0, 0)
			love.graphics.points(tile.x(), tile.y())
		end
	end

	return tm
end