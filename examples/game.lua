---@diagnostic disable: undefined-global
require('libraries/class') -- import Class
require('libraries/match') -- Import Statements

WINDOW_HEIGHT = 480
WINDOW_WIDTH = 720
WINDOW_TITLE = 'Player Test with Lua Class'
FRAMERATE = 60

local player = {
posX = 360,
posY = 240,
speed = 3,
size = 10,
actions = {}}

--- @class player
--- @constructor 
--- 
--- Set Action
--- @param action string
--- @param key string
function player:setAction(action , key)
	--- Set Action
	---
	--- Parameters
	--- @params action : string
	--- @params key : string
	---
	--- Attributes
	--- @types actions : table (string | string)
	---
	
	self.actions[action] = key 
end

function player:getAction(action)
	--- Returns Action
	---
	--- Parameters
	--- @params action : string
	---
	--- Attributes
	--- @types actions : table (string | string)
	---
	--- Returns
	--- @returns action : string
	
	return self.actions[action]
end

function love.load()
	player:setAction('up', 'w')
	player:setAction('down', 's')
	player:setAction('left', 'a')
	player:setAction('right', 'd')
	
	local test = statement()
	test:addStatement('test-a', 'a')
	test:addStatement('test-b', true)
	test:setDefault('a default option')
	print(test:get('tt'))
	
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
	love.window.setTitle(WINDOW_TITLE)
end

function love.update(dt)
	--- Window Border Check
	if player.posX < 0 + player.size then
		player.posX = 0 + player.size
		
	elseif player.posX > WINDOW_WIDTH - player.size then
		player.posX = WINDOW_WIDTH - player.size
		
	elseif player.posY < 0 + player.size then
		player.posY = 0 + player.size
		
	elseif player.posY > WINDOW_HEIGHT - player.size then
		player.posY = WINDOW_HEIGHT - player.size
	end
	--- X Axis
	if love.keyboard.isDown(player:getAction('left')) then
		player.posX = player.posX - player.speed
		
	elseif love.keyboard.isDown(player:getAction('right')) then
		player.posX = player.posX + player.speed
	end
	--- Y Axis
	if love.keyboard.isDown(player:getAction('up')) then
		player.posY = player.posY - player.speed
		
	elseif love.keyboard.isDown(player:getAction('down')) then
		player.posY = player.posY + player.speed
	end
	--- Exit Game with Key
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end

function love.draw()
	--- @Info
	love.graphics.print(string.format('X: %s', player.posX), 10, 10)
	love.graphics.print(string.format('Y: %s', player.posY), 10, 30)
	
	--- @Player
	love.graphics.circle('fill', player.posX, player.posY, player.size)
end