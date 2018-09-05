
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

function moveBee(startx, starty, endx, endy, oldPos, stepNum)
	xDistance# = endx - startx
	yDistance# = endy - starty
	if iceSlide = 0 and iceOn = 0 then sizeAdd# = dRatio#*(stepNum*16-stepNum^2)/8
	SetSpriteSize(1001, tileSize*3/4, tileSize/2) //Resets size for use in equation
	SetSpritePosition(1001, startx+xDistance#*stepNum/16, starty+yDistance#*stepNum/16)
	
	if characterNum = 1
		if GetSpriteImageID(1001) <> beeFreeze then SetSpriteSize(1001, GetSpriteWidth(1001)+sizeAdd#, GetSpriteHeight(1001)+sizeAdd#)
		if GetSpriteImageID(1001) = beeNormal or GetSpriteImageID(1001) = beeWings
			if Mod(stepNum, 9) = 5 and GetSpriteImageID(1001) <> beeFreeze then SetSpriteImage(1001, beeNormal)
			if Mod(stepNum, 9) = 1 and GetSpriteImageID(1001) <> beeFreeze then SetSpriteImage(1001, beeWings)
		elseif GetSpriteImageID(1001) = beeRed or GetSpriteImageID(1001) = beeWingsRed
			if Mod(stepNum, 9) = 5 and GetSpriteImageID(1001) <> beeFreeze then SetSpriteImage(1001, beeRed)
			if Mod(stepNum, 9) = 1 and GetSpriteImageID(1001) <> beeFreeze then SetSpriteImage(1001, beeWingsRed)
		endif
	elseif characterNum = 2
		
	endif
	
	
	
	if stepNum = 1 and iceSlide = 0	//Num determines first color change
		mapx = Mod(1+oldPos, mapWidth)-Mod(oldPos/mapWidth,2)+1
		mapy = oldPos/mapWidth+2
		if map[mapx, mapy] = 1
			SetSpriteImage(oldPos+mapWidth+2-Mod(oldPos/mapWidth,2), LoadImage("space2.png"))
		elseif map[mapx, mapy] = 0
			SetSpriteImage(oldPos+mapWidth+2-Mod(oldPos/mapWidth,2), LoadImage("space0.png"))
		endif
	elseif stepNum = 9 and iceOn = 0 //Num determines second color change
		mapx = Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1
		mapy = beePosition/mapWidth+2
		if map[mapx, mapy] = 1
			SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space3.png"))
		elseif map[mapx, mapy] = 0
			SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space1.png"))
		elseif map[mapx, mapy] = 3
			SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space1.png"))
		endif
	endif
endfunction

function BeeWarp(pos)
	//Spaces need to change color
	PlaySound(warp)
	SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space7.png"))
	for i = 1 to 15	//Dissapearing
		SetSpriteColorAlpha(1001, 17*(15-i))
		
		BackgroundParticlesMove()
		Sleep(3)
		Sync()
	next
	//map
	SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space0.png"))
	beePosition = pos
	SetSpritePosition(1001, (Mod(beePosition, mapWidth)+1)*tileSize-Mod(beePosition/mapWidth,2)*tileSize/2+GetSpriteWidth(2)/2-GetSpriteWidth(1001)/2+xOffset, ((beePosition/mapWidth))*tileSize*3/4+GetSpriteHeight(2)/2+GetSpriteHeight(1001)/2*characterNum+yOffset)
	
	for i = 1 to 15	//Reappearing
		SetSpriteColorAlpha(1001, 17*i)
		
		BackgroundParticlesMove()
		Sleep(3)
		Sync()
	next
	SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space7.png"))
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
