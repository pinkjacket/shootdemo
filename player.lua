Player = Object:extend()

function Player:new()
  self.image = love.graphics.newImage("img/panda.png")
  self.x = 300
  self.y = 20
  self.speed = 500
  self.width = self.image:getWidth()
end

function Player:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  end
  
  -- window width
  local window_width = love.graphics.getWidth()
  
  -- if x is too far left, set to 0
  if self.x < 0 then
    self.x = 0
    -- if too far to the right, set to window width
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end
end

function Player:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Player:keyPressed(key)
  if key == "space" then
    table.insert(listOfBullets, Bullet(self.x, self.y))
  end
end