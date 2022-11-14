local assets = {catalog={}}

function assets:add(name, image)
	self.catalog[name] = image
end

function assets:get(name)
	return self.catalog[name]
end

return assets