
function getTheta(x#, y#, xBase#, yBase#)
	x# = (x#-xBase#)
	y# = (y#-yBase#)
	if y# = 0 
		theta = 90
	else
		theta = ATan(x#/y#)
	endif
	if (-y# < 0)
		theta = theta + 180
	endif
endfunction theta+90

function moveBee(startx, starty, endx, endy, stepNum)
	xDistance# = endx - startx
	yDistance# = endy - starty
	sizeAdd# = dRatio#*(stepNum*16-stepNum^2)/8
	SetSpriteSize(1001, tileSize*3/4, tileSize/2) //Resets size for use in equation
	SetSpritePosition(1001, startx+xDistance#*stepNum/16, starty+yDistance#*stepNum/16)
	SetSpriteSize(1001, GetSpriteWidth(1001)+sizeAdd#, GetSpriteHeight(1001)+sizeAdd#)
	Sleep(1)
endfunction

function tilePhase(oldPos, newPos, stepNum)
	//All transparency sprites are taken out for sake of performance
	if stepNum = 1	//Num determines first color change
		mapx = Mod(1+oldPos, mapWidth)-Mod(oldPos/mapWidth,2)+1
		mapy = oldPos/mapWidth+2
		if map[mapx, mapy] = 1
			//CreateSprite(901, LoadImage("space3.png"))
			SetSpriteImage(oldPos+mapWidth+2-Mod(oldPos/mapWidth,2), LoadImage("space2.png"))
		elseif map[mapx, mapy] = 0
			//CreateSprite(901, LoadImage("space1.png"))
			SetSpriteImage(oldPos+mapWidth+2-Mod(oldPos/mapWidth,2), LoadImage("space0.png"))
		endif
		//SetSpritePosition(901, (mapx-1)*tileSize+Mod(mapy,2)*tileSize/2+xOffset, (mapy-1)*tileSize*3/4+yOffset)
		//SetSpriteSize(901, tileSize, tileSize)
	elseif stepNum = 9 //Num determines second color change
		mapx = Mod(1+newPos, mapWidth)-Mod(newPos/mapWidth,2)+1
		mapy = newPos/mapWidth+2
		if map[mapx, mapy] = 1
			//CreateSprite(902, LoadImage("space4.png"))
			SetSpriteImage(newPos+mapWidth+2-Mod(newPos/mapWidth,2), LoadImage("space3.png"))
		elseif map[mapx, mapy] = 0
			//CreateSprite(902, LoadImage("space2.png"))
			SetSpriteImage(newPos+mapWidth+2-Mod(newPos/mapWidth,2), LoadImage("space1.png"))
		endif
		//SetSpritePosition(902, (mapx-1)*tileSize+Mod(mapy,2)*tileSize/2+xOffset, (mapy-1)*tileSize*3/4+yOffset)
		//SetSpriteSize(902, tileSize, tileSize)
	endif
	//SetSpriteColorAlpha(901, 255/stepNum)
	//SetSpriteColorAlpha(902, 255/stepNum)
endfunction
