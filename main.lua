-- This demo demonstates different modes of emitter.absolutePosition
-- see https://docs.coronalabs.com/api/type/EmitterObject/index.html#emitter-general for more details


local emitterParams = require "emitter"
local widget = require "widget"

-- create new Emitter
local emitter = display.newEmitter( emitterParams )

-- create circle
local circle = display.newCircle( 0, 0, 3)
circle:setFillColor( 0.5 )

-- attach Circle and Emitter to the group objectGroup
local objectGroup = display.newGroup( )
objectGroup:insert( emitter )
objectGroup:insert( circle )


-- move objectGroup between 4 points with transition library
local x1, y1 = 60, 90
local x2, y2 = 270, 270
local points = {{x=x2, y=y1} , {x=x2, y=y2} , {x=x1, y=y2} , {x=x1, y=y1} ,}
local curPoint = 0

local trans
local function moveToNextPoint(e)
	x,y = points[curPoint+1].x, points[curPoint+1].y
	curPoint = (curPoint+1)%#points
	local t = 1000 * math.sqrt( (objectGroup.x-x)*(objectGroup.x-x) + (objectGroup.y-y)*(objectGroup.y-y) ) / 111
	trans = transition.to( objectGroup, { x=x, y=y , onComplete=moveToNextPoint, time = t } )
end
moveToNextPoint()


-- create group "parent", this would be our background group, containing grid and objectGroup
local parent = display.newGroup()
display.newText( parent, "pan around to compare different modes", display.contentCenterX, 60, nil, 15 )

-- create grid lines
local gridSize = 30
for i=1,100 do
	local x = i*gridSize-50*gridSize
	local l = display.newLine(  x, -50*gridSize, x, 50*gridSize  )
	l:setStrokeColor( 1,1,1,0.2 )
	parent:insert( l )
end
for i=1,100 do
	local y = i*gridSize-50*gridSize
	local l = display.newLine(  -50*gridSize, y, 50*gridSize, y )
	l:setStrokeColor( 1,1,1,0.2 )
	parent:insert( l )
end

-- more visible grid lines where circle with emitter would go
local l = display.newLine(x1, y1, x1, y2, x2, y2, x2, y1, x1, y1)
l:setStrokeColor( 0.5 )
parent:insert(l)

-- insert circle and emitter to the parent group
parent:insert( objectGroup )
emitter.absolutePosition = parent -- IMPORTANT: assign absolutePosition = parent after inserting emitter into parent group

local parentX0, parentY0


-- when touch is performed, pan parent group
local function onTouch( event )
	if event.phase == "began" then
		parentX0 = event.x - parent.x
		parentY0 = event.y - parent.y
	elseif event.phase == "moved" then
		parent.x = event.x - parentX0
		parent.y = event.y - parentY0			
	end
	return true
end
Runtime:addEventListener( "touch", onTouch )


-- create 3 buttons to toggle between different absolutePosition modes

parent:insert(widget.newButton{
	x = 345,
	width = 90,
	height = 30,
	y = 120,
	label = "true",
	shape = "roundedRect",
	onRelease = function(  )
		emitter.absolutePosition = true
	end
})

parent:insert(widget.newButton{
	x = 345,
	width = 90,
	height = 30,
	y = 180,
	label = "false",
	shape = "roundedRect",
	onRelease = function(  )
		emitter.absolutePosition = false
	end
})


parent:insert(widget.newButton{
	x = 345,
	width = 90,
	height = 30,
	y = 240,
	label = "parent",
	shape = "roundedRect",
	onRelease = function(  )
		emitter.absolutePosition = parent
	end
})



