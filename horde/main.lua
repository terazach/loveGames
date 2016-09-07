require 'levelMap'

playerX, playerY = 640, 360

function love.load()
	loadMap("maps/dev.lua")
end

function love.update(dt)
	--prototype player movement
	if love.keyboard.isDown("a") then
		playerX = playerX-120*dt
	end
	if love.keyboard.isDown("d") then
		playerX = playerX+120*dt
	end
	if love.keyboard.isDown("w") then
		playerY = playerY-120*dt
	end
	if love.keyboard.isDown("s") then
		playerY = playerY+120*dt
	end
end

function love.draw()
	drawMap()

	--placeholder player
	love.graphics.setColor(7,173,235)
	love.graphics.circle("fill", playerX, playerY, 16, 16)
	love.graphics.setColor(255,255,255)
end
