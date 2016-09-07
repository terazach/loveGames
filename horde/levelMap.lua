local tileW, tileH, tileset, quads, tileTable

function newMap(tileWidth, tileHeight, tilesetFile, tileString, quadInfo)
	tileW = tileWidth
	tileH = tileHeight
	tileset = love.graphics.newImage(tilesetFile)

	local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()

	quads = {}

	for _,info in ipairs(quadInfo) do
		quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tilesetW, tilesetH)
	end

	tileTable = {}

	local width = #(tileString:match("[^\n]+"))

	for x =1,width,1 do tileTable[x] = {} end

	local rowIndex,columnIndex = 1,1
	for row in tileString:gmatch("[^\n]+") do
		columnIndex =1
		for character in row:gmatch(".") do
			tileTable[columnIndex][rowIndex] = character
			columnIndex = columnIndex + 1
		end
		rowIndex=rowIndex+1
	end
end

function loadMap(file)
	love.filesystem.load(file)()
end

function drawMap()
	for columnIndex,column in ipairs(tileTable) do
		for rowIndex,char in ipairs(column) do
			local x,y = (columnIndex-1)*tileW, (rowIndex-1)*tileH
			love.graphics.draw(tileset, quads[char], x, y)
		end
	end
end