#include "levelData.agc"
#include "movementData.agc"

// Project: HoneycombHavoc 
// Created: 2016-05-16

// set window properties
SetWindowTitle( "HoneycombHavoc" )
SetWindowSize( 1200, 675, 0 )          //Change this for exact resolution

global w as integer
w = GetDeviceWidth()
global h as integer
h = GetDeviceHeight()

//Game is based on horizontal ratio of 320
global dRatio# as integer
//dRatio# =  w/320
dRatio# = 1

// set display properties
SetVirtualResolution(w, h)
SetOrientationAllowed(1, 0, 0, 0)

//Font
global mainFont as integer
mainFont = LoadImage("mainFont.png")

//Sprite IDs
global beeNormal = 1
global beeFreeze = 2
global beeWings = 3
global beeRed = 4
global beeWingsRed = 5
LoadImage(beeNormal, "bee.png")
LoadImage(beeFreeze, "beeFreeze.png")
LoadImage(beeWings, "beeWings.png")
LoadImage(beeRed, "beeRed.png")
LoadImage(beeWingsRed, "beeWingsRed.png")

global jebNormal = 11
global jebFreeze = 12
//global jebWings = 13
global jebRed = 14
//global jebWingsRed = 15
LoadImage(jebNormal, "jeb.png")
LoadImage(jebFreeze, "jebFreeze.png")
//LoadImage(jebWings, "jebWings.png")
LoadImage(jebRed, "jebRed.png")
//LoadImage(jebWingsRed, "jebWingsRed.png")


//Sound IDs
global jump = 1
global clear = 2
global reset = 3
global jeb = 4
global warp = 5
LoadSound(jump, "jump.wav")
LoadSound(clear, "clear2.wav")
LoadSound(reset, "reset.wav")
LoadSound(jeb, "jeb.wav")
LoadSound(warp, "warp.wav")

//Music IDs
global music1 = 1
global music2 = 2
global music3 = 3
global music4 = 4
global music5 = 5
//LoadMusic(music1, "music1.mp3")
//LoadMusic(music2, "music2.mp3")
//LoadMusic(music3, "music3.mp3")
//LoadMusic(music4, "music4.mp3")
//LoadMusic(music5, "music5.mp3")

