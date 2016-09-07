local tileString = [[
#########XX#########
#                  #
#                  #
#                  #
#                  #
X                  X
#                  #
#                  #
#                  #
#                  #
#########XX#########
]]

local quadInfo = { 
  { ' ',  0,  0 }, 
  { '#',  65,  0 },
  { 'X',  129,  0 }, 
}

newMap(64,64,'/res/hordetex.png', tileString, quadInfo)
