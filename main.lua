local physics = require("physics")
physics.start()

local tapCount = 0

local background = display.newImageRect("Imagens/spacex.jpg", 630, 800)
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText(tapCount, display.contentCenterX, 20, native.systemFont, 40)

local solo = display.newImageRect("Imagens/meiaLua.png", 390, 108)
solo.x = display.contentCenterX
solo.y = display.contentHeight-10
physics.addBody(solo, "static", {friction=1})

local rocket = display.newImageRect("Imagens/rocket.png", 112, 112)
rocket.x = display.contentCenterX
rocket.y = display.contentCenterY
rocket.alpha = 0.8
physics.addBody(rocket, "dynamic", {radius=40, bounce=0.8})

local function quickRocket()
    rocket:applyLinearImpulse(0, -0.20, rocket.x, rocket.y)
    tapCount = tapCount + 1
    tapText.text = tapCount
end

rocket:addEventListener("tap", quickRocket)

local function onTouch(event)
	if(event.phase =="began")then
		if(event.x < rocket.x) then
		-- move to left
		rocket:setLinearVelocity(-20, -150)
		else
		-- move to right
		rocket:setLinearVelocity(20, -150)
		end
	end		
end
Runtime:addEventListener("touch", onTouch)