//Borrowed Button function
Function Button(sprite) 
returnValue = 0 `reset value for check
If GetPointerX() > GetSpriteXByOffset( sprite ) - ( GetSpriteWidth( sprite ) / 2 )
 If GetPointerX() < GetSpriteXByOffset( sprite ) + ( GetSpriteWidth( sprite ) / 2 )
   If GetPointerY() > GetSpriteYByOffset( sprite ) - ( GetSpriteHeight( sprite ) / 2 )
    If GetPointerY() < GetSpriteYByOffset( sprite ) + ( GetSpriteHeight( sprite ) / 2 )
      If GetPointerState() = 1
        returnValue = 1
      Endif
     Endif
   Endif
  Endif
Endif
EndFunction returnValue

function SaveData()
	OpenToWrite(1, "HHsave.txt")
	WriteInteger(1, currentLevel)
	WriteInteger(1, reachedLevel)
	WriteInteger(1, bestTime[1,1])
	WriteInteger(1, bestTime[2,1])
	WriteInteger(1, bestTime[3,1])
	WriteInteger(1, bestTime[4,1])
	WriteInteger(1, bestTime[5,1])
	WriteInteger(1, bestTime[1,2])
	WriteInteger(1, bestTime[2,2])
	WriteInteger(1, bestTime[3,2])
	WriteInteger(1, bestTime[4,2])
	WriteInteger(1, bestTime[5,2])
	WriteInteger(1, characterNum)
	WriteInteger(1, maxCharacterNum)
	CloseFile(1)
endfunction

function LoadData()
	OpenToRead(1, "HHsave.txt")
	currentLevel  = ReadInteger(1)
	reachedLevel  = ReadInteger(1)
	bestTime[1,1] = ReadInteger(1)
	bestTime[2,1] = ReadInteger(1)
	bestTime[3,1] = ReadInteger(1)
	bestTime[4,1] = ReadInteger(1)
	bestTime[5,1] = ReadInteger(1)
	bestTime[1,2] = ReadInteger(1)
	bestTime[2,2] = ReadInteger(1)
	bestTime[3,2] = ReadInteger(1)
	bestTime[4,2] = ReadInteger(1)
	bestTime[5,2] = ReadInteger(1)
	characterNum = ReadInteger(1)
	maxCharacterNum = ReadInteger(1)
	CloseFile(1)
endfunction

function ResetData()
	OpenToWrite(1, "HHsave.txt")
	WriteInteger(1, 0)
	CloseFile(1)
endfunction

//CreateSprite(1002, 0)
//SetSpriteColor(1002, 200, 200, 200, 255)
//SetSpriteSize(1002, w, h)

//CreateSprite(2001, LoadImage("background.jpg"))
//Background setup

//global volume = 50

function backgroundCreate()
	for i  = 2001 to 2008
		DeleteSprite(i)
	next i
	if w>h
		for i  = 2009 to 2015
			DeleteSprite(i)
		next i
	endif
	if backgroundNum = 1
		CreateSprite(2001, LoadImage("background1.png"))
		CreateSprite(2002, LoadImage("background2.png"))
		PlayMusic(music1, 1)
	elseif backgroundNum = 2
		CreateSprite(2001, LoadImage("background3.png"))
		CreateSprite(2002, LoadImage("background4.png"))
		PlayMusic(music2, 1)
	elseif backgroundNum = 3
		CreateSprite(2001, LoadImage("background5.png"))
		CreateSprite(2002, LoadImage("background6.png"))
		PlayMusic(music3, 1)
	elseif backgroundNum = 4
		CreateSprite(2001, LoadImage("background7.png"))
		CreateSprite(2002, LoadImage("background8.png"))
		PlayMusic(music4, 1)
	elseif backgroundNum = 5
		CreateSprite(2001, LoadImage("background9.png"))
		CreateSprite(2002, LoadImage("background10.png"))
		PlayMusic(music5, 1)
	endif	
	SetSpriteSize(2001, w, w)
	SetSpriteSize(2002, w, h-w)
	SetSpritePosition(2002, 0, w)
	SetSpriteDepth(2001, 9999)
	SetSpriteDepth(2002, 9999)
	for i = 2003 to 2008
		CreateSprite(i, LoadImage("particle"+Str(backgroundNum)+".png"))
		SetSpritePosition(i, Random(20*dRatio#,300*dRatio#), Random(80*dRatio#,h-30*dRatio#))
		size = Random(20*dRatio#, 60*dRatio#)
		SetSpriteSize(i, size, size)
		SetSpriteDepth(i, 9990)
	next i
	if w>h
		for i = 2009 to 2015
			CreateSprite(i, LoadImage("particle"+Str(backgroundNum)+".png"))
			SetSpritePosition(i, w-Random(20*dRatio#,300*dRatio#), Random(80*dRatio#,h-30*dRatio#))
			size = Random(20*dRatio#, 60*dRatio#)
			SetSpriteSize(i, size, size)
			SetSpriteDepth(i, 9990)
		next i
	endif
endfunction

function BackgroundParticlesMove()
	for i = 1 to 6
		if Mod(particleTheta, 180) < 90 then SetSpriteSize(i+2002, GetSpriteWidth(i+2002)+.1*dRatio#, GetSpriteHeight(i+2002)+.1*dRatio#)
		if Mod(particleTheta, 180) >= 90 then SetSpriteSize(i+2002, GetSpriteWidth(i+2002)-.1*dRatio#, GetSpriteHeight(i+2002)-.1*dRatio#)
		//SetSpriteSize()
		SetSpritePosition(i+2002, GetSpriteX(i+2002)-cos(particleTheta-1+60*i)*7*dRatio#+cos(particleTheta+60*i)*7*dRatio#, GetSpriteY(i+2002)-sin(particleTheta-1+60*i)*4*dRatio#+sin(particleTheta+60*i)*4*dRatio#)
	next i
	if w>h
		for i = 1 to 6
			if Mod(particleTheta, 180) < 90 then SetSpriteSize(i+2008, GetSpriteWidth(i+2008)+.1*dRatio#, GetSpriteHeight(i+2008)+.1*dRatio#)
			if Mod(particleTheta, 180) >= 90 then SetSpriteSize(i+2008, GetSpriteWidth(i+2008)-.1*dRatio#, GetSpriteHeight(i+2008)-.1*dRatio#)
			//SetSpriteSize()
			SetSpritePosition(i+2008, (GetSpriteX(i+2008)-cos(particleTheta-1+60*i)*7*dRatio#+cos(particleTheta+60*i)*7*dRatio#), GetSpriteY(i+2008)-sin(particleTheta-1+60*i)*4*dRatio#+sin(particleTheta+60*i)*4*dRatio#)
		next i
	endif
	
	particleTheta = particleTheta + 1
	if particleTheta = 360 then particleTheta = 0
endfunction

function CreateStatusBar()
	//Boarder
	CreateSprite(1004, 0)
	SetSpriteSize(1004, w, 88*dRatio#)
	SetSpriteDepth(1004, 1)
	CreateSprite(1005, 0)
	SetSpriteSize(1005, w-8*dRatio#, 80*dRatio#)
	SetSpritePosition(1005, 4*dRatio#, 4*dRatio#)
	SetSpriteColor(1005, 100, 100, 100, 255)
	SetSpriteDepth(1005, 1)
	//Text Border
	CreateSprite(1006, 0)
	SetSpriteSize(1006, 168*dRatio#, 68*dRatio#)
	SetSpritePosition(1006, w/2-GetSpriteWidth(1006)/2,  10*dRatio#)
	SetSpriteDepth(1006, 1)
	CreateSprite(1007, 0)
	SetSpriteSize(1007, 160*dRatio#, 60*dRatio#)
	SetSpritePosition(1007, w/2-GetSpriteWidth(1007)/2,  14*dRatio#)
	SetSpriteColor(1007, 50, 50, 50, 255)
	SetSpriteDepth(1007, 1)
	//Back button
	CreateSprite(1008, LoadImage("levelButton.png"))
	CreateSprite(1008, LoadImage("resetButton.png"))
	SetSpriteSize(1008, 60*dRatio#, 60*dRatio#)
	SetSpritePosition(1008, 10*dRatio#, 14*dRatio#)
	SetSpriteDepth(1008, 1)
	//Reset button
	CreateSprite(1003, LoadImage("resetButton.png"))
	SetSpriteSize(1003, 60*dRatio#, 60*dRatio#)
	SetSpritePosition(1003, w-70*dRatio#, 14*dRatio#)
	SetSpriteDepth(1003, 1)
	if currentLevel < 0
		SetSpriteImage(1008, LoadImage("backArrow.png"))
		SetSpriteImage(1003, LoadImage("forwardArrow.png"))
	endif
endfunction

function DrawTimer()
	DeleteText(801)
	DeleteText(802)
	levelTime = GetSeconds() - totalTime - initialTime
	totalTime = GetSeconds() - initialTime
	if totalTime > 60 and Mod(totalTime,60) < 10 then CreateText(801, Str(totalTime/60) + ":0" + Str(Mod(totalTime,60)))
	if totalTime >= 10 then CreateText(801, Str(totalTime/60) + ":" + Str(Mod(totalTime,60)))
	if totalTime < 10 then CreateText(801, "0:0" + Str(Mod(totalTime,60)))
	if totalTime <> 0
		if levelTime > 60 and Mod(levelTime,60) < 10 then CreateText(801, "+" + Str(levelTime/60) + ":0" + Str(Mod(levelTime,60)))
		if levelTime >= 10 then CreateText(802, "+" + Str(levelTime/60) + ":" + Str(Mod(levelTime,60)))
		if levelTime < 10 then CreateText(802, "+0:0" + Str(Mod(levelTime,60)))
	endif
	for i = 801 to 802
		SetTextFontImage(i, LoadImage("font.png"))
		SetTextSize(i, 30*dRatio#)
		SetTextPosition(i, GetSpriteX(802)+12*dRatio#+13*(802-i)*dRatio#, GetSpriteY(802)+8*dRatio#+30*(i-801)*dRatio#)
		SetTextDepth(i, 1)
	next i
endfunction


//CreateSprite(2001, LoadImage("background1.png"))
//SetSpriteSize(2001, h/GetSpriteWidth(2001)*1.0, h)

CreateSprite(1001, beeNormal) //Main character


global beePosition //Row is 8 added for each row, and colunm is 1 for each added
global mapWidth
global mapHeight
global tileSize
global currentLevel = 4
global reachedLevel = 50
global xOffset = 0
global yOffset

//global bestTime1 = 0
//global bestTime2 = 0
//global bestTime3 = 0
global bestTime as integer[5,2]
global timeTrialActive = 0
global initialTime = 0
global totalTime = 0 
global levelTime = 0

global characterNum = 0
global maxCharacterNum = 0
global jebTheta = 0


//ResetData()
//LoadData()

//Game initializing
global backgroundNum = 0
global particleTheta = 0

if characterNum = 0 or maxCharacterNum = 0
	characterNum = 1
	maxCharacterNum = 1
endif

if reachedLevel = 31 then currentLevel = 31

//To ensure that there is a background
backgroundNum = 3

if (currentLevel >= 0 and currentLevel <= 10) or currentLevel = -1 then backgroundNum = 1
if (currentLevel >= 11 and currentLevel <= 20) or currentLevel = -2 then backgroundNum = 2
if (currentLevel >= 21 and currentLevel <= 30) or currentLevel = -3 then backgroundNum = 3
if (currentLevel >= 31 and currentLevel <= 40) or currentLevel = -4 then backgroundNum = 4
if (currentLevel >= 41 and currentLevel <= 51) or currentLevel = -5 then backgroundNum = 5
backgroundCreate()
//EnableClearColor(0)

if currentLevel <> 0 then CreateStatusBar()

if currentLevel > 50
	currentLevel = -5
	SetSpriteImage(1008, LoadImage("backArrow.png"))
	SetSpriteImage(1003, LoadImage("forwardArrow.png"))
	SetSpriteVisible(1008, 1)
	SetSpriteVisible(1003, 0)
endif

createLevel(currentLevel)

CreateStatusBar()

//Resizing bee to fit level
SetSpriteSize(1001, tileSize*3/4, tileSize/2)





global beeStep = 0

global iceOn = 0
global iceSlide = 0
global iceTheta = 0

global levelTemp = 0

do
	
    SetSpriteDepth(1001, 1)
    
    if levelTemp = 0 and currentLevel < 0
		if currentLevel = -1 then CreateSprite(3, LoadImage("space2.png"))
		if currentLevel = -2 then CreateSprite(3, LoadImage("space4.png"))
		if currentLevel = -3 then CreateSprite(3, LoadImage("space-1.png"))
		if currentLevel = -4 then CreateSprite(3, LoadImage("space5.png"))
		if currentLevel = -5 then CreateSprite(3, LoadImage("space6.png"))
		SetSpriteDepth(3, 2)
		SetSpritePosition(3, GetSpriteX(5), GetSpriteY(5))
		SetSpriteSize(3, GetSpriteWidth(5), GetSpriteHeight(5))
		if reachedLevel < (-(currentLevel+1)*10)+4 then SetSpriteImage(3, LoadImage("space0.png"))
		levelTemp = 1
	endif
	
	//SetSpritePosition(1001, (Mod(beePosition, mapWidth)+1)*tileSize-Mod(beePosition/mapWidth,2)*tileSize/2+GetSpriteWidth(2)/2-GetSpriteWidth(1001)/2, ((beePosition/mapWidth)+1)*tileSize*3/4+GetSpriteHeight(2)/2+GetSpriteHeight(1001)/2)

	if GetPointerPressed() = 1 and currentLevel < 0
		for i = 1 to 10
			if Button(i+i/3-i/6+i/8-i/9) and reachedLevel >= i-(currentLevel+1)*10 then currentLevel = i-(currentLevel+1)*10
		next
		if currentLevel > 0
			levelTemp = 0
			SetSpriteImage(1008, LoadImage("levelButton.png"))
			SetSpriteImage(1003, LoadImage("resetButton.png"))
			SetSpriteVisible(1008, 1)
			SetSpriteVisible(1003, 1)
			DeleteSprite(3)
			deleteLevel()
			CreateLevel(currentLevel)
		endif
	endif
	
	if currentLevel > 0 and GetPointerY() > 88*dRatio# and beeStep = 0
		//For pressing keys
		keyPressed = 0
		theta = 7
		if GetRawKeyPressed(68) then theta = 0		//D
		if GetRawKeyPressed(69) then theta = 60		//E
		if GetRawKeyPressed(87) then theta = 120	//W
		if GetRawKeyPressed(65) then theta = 180	//A
		if GetRawKeyPressed(90) then theta = 240	//Z
		if GetRawKeyPressed(88) then theta = 320	//W
		if theta <> 7 then keyPressed = 1
		
		if (((GetPointerPressed() = 1 or keyPressed) and map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] <> -1) or iceSlide = 1)
			moveDistance = 1
			if GetSpriteImageID(1001) = beeRed or GetSpriteImageID(1001) = jebRed then moveDistance = 2
			iceSlide = 0
			x# = GetPointerX()
			y# = GetPointerY()
			if keyPressed = 0 then theta = getTheta(x#, y#, (GetSpriteX(1001)+GetSpriteWidth(1001)/2), (GetSpriteY(1001)+GetSpriteHeight(1001)/2))
			if characterNum = 2
				if (jebTheta > 330 or jebTheta <= 30) then theta = 0
				if (jebTheta > 30 and jebTheta <= 90) then theta = 60
				if (jebTheta > 90 and jebTheta <= 150) then theta = 120
				if (jebTheta > 150 and jebTheta <= 210) then theta = 180
				if (jebTheta > 210 and jebTheta <= 270) then theta = 240
				if (jebTheta > 270 and jebTheta <= 330) then theta = 320
				Sync()
			endif
			if map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = -1 then theta = iceTheta
			tempPos = beePosition
			moved = 0
		    //Checks if spot is yellow, add in turning to brown
			if (theta > 330 or theta <= 30) and Mod(beePosition+1*moveDistance,mapWidth) <> 0
				beePosition = beePosition + 1*moveDistance
				if characterNum = 1 then SetSpriteFlip(1001, 0, 0)
			elseif theta > 30 and theta <= 90 and ((GetSpriteImageID(1001) <> beeRed and GetSpriteImageID(1001) <> jebRed) or beePosition/mapWidth<>1) and (Mod(beePosition+1,mapWidth) <> 0 or Mod(beePosition/mapWidth, 2) <> 0) and beePosition/mapWidth <> 0
				beePosition = beePosition + 1*moveDistance + mapWidth*(Mod(beePosition/mapWidth, 2)-1)*moveDistance - (mapWidth+1)*(Mod(beePosition/mapWidth, 2))*moveDistance - moveDistance/2 + Mod(beePosition/mapWidth+2,2)*Mod(moveDistance+1, 2)*2
				if characterNum = 1 then SetSpriteFlip(1001, 0, 0)
			elseif theta > 90 and theta <= 150 and ((GetSpriteImageID(1001) <> beeRed and GetSpriteImageID(1001) <> jebRed) or beePosition/mapWidth<>1) and (Mod(beePosition,mapWidth) <> 0 or Mod(beePosition/mapWidth, 2) <> 0) and beePosition/mapWidth <> 0
				beePosition = beePosition - 1*moveDistance + (mapWidth-1)*(Mod(beePosition/mapWidth, 2)-1)*moveDistance - (mapWidth)*(Mod(beePosition/mapWidth, 2))*moveDistance - moveDistance/2 + Mod(beePosition/mapWidth+2,2)*Mod(moveDistance+1, 2)*2
				if characterNum = 1 then SetSpriteFlip(1001, 1, 0)
			elseif theta > 150 and theta <= 210 and Mod(beePosition,mapWidth) <> 0 //???
				beePosition = beePosition - 1*moveDistance
				if characterNum = 1 then SetSpriteFlip(1001, 1, 0)
			elseif theta > 210 and theta <= 270 and ((GetSpriteImageID(1001) <> beeRed and GetSpriteImageID(1001) <> jebRed) or beePosition/mapWidth<>mapHeight-3) and (Mod(beePosition,mapWidth) <> 0 or Mod(beePosition/mapWidth, 2) <> 0) and beePosition/mapWidth <> mapHeight-1
				beePosition = beePosition - 1*moveDistance - (mapWidth+1)*(Mod(beePosition/mapWidth, 2)-1)*moveDistance + (mapWidth)*(Mod(beePosition/mapWidth, 2))*moveDistance - moveDistance/2 + Mod(beePosition/mapWidth+2,2)*Mod(moveDistance+1, 2)*2
				if characterNum = 1 then SetSpriteFlip(1001, 1, 0)
			elseif theta > 270 and theta <= 330 and ((GetSpriteImageID(1001) <> beeRed and GetSpriteImageID(1001) <> jebRed) or beePosition/mapWidth<>mapHeight-3) and (Mod(beePosition+1,mapWidth) <> 0 or Mod(beePosition/mapWidth, 2) <> 0) and beePosition/mapWidth <> mapHeight-1
				beePosition = beePosition + 1*moveDistance - (mapWidth)*(Mod(beePosition/mapWidth, 2)-1)*moveDistance + (mapWidth-1)*(Mod(beePosition/mapWidth, 2))*moveDistance - moveDistance/2 + Mod(beePosition/mapWidth+2,2)*Mod(moveDistance+1, 2)*2
				if characterNum = 1 then SetSpriteFlip(1001, 0, 0)
			endif				//Odd rows are causing problems
			//if moveDistance = 1 or (beePosition/mapWidth+2 <> 3 and beePosition > tempPos)		//Stops from crashing
				if map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 0 or beePosition = tempPos
					beePosition = tempPos
				elseif map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = -1
					beeStep = 1
					iceOn = 1
					iceTheta = theta
					//jebTheta = theta
				else
					map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] - 1
					moved = 1
					beeStep = 1
					//jebTheta = theta
					//if map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 4 then SetSpriteImage(1001, beeRed)
					//^Make this delete red space and make bee red after moving	
						
					//PlaySound(jump)
				endif
			//endif
			if moved = 1
				//SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space1.png"))
				//SetSpriteImage(tempPos+mapWidth+2-Mod(tempPos/mapWidth,2), LoadImage("space0.png"))
			endif
		endif
	endif

	if beeStep = 0 and characterNum = 2 and GetSpriteImageID(1001) <> jebFreeze
		jebTheta = jebTheta + 4
		if jebTheta > 360 then jebTheta = Mod(jebTheta,360)
		SetSpriteAngle(1001, 360-jebTheta)
	endif

	if beeStep <> 0
		if beeStep = 1 and GetSpriteImageID(1001) <> beeFreeze and characterNum = 1 then PlaySound(jump)
		if beeStep = 1 and GetSpriteImageID(1001) <> jebFreeze and characterNum = 2 then PlaySound(jeb)
		moveBee(GetSpriteX(1001), GetSpriteY(1001), (Mod(beePosition, mapWidth)+1)*tileSize-Mod(beePosition/mapWidth,2)*tileSize/2+GetSpriteWidth(2)/2-GetSpriteWidth(1001)/2+xOffset, ((beePosition/mapWidth))*tileSize*3/4+GetSpriteHeight(2)/2+GetSpriteHeight(1001)/2*characterNum+yOffset, tempPos, beeStep)
		//if beeStep>8 then 
		//tilePhase(tempPos, beePosition, beeStep)
		beeStep = beeStep + 1
		if beeStep > 16 then beeStep = 0
	endif
	if beeStep = 16 //Does this at end of bee moving
		//PARTICLES START
		//CreateParticles(1, GetSpriteX(1001)+GetSpriteWidth(1001)/2, GetSpriteY(1001)+GetSpriteHeight(1001)/2)
		//SetParticlesImage(1, LoadImage("particle"+Str((currentLevel-1)/10+1)+".png"))
		//SetParticlesImage(1, LoadImage("particle5.png"))
		//SetParticlesLife(1, 1.5)
		//SetParticlesFrequency (1, 5)
		//PARTICLES END
		if GetSpriteImageID(1001) = beeFreeze then SetSpriteImage(1001, beeNormal)
		if GetSpriteImageID(1001) = jebFreeze then SetSpriteImage(1001, jebNormal)
		if iceOn = 1
			iceOn = 0
			iceSlide = 1
			if characterNum = 1 then SetSpriteImage(1001, beeFreeze)
			if characterNum = 2 then SetSpriteImage(1001, jebFreeze)
		endif
		mapCount = 0
		if (map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 0 or map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 1) and characterNum = 1 then SetSpriteImage(1001, beeNormal)
		if (map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 0 or map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 1) and characterNum = 2 then SetSpriteImage(1001, jebNormal)
		if map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 3	//Red space
			if characterNum = 1 then SetSpriteImage(1001, beeRed)
			if characterNum = 2 then SetSpriteImage(1001, jebRed)
			map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 0
		endif
		if map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 4	//Purple space
			if characterNum = 1 then SetSpriteImage(1001, beeNormal)
			if characterNum = 2 then SetSpriteImage(1001, jebNormal)
			map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 0
			for i = mapWidth to mapWidth*mapHeight-mapWidth	//Checks each map space for a warp tile
				if map[Mod(1+i, mapWidth)-Mod(i/mapWidth,2)+1, i/mapWidth+2] = 5
					//beePosition = i
					BeeWarp(i)
					map[Mod(1+i, mapWidth)-Mod(i/mapWidth,2)+1, i/mapWidth+2] = 0
					i = mapWidth*mapHeight-mapWidth
				endif
			next i
		endif
		for i = 1 to mapWidth
			for j = 1 to mapHeight
				if map[i,j] <= 0 then mapCount = mapCount + 1
			next j
		next i
		if mapCount = mapWidth*mapHeight
			Sync()
			Sleep(200)
			PlaySound(clear)
			currentLevel = currentLevel + 1
			if reachedLevel < currentLevel then reachedLevel = currentLevel
			
			if timeTrialActive = 1
				DrawTimer()
				//initialTime = 0
				//totalTime = 0 
				if Mod(currentLevel, 10) = 1
					timeTrialActive = 0
					DeleteSprite(801)
					DeleteSprite(802)
					DeleteText(801)
					DeleteText(802)
					if totalTime < bestTime[currentLevel/10,characterNum] or bestTime[currentLevel/10,characterNum] = 0 then bestTime[currentLevel/10,characterNum] = totalTime
					currentLevel = -currentLevel/10
					SetSpriteImage(1008, LoadImage("backArrow.png"))
					SetSpriteImage(1003, LoadImage("forwardArrow.png"))
					SetSpriteVisible(1008, 0)
					SetSpriteVisible(1003, 0)
				endif
			endif
			SaveData()
			
			//Background creation
			if currentLevel = 1 then backgroundNum = 1
			if currentLevel = 11 then backgroundNum = 2
			if currentLevel = 21 then backgroundNum = 3
			if currentLevel = 31 then backgroundNum = 4
			if currentLevel = 41 then backgroundNum = 5
			if Mod(currentLevel,10) = 1 then backgroundCreate()
			if currentLevel > 50
				currentLevel = -5
				SetSpriteImage(1008, LoadImage("backArrow.png"))
				SetSpriteImage(1003, LoadImage("forwardArrow.png"))
				SetSpriteVisible(1008, 0)
				SetSpriteVisible(1003, 0)
			endif
			deleteLevel()
			createLevel(currentLevel)
			//DeleteText(1)
			//CreateText(1, "Level " + Str(currentLevel))
			//SetTextSize(1, 30*dRatio#)
			//SetTextPosition(1, 30*dRatio#, 10*dRatio#)
			SetSpriteSize(1001, tileSize*3/4, tileSize/2)
		endif
		
	endif
	
	if timeTrialActive = 1 and GetTextColorAlpha(802) > 0 then SetTextColorAlpha(802, GetTextColorAlpha(802)-1)
	
	BackgroundParticlesMove()

	if Button(1008) = 1 
		if currentLevel > 0
			deleteLevel()
			SetSpriteImage(1008, LoadImage("backArrow.png"))
			SetSpriteImage(1003, LoadImage("forwardArrow.png"))
			SetSpriteVisible(1008, 0)
			SetSpriteVisible(1003, 0)
			currentLevel = -((currentLevel-1)/10+1)
			createLevel(currentLevel)
			timeTrialActive = 0
			DeleteSprite(801)
			DeleteSprite(802)
			DeleteText(801)
			DeleteText(802)
		elseif currentLevel < 0 and GetSpriteVisible(1008) = 1
			deleteLevel()
			currentLevel = currentLevel + 1
			backgroundNum = -currentLevel
			backgroundCreate()
			createLevel(currentLevel)
		endif
	endif

	if Button(1003) = 1
		if currentLevel > 0
			PlaySound(reset, 35)
			deleteLevel()
			createLevel(currentLevel)
		elseif currentLevel < 0 and GetSpriteVisible(1003) = 1
			deleteLevel()
			currentLevel = currentLevel - 1
			backgroundNum = -currentLevel
			backgroundCreate()
			createLevel(currentLevel)
		endif
	endif
	
	if Button(703)
		timeTrialActive = 1
		deleteLevel()
		currentLevel = -((currentLevel+1)*10)+1
		createLevel(currentLevel)
		CreateSprite(801, 0)
		SetSpritePosition(801, w/2-64*dRatio#, h-104*dRatio#)
		SetSpriteSize(801, w-(GetSpriteX(801)*2), 78*dRatio#)
		CreateSprite(802, 0)
		SetSpritePosition(802, w/2-60*dRatio#, h-100*dRatio#)
		SetSpriteSize(802, w-(GetSpriteX(802)*2), 70*dRatio#)
		SetSpriteColor(802, 64, 64, 64, 255)
		SetSpriteDepth(801, 1)
		SetSpriteDepth(802, 1)
		initialTime = GetSeconds()
		SetSpriteImage(1008, LoadImage("levelButton.png"))
		SetSpriteImage(1003, LoadImage("resetButton.png"))
		SetSpriteVisible(1008, 1)
		SetSpriteVisible(1003, 1)
		DrawTimer()
	endif
	
	if Button(711) and characterNum <> 1
		characterNum = 1
		CharacterButtons()
	endif
	
	if Button(713) and characterNum <> 2
		characterNum = 2
		CharacterButtons()
	endif
	
	//SetPrintColor(30, 255, 30)
    //Print(ScreenFPS())
    //Print(GetRawLastKey( ))
    //Print(theta)
    //Print(beePosition/mapWidth)
    //SetSyncRate(80, 0)		//Limits performance
   // Sleep(50)
    Sync()
loop

//Fix cursor on screen for key presses to work

//Recap world
//Switch spaces that change after every move
//Grey that gives you control over second bee that only moves when you do
//Underwater?
//Black space that turns lights off and leave you with a light

//Colors left:
//Dark Blue
//Pink
//Black
//Grey
//White

//Red space makes you red and you jump two spaces for the rest of the level
//Pink space makes you pink and then adds one to your next tile

//1, 2, 3, 6, 11, 12, 16, 21, 23, 27, 31, 35
