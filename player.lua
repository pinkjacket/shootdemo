Player = Object:extend()

function Player:new()
  self.image = love.graphics.newImage("img/panda.png")
  self.x = 300
  self.y = 20
  self.speed = 500
end

function Player:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  end
end

function Player:draw()
  love.graphics.draw(self.image, self.x, self.y)
end