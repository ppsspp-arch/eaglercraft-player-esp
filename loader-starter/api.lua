-- written for the VSCode lua typechecker
-- https://marketplace.visualstudio.com/items?itemName=sumneko.lua

-- describes the eaglerceaft lua API

-- things that probably should be part of the api but i could not find:
-- -- extended world.block results like facing and state
-- -- world.set( x:number, y:number, z:number, block:string, options:object)
-- -- faster interoperability (the lua layer is slow)
-- -- open-source implementation so this description can be easily extended
-- -- more overall control over entities, blocks, players and lower-level parts of the game
-- -- a help function, printing the API to the logs

---@alias itemstack {
--- 	id : string,
--- 	count : number,
--- 	damage : number,
--- 	maxDamage : number,
--- 	slot : number,
--- 	name : string,
---}


---@alias rayhit {
--- 	x : number,
--- 	y : number,
--- 	z : number,
--- 	id : string | nil,
--- 	side : string | nil,
--- 	type : string,
--- }

--- @alias entity {
--- 	x : number, 
--- 	y : number, 
--- 	z : number,
--- 	uuid : string,
--- 	distance : number,
--- 	health : number,
--- 	maxHealth : number,
--- 	name : string,
--- 	type : string,
--- 	isPlayer : boolean,
--- }



--- @alias effect {
--- 	amplifier : number,
--- 	duration : number,
--- 	id : string,
--- }


--- @alias screen { ... }




---@class player
--
-- Identity & Existence
---@field exists fun() : boolean
---@field gamemode fun() : string
---@field name fun( ) : string
---@field uuid fun( ) : string
--
-- Position & World
---@field biome fun( ) : string
---@field dimension fun( ) : string
---@field x fun( ) : number
---@field y fun( ) : number
---@field z fun( ) : number
---@field blockPos fun( ) : number -- same as Z
---@field eyePos fun( ) : number -- same as X
---@field pos fun( ) : number -- same as X
--
-- Rotation & Vision
---@field facing fun( ) : string
---@field lookingAt fun( ) : rayhit | entity
---@field pitch fun( ) : number
---@field setRotation fun( x, y, z ) : nil
---@field yaw fun( ) : number
--
-- Movement & Physics
---@field isFlying fun( ) : boolean
---@field isOnGround fun( ) : boolean
---@field isSneaking fun( ) : boolean
---@field isSprinting fun( ) : boolean
---@field isSwimming fun( ) : boolean
---@field jump fun( ) : nil
---@field setSprinting fun( sprinting : boolean ) : nil
---@field setVelocity fun( x : number, y : number, z : number ) : nil
---@field velocity fun( ) : number
--
-- Stats & Status
---@field effects fun( ) effect[]
---@field food fun( ) : number
---@field health fun( ) : number
---@field maxHealth fun( ) : number
---@field saturation fun( ) : number
---@field xpLevel fun( ) : number
---@field xpProgress fun( ) : number
--
-- Inventory & Actions
---@field armor fun( ) : number
---@field heldItem fun( ) : itemstack
---@field inventory fun( ) : itemstack[]
---@field offhandItem fun( ) : itemstack
---@field selectSlot fun( slot : number ) : nil
---@field selectedSlot fun( ) : number
---@field swing fun( ) : nil







---@class commands
---@field register fun( command : string, callback : fun( ) : nil, description : string ) : nil
---@field list fun( ) : table
---@field unregister fun( command : string ) : nil


---@class world
---@field biome fun( x : number, y : number, z : number ) : string
---@field time fun( ) : number
---@field players fun( ) : entity[]
---@field entities fun( ) : entity[]
---@field day fun( ) : number
---@field exists fun( ) : boolean
---@field timeOfDay fun( ) : number
---@field weather fun( ) : string
---@field light fun( x : number, y : number, z : number ) : number
---@field block fun( x : number, y : number, z : number ) : string | nil

---@class timer
---@field time fun( ) : number
---@field after fun( time : number, callback : fun( ) : nil ) : nil
---@field every fun( time : number, callback : fun( ) : nil ) : nil

---@class game
---@field isPaused fun( ) : boolean
---@field openChat fun( ) : nil
---@field isSinglePlayer fun( ) : boolean
---@field screen fun( ) : nil -- ?
---@field setOption fun( option : string, value : any ) : nil
---@field version fun( ) : string
---@field width fun( ) : number
---@field height fun( ) : number
---@field fps fun( ) : number
---@field inWorld fun( ) : boolean
---@field option fun( option : string ) : any
---@field scale fun( ) : nil
---@field server fun( ) : nil


---@class chat
---@field print fun( message : string ) : nil
---@field command fun( command : string ) : nil
---@field send fun( message : string ) : nil -- (sends in chat as current user)

---@class hud
---@field replace fun( ... ) : nil
---@field restore fun( ... ) : nil
---@field hide fun( ... ) : nil
---@field after fun( ... ) : nil
---@field isHidden fun( ... ) : boolean
---@field elements fun( ... ) : nil
---@field show fun( ... ) : nil
---@field removeLayer fun( ... ) : nil
---@field before fun( ... ) : nil
---@field add fun( ... ) : nil
---@field remove fun( ... ) : nil

---@class ui
---@field open fun ( screen : screen ) : nil
---@field close fun ( screen : screen ) : nil
---@field notify fun ( message : string ) : nil
---@field screen fun () : screen

---@enum event
---| "mouse_click"
---| "tick"
---| "frame"
---| "chat_receive"
---| "key


--- @alias mouse_click {
--- 	button : "left" | "right" | "middle",
--- 	action : "press" | "release",
--- 	x : number, -- screen
--- 	y : number, -- screen
--- 	cancelled : nil,
--- }

--- @alias key {
--- 	key : string,
--- 	action : "press" | "release",
--- 	cancelled : nil,
--- }

--- @alias chat_receive {
--- 	message : string,
--- 	cancelled : nil,
--- }

--- @alias tick table -- { ... }
--- @alias frame table -- { ... }

--- @alias eventData mouse_click | key | chat_receive | tick | frame



--- @alias on fun(event: event, handler: fun( eventData ) : nil) : nil



if on == nil then
	--- @type on
	on=nil
end


if commands == nil then
	--- @type commands
	commands = nil
end


if player == nil then
	--- @type player
	player = nil
end


if world == nil then
	--- @type world
	world = nil
end


if timer == nil then
	--- @type timer
	timer = nil
end


if game == nil then
	--- @type game
	game = nil
end


if chat == nil then
	--- @type chat
	chat = nil
end

-- [todo] scan and test the HUD api
if hud == nil then
	--- @type hud
	hud = nil
end
