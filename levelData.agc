
function createLevel(levelNum)
	mapWidth = 2
	mapHeight = 2 
	
	//Comment is for difficulty
	if levelNum < 0
		beePosition = 0
		mapWidth = 3
		mapHeight = 4
	elseif levelNum = 1		//0
		mapWidth = 5
		mapHeight = 5
	elseif levelNum = 2 	//1
		mapWidth = 5
		mapHeight = 7
	elseif levelNum = 3		//1
		mapWidth = 4
		mapHeight = 6
	elseif levelNum = 4 	//1
		mapWidth = 6
		mapHeight = 7
	elseif levelNum = 5		//1
		mapWidth = 5
		mapHeight = 10
	elseif levelNum = 6		//2
		mapWidth = 5
		mapHeight = 9
	elseif levelNum = 7 	//2
		mapWidth = 7
		mapHeight = 9
	elseif levelNum = 8		//4
		mapWidth = 8
		mapHeight = 10
	elseif levelNum = 9		//4
		mapWidth = 6
		mapHeight = 12
	elseif levelNum = 10	//3
		mapWidth = 9
		mapHeight = 9
	elseif levelNum = 11	//0
		mapWidth = 5
		mapHeight = 5
	elseif levelNum = 12	//1
		mapWidth = 6
		mapHeight = 7
	elseif levelNum = 13	//2
		mapWidth = 4
		mapHeight = 7
	elseif levelNum = 14	//2
		mapWidth = 5
		mapHeight = 7
	elseif levelNum = 15	//3
		mapWidth = 5
		mapHeight = 7
	elseif levelNum = 16	//4
		mapWidth = 7
		mapHeight = 8
	elseif levelNum = 17	//4
		mapWidth = 7
		mapHeight = 7
	elseif levelNum = 18	//3
		mapWidth = 10
		mapHeight = 7
	elseif levelNum = 19	//5
		mapWidth = 9
		mapHeight = 8
	elseif levelNum = 20	//5
		mapWidth = 8
		mapHeight = 10
	elseif levelNum = 21	//1
		mapWidth = 4
		mapHeight = 5
	elseif levelNum = 22	//1
		mapWidth = 5
		mapHeight = 5
	elseif levelNum = 23	//1
		mapWidth = 6
		mapHeight = 5
	elseif levelNum = 24	//1
		mapWidth = 8
		mapHeight = 10
	elseif levelNum = 25	//3
		mapWidth = 8
		mapHeight = 7
	elseif levelNum = 26	//4
		mapWidth = 6
		mapHeight = 7
	elseif levelNum = 27	// 2/3
		mapWidth = 9
		mapHeight = 7
	elseif levelNum = 28	//4
		mapWidth = 8
		mapHeight = 10
	elseif levelNum = 29	//4
		mapWidth = 8
		mapHeight = 9
	elseif levelNum = 29	//5
		mapWidth = 8
		mapHeight = 9
	elseif levelNum = 30	//4
		mapWidth = 10
		mapHeight = 9
	elseif levelNum = 31	//0
		mapWidth = 7
		mapHeight = 6
	elseif levelNum = 32	//2
		mapWidth = 5
		mapHeight = 5
	elseif levelNum = 33	//2
		mapWidth = 5
		mapHeight = 6
	elseif levelNum = 34	//2
		mapWidth = 6
		mapHeight = 7
	elseif levelNum = 35	//3
		mapWidth = 7
		mapHeight = 8
	elseif levelNum = 36	//3
		mapWidth = 10
		mapHeight = 5
	elseif levelNum = 37	//4
		mapWidth = 7
		mapHeight = 7
	elseif levelNum = 38	//4
		mapWidth = 6
		mapHeight = 10
	elseif levelNum = 39	//5
		mapWidth = 7
		mapHeight = 11
	elseif levelNum = 40	//5
		mapWidth = 9
		mapHeight = 9
	elseif levelNum = 41	//0
		mapWidth = 5
		mapHeight = 6
	elseif levelNum = 42	//1
		mapWidth = 5
		mapHeight = 5
	elseif levelNum = 43	//1
		mapWidth = 7
		mapHeight = 5
	elseif levelNum = 44	//2
		mapWidth = 7
		mapHeight = 7
	elseif levelNum = 45	//3
		mapWidth = 8
		mapHeight = 7
	elseif levelNum = 46	//3
		mapWidth = 9
		mapHeight = 6
	elseif levelNum = 47	//3
		mapWidth = 6
		mapHeight = 9
	elseif levelNum = 48	//4
		mapWidth = 9
		mapHeight = 7
	elseif levelNum = 49	//4
		mapWidth = 8
		mapHeight = 9
	elseif levelNum = 50	//4
		mapWidth = 9
		mapHeight = 9
	endif
	

	
	global map as integer[2,2]
	dim map[mapWidth,mapHeight]
	for i = 1 to mapWidth
	    for j = 1 to mapHeight
	        map[i,j] = 0
	    next j
	next i
	
	//Makes tiles fill screen horizonally
	if h > w then tileSize = w/(mapWidth+1) //Add .5 for 'perfect' screen fitting
	if h < w then tileSize = h/(mapHeight+1)
	
	
	//Individual level layouts
	if levelNum = 1
		beePosition = 1
		for i = 2 to 4
			for j = 2 to 4
				map[i,j] = 1
			next j
		next i
		map[3,3] = 0
		map[2,4] = 0
		map[2,2] = 0
	elseif levelNum = 2
		beePosition = 0
		for i = 2 to 4 
			map[i,2] = 1
			map[i,4] = 1
			map[i,6] = 1
		next i
		map[4,3] = 1
		map[2,5] = 1
	elseif levelNum = 3
		beePosition = 5
		for i = 2 to 3
			for j = 2 to 5
				map[i,j] = 1
			next j
		next i
	elseif levelNum = 4
		beePosition = 8
		for i = 2 to 5
			map[i,2] = 1
			map[i,3] = 1
			map[i,5] = 1
			map[i,6] = 1
		next i
		map[2,4] = 1
		map[5,4] = 1
	elseif levelNum = 5
		beePosition = 0
		for i = 2 to 9
			map[3,i] = 1
		next i
		map[2,2] = 1
		map[4,2] = 1
		map[2,3] = 1
		map[4,8] = 1
		map[2,9] = 1
		map[4,9] = 1
	elseif levelNum = 6
		beePosition = 0
		for i = 2 to 8
			map[2,i] = 1
			map[4,i] = 1
		next i
		map[3,2] = 1
		map[3,5] = 1
		map[3,8] = 1
	elseif levelNum = 7
		beePosition = 0
		for i = 2 to 6
			map[i,2] = 1
			map[i,4] = 1
			map[i,6] = 1
			map[i,8] = 1
		next i
		for j = 2 to 8
			map[2,j] = 1
			map[5,j] = 1
		next j
	elseif levelNum = 8
		beePosition = 1
		for i = 2 to 7
			map[i,2] = 1
			map[i,9] = 1
			map[2,i] = 1
			map[7,i] = 1
		next i
		map[7,8] = 1
		map[2,8] = 1
		map[7,9] = 0
		map[2,2] = 0
		for i = 3 to 8
			map[2+i/2,i] = 1
			map[3+i/2,10-i] = 1
		next i
		map[4,7] = 0
		map[7,3] = 1
	elseif levelNum = 9
		beePosition = 22
		for i = 2 to 5
			for j = 2 to 11
				map[i,j] = 1
			next j
		next i
		map[3,3] = 0
		map[4,4] = 0
		map[3,6] = 0
		map[5,6] = 0
		for i = 8 to 10
			map[i/2-1,i] = 0
		next i
		map[3,9] = 1
		map[4,8] = 0
	elseif levelNum = 10
		beePosition = 31
		for i = 2 to 8
			map[i,2] = 1
			map[i,8] = 1
			map[2,i] = 1
			map[8,i] = 1
		next i
		for i = 4 to 6
			map[i,4] = 1
			map[i,6] = 1
			map[4,i] = 1
			map[6,i] = 1
		next i
		map[5,5] = 1
		map[7,5] = 1
		map[5,7] = 1
		map[3,5] = 1
		map[5,3] = 1
		map[3,6] = 1
		map[4,6] = 0
		map[3,4] = 1
		map[4,4] = 0
		for i = 2 to 8 step 2
			map[2,i] = 0
		next i
	elseif levelNum = 11
		beePosition = 1
		for i = 2 to 4
			for j = 2 to 4
				map[i,j] = 2
			next j
		next i
		map[3,3] = 0
		map[2,4] = 0
		map[2,2] = 0
	elseif levelNum = 12
		beePosition = 0
		for i = 2 to 6
			map[i/2+1,i] = 1
		next i
		for i = 2 to 6
			map[4-(i-1)/2,i] = 1
		next i
		for i = 2 to 6
			map[5,i] = 1
		next i
		map[3,4] = 2
	elseif levelNum = 13
		beePosition = 16
		for i = 2 to 6
			map[2+Mod(i+1,2),i] = 2
		next i
		for i = 2 to 6
			map[2+Mod(i,2),i] = 1
		next i
	elseif levelNum = 14
		beePosition = 11
		for i = 2 to 6
			map[2,i] = 1
			map[3,i] = 2
			map[4,i] = 1
		next i
	elseif levelNum = 15
		beePosition = 11
		for i = 2 to 4
			map[i,3] = 1
			map[i,5] = 1
		next i
		for i = 2 to 4
			map[i,2] = 2
			map[i,4] = 2
			map[i,6] = 2
		next i
	elseif levelNum = 16
		beePosition = 16
		for i = 2 to 7
			map[2,i] = 1
			map[4,i] = 1
			map[6,i] = 1
		next i
		map[3,2] = 2
		map[5,2] = 2
		map[3,7] = 2
		map[5,7] = 2
	elseif levelNum = 17
		beePosition = 14
		for i = 2 to 6
			map[2,i] = 1
			map[6,i] = 1
			map[i,2] = 1
			map[i,6] = 1
		next i
		map[2,2] = 0
		map[2,6] = 0
		map[2,4] = 2
		map[3,4] = 1
		map[4,4] = 2
		map[4,3] = 1
		map[4,5] = 1
		map[5,2] = 1
		map[5,6] = 1
	elseif levelNum = 18
		beePosition = 27
		for i = 2 to 8
			map[i,2] = 2
			map[i,4] = 2
			map[i,6] = 2
		next i
		for i = 2 to 6
			map[2,i] = 1
			map[5,i] = 1
			map[8,i] = 1
		next i
		map[2,4] = 0
		map[3,4] = 1
		map[5,4] = 2
		map[6,4] = 1
		map[8,4] = 2
		map[9,4] = 1
	elseif levelNum = 19
		beePosition = 48
		for i = 3 to 7
			map[i,2] = 1
			map[i,7] = 1
			map[1+(i+2)/3,i] = 1
			map[10-(1+(i+2)/3),9-i] = 1
		next i
		map[4,5] = 1
		map[6,4] = 1
		map[4,3] = 2
		map[6,6] = 2
		map[5,5] = 2
		map[5,4] = 2
		map[3,5] = 2
		map[7,4] = 2
	elseif levelNum = 20
		beePosition = 59
		for i = 2 to 7
			map[i,i] = 2
			map[9-i,i] = 2
			map[i,8] = 1
			map[i,9]= 2
		next i
		map[7,9] = 0
		map[2,3] = 2
		map[7,6] = 2
		map[5,3] = 2
		map[4,6] = 2
		map[2,2] = 1
		map[7,2] = 1
		map[2,4] = 1
		map[2,5] = 1
		map[7,4] = 1
		map[7,5] = 1
	elseif levelNum = 21
		beePosition = 0
		for i = 2 to 3
			map[i,2] = 1
			map[i,4] = 1
		next i
		map[2,3] = -1
	elseif levelNum = 22
		beePosition = 2
		for i = 2 to 4
			for j = 2 to 4
				map[i,j] = 1
			next j
		next i
		map[3,3] = -1
		map[2,4] = 0
		map[2,2] = 0
		map[4,2] = 2
		map[2,3] = 2
		map[3,4] = 2
	elseif levelNum = 23
		beePosition = 7
		for i = 2 to 5
			map[i,2] = 1
			map[i,3] = -1
			map[i,4] = 1
		next i
		map[2,3] = 2
	elseif levelNum = 24
		beePosition = 57
		for i = 3 to 7
			map[i,2] = -1
			map[i,3] = -1
			map[i,4] = -1
		next i
		map[2,3] = -1
		for i = 5 to 9
			map[i/2+3,i] = 1
			map[10-((i+1)/2+3),i] = 1
		next i
		map[3,3] = 1
		map[6,3] = 1
		map[4,5] = 2
		map[5,5] = 2
		map[5,6] = 2
	elseif levelNum = 25
		beePosition = 0
		for i = 3 to 7 step 2
			for j = 2 to 7 step 2
				map[i,j] = -1
				map[i-1,j] = 1
				map[i-1,j+1] = 1
			next j
		next i
		for i = 2 to 7
			map[i,7] = 0
		next i
		map[4,4] = 2
	elseif levelNum = 26
		beePosition = 2
		for i = 3 to 6
			map[4,i] = -1
			map[5,i] = 1
		next i
		for i = 3 to 5
			map[i,2] = 2
		next i
		map[3,6] = 2
		map[5,6] = 2
		map[3,4] = 2
		map[5,4] = 2
		map[3,3] = -1
		map[3,5] = -1
		map[2,3] = 1
		map[2,5] = 1	
	elseif levelNum = 27
		beePosition = 1
		for i = 2 to 8
			map[i,2] = 1
			map[i,3] = 1
			map[i,5] = 1
			map[i,6] = 1
		next i
		map[4,3] = -1
		map[5,3] = -1
		map[5,4] = -1
		map[4,5] = -1
		map[5,5] = -1
		map[8,3] = 0
		map[8,5] = 0
		map[3,3] = 2
		map[6,3] = 2
		map[3,5] = 2
		map[6,5] = 2
		map[5,2] = 0
		map[5,6] = 0
	elseif levelNum = 28
		beePosition = 21
		for i = 2 to 7
			for j = 2 to 9
				map[i,j] = -1
			next j
		next i
		map[7,4] = 2
		map[3,5] = 2
		map[4,5] = 1
		map[6,6] = 1
		map[5,7] = 2
		map[5,8] = 1
		map[2,7] = 1
		map[6,2] = 2
		map[3,2] = 1
	elseif levelNum = 29
		beePosition = 1
		for i = 3 to 5
			map[i,5]  = -1
		next i
		for i = 3 to 6
			map[i,2] = 1
			map[i,8] = 1
			map[2,i] = 1
			map[7-Mod(i,2),i] = 1
		next i
		map[2,7] = 1
		map[6,7] = 1
		map[4,4] = -1
		map[5,4] = -1
		map[4,6] = -1
		map[5,6] = -1
		map[4,5] = 1
		map[3,3] = 2
		map[5,3] = 2
		map[3,7] = 2
		map[5,7] = 2
		map[2,5] = 2
		map[6,5] = 2
	elseif	levelNum = 30
		beePosition = 34
		for i = 2 to 9
			map[i,2] = 1
			map[i,8] = 1
			map[i,3] = 1
			map[i,7] = 1
		next i
		for i = 2 to 8
			map[1+i/2,i] = 1
			map[5+i/2,i] = 1
		next i
		map[4,4] = 1
		map[3,6] = 1
		map[7,6] = 1
		map[8,4] = 1
		map[5,3] = 0
		map[9,3] = 0
		map[5,7] = 0
		map[9,7] = 0
		map[4,5] = -1
		map[5,6] = -1
		map[6,6] = -1
		map[6,5] = -1
		map[5,4] = -1
		map[6,4] = -1
		map[5,5] = 2
		map[3,3] = 0
		map[7,3] = 0
		map[3,7] = 0
		map[7,7] = 0
	elseif levelNum = 31
		beePosition = 0
		for i = 2 to 6
			map[i,2] = 1
			map[i,5] = 1
		next i
		map[4,2] = 4
		map[5,2] = 0
		map[6,3] = 4
		map[2,5] = 4
		map[4,5] = 2
		map[6,5] = 0
	elseif levelNum = 32
		beePosition = 6
		for i = 2 to 4
			for j = 2 to 4
				map[i,j] = 1
			next j
		next i
		map[3,3] = 0
		map[2,4] = 0
		map[2,2] = 0
		map[3,4] = 4
		map[4,4] = 4
	elseif levelNum = 33
		beePosition = 7
		for i = 2 to 5 step 2
			map[2,i+1] = 4
			map[4,i] = 4
		next i
		map[3,3] = 2
		map[3,4] = 2
		map[3,2] = 1
		map[4,3] = 1
	elseif levelNum = 34
		beePosition = 7
		for i = 2 to 6
			map[4,i] = 1
			map[2+Mod(i+1,2),i] = 1
		next i
		for i = 3 to 4
			map[i,2] = 4
			map[i,4] = 2
			map[i,6] = 4
		next i
	elseif levelNum = 35
		beePosition = 36
		for i = 2 to 7
			map[i/2+2, i] = 4
		next 
		map[5,6] = -1
		map[3,3] = -1
		map[3,6] = 4
		map[3,7] = 1
		map[2,7] = 1
		map[6,2] = 1
		map[5,2] = 1
		map[5,3] = 4
	elseif levelNum = 36
		beePosition = 11
		for i = 2 to 9 step 2
			map[i,2] = 4
			map[i+1,2] = 1
			map[i,3] = 2
			map[i+1,3] = -1
			map[i,4] = 4
			map[i+1,4] = 1
		next i
	elseif levelNum = 37
		beePosition = 2
		for i = 2 to 6
			map[i,2] = 1
			map[i,3] = 1
			map[i,5] = 1
			map[i,6] = 1
		next i
		map[2,3] = 4
		map[4,3] = 4
		map[6,3] = 4
		map[2,5] = 4
		map[4,5] = 4
		map[6,5] = 4
	elseif levelNum = 38
		beePosition = 19
		for i = 2 to 5
			map[4,i] = -1
			map[3,i+4] = -1
			map[1+(i+2)/2,i+2] = 4
		next i
		map[3,3] = 2
		map[2,5] = 2
		map[3,4] = 2
		map[5,6] = 2
		map[4,8] = 2
		map[4,7] = 2
	elseif levelNum = 39
		beePosition = 32
		for i = 2 to 10
			map[1+i/2,i] = 4
			map[6-(i-1)/2,i] = 4
		next i
		map[6,6] = 1
		map[5,6] = 1
		map[4,2] = 2
		map[4,3] = 2
		map[3,3] = 2
		map[4,10] = 2
		map[4,9] = 2
		map[3,9] = 2
		map[6,2] = 0
		map[6,10] = 0
	elseif levelNum = 40
		beePosition = 31
		for i = 4 to 7
			map[i,2] = 4
			map[i,8] = 4
			map[(i+1)/2,i+1] = 4
			map[10-i/2,i+1] = 4
			map[6-(i+1)/2,i-2] = 4
			map[5+i/2,i-2] = 4
		next i
		map[5,6] = 4
		map[5,4] = 4
		map[6,6] = 4
		map[6,4] = 4
		map[4,5] = 4
		map[6,5] = 4
		map[4,6] = 2
		map[7,6] = 2
		map[4,4] = 2
		map[7,4] = 2
		map[5,5] = 1
		map[5,7] = 2
		map[5,3] = 2
	elseif levelNum = 41
		beePosition = 0
		for i = 2 to 4
			map[i,2] = 1
			map[i,5] = 1
		next i
		map[4,2] = 5
		map[2,5] = 5
	elseif levelNum = 42
		beePosition = 1
		for i = 2 to 4
			for j = 2 to 4
				map[i,j] = 1
			next j
		next i
		map[3,3] = 0
		map[2,4] = 0
		map[2,2] = 0
		map[2,3] = 5
		map[4,3] = 5
	elseif levelNum = 43
		beePosition = 2
		for i = 2 to 6
			map[i,2] = 1
			map[i,4] = 1
		next i
		map[2,3] = 5
		map[3,3] = 1
		map[4,3] = 1
		map[5,3] = 5
		map[3,2] = 2
		map[5,2] = 2
		map[3,4] = 2
		map[5,4] = 2
	elseif levelNum = 44
		beePosition = 28
		for i = 2 to 6
			map[2,i] = 1
			map[3,i] = 1
			map[5,i] = 1
			map[6,i] = 1
		next 
		map[2,4] = 5
		map[3,4] = 4
		map[6,4] = 5
		map[6,3] = 4
		map[6,5] = 4
		map[5,3] = 2
		map[5,5] = 2
	elseif levelNum = 45
		beePosition = 11
		for i = 2 to 7
			map[i,3] = -1
			map[i,4] = -1
			map[i,5] = -1
			map[i,2] = 1
			map[i,6] = 1
		next
		map[4,3] = 1
		map[4,5] = 1
		map[7,3] = 0
		map[7,5] = 0
		map[3,4] = 5
		map[6,4] = 5
		map[2,2] = 0
		map[7,2] = 0
	elseif levelNum = 46
		beePosition = 3
		for i = 2 to 5
			map[1+i/2,i] = 1
			map[6-(1+i)/2,i] = 1
			map[4+i/2,i] = 1
			map[9-(1+i)/2,i] = 1
			map[i,2] = 2
			map[i+3,2] = 2
		next i
		map[2,3] = 5
		map[7,3] = 5
		map[2,2] = 2
		map[8,2] = 2
		map[3,4] = 4
		map[7,4] = 4
	elseif levelNum = 47
		beePosition = 10
		for i = 2 to 5
			map[i,2] = 1
			map[i,3] = 1
			map[i,8] = 1
			map[i,7] = 1
		next i
		map[3,4] = 5
		map[3,6] = 5
		map[4,4] = -1
		map[4,6] = -1
		map[3,5] = -1
		map[2,5] = 4
		map[4,7] = 1
		//map[3,8] = 4
		map[3,3] = 4
		map[3,7] = 2
		map[4,2] = 0
		map[4,8] = 0
	elseif levelNum = 48
		beePosition = 21
		for i = 2 to 8
			for j = 2 to 6 step 2
				map[i,j] = 4
			next j
			map[i,3] = 2
			map[i,5] = 2
		next
		map[2,3] = 1
		map[7,3] = 1
		map[2,5] = 1
		map[7,5] = 1
		map[5,4] = 1
		map[8,3] = 0
		map[8,5] = 0
		map[4,4] = 5
		map[6,4] = 5
	elseif levelNum = 49
		beePosition = 3
		for i = 2 to 7
			for j = 2 to 7
				map[i,j] = -1
			next j
		next i
		for i = 2 to 7
			map[i,2] = 1
			map[i,8] = 1
			map[2,i] = 1
			map[7,i] = 1
		next
		for i = 3 to 7 step 2
			map[i,2] = 2
			map[i,8] = 2
			map[2,i] = 2
			map[7,i] = 2
		next i
		map[2,2] = 0
		map[2,8] = 0
		map[5,6] = 5
		map[5,4] = 5
	elseif levelNum = 50
		beePosition = 31
		for i = 2 to 8
			map[2,i] = 1
			map[8,i] = 1
			map[i,2] = 2
			map[i,8] = 2
		next i
		for i = 4 to 6
			map[i,4] = 1
			map[i,6] = 1
			map[4,i] = 1
			map[6,i] = 1
		next i
		map[5,5] = 2
		map[7,5] = -1
		map[5,7] = 5
		map[3,5] = -1
		map[5,3] = 5
		map[3,6] = 1
		map[4,6] = 0
		map[3,4] = 1
		map[4,4] = 0
		map[5,4] = 4
		map[6,4] = 4
		map[5,6] = 4
		map[6,6] = 4
		map[2,5] = 2
		map[8,5] = 2
		map[4,5] = 2
		map[6,5] = 2
		for i = 2 to 8 step 2
			map[2,i] = 0
		next i
	endif
	
	//Level Selection
	if levelNum = -1
		if reachedLevel >= 1 then map[1,1] = 1
		if reachedLevel >= 2 then map[2,1] = 1
		if reachedLevel >= 3 then map[1,2] = 1
		if reachedLevel >= 4 then map[2,2] = 1
		if reachedLevel >= 5 then map[3,2] = 1
		if reachedLevel >= 6 then map[1,3] = 1
		if reachedLevel >= 7 then map[2,3] = 1
		if reachedLevel >= 8 then map[1,4] = 1
		if reachedLevel >= 9 then map[2,4] = 1
		if reachedLevel >= 10 then map[3,4] = 1
	elseif levelNum = -2
		if reachedLevel >= 11 then map[1,1] = 2
		if reachedLevel >= 12 then map[2,1] = 2
		if reachedLevel >= 13 then map[1,2] = 2
		if reachedLevel >= 14 then map[2,2] = 2
		if reachedLevel >= 15 then map[3,2] = 2
		if reachedLevel >= 16 then map[1,3] = 2
		if reachedLevel >= 17 then map[2,3] = 2
		if reachedLevel >= 18 then map[1,4] = 2
		if reachedLevel >= 19 then map[2,4] = 2
		if reachedLevel >= 20 then map[3,4] = 2
	elseif levelNum = -3
		if reachedLevel >= 21 then map[1,1] = -1
		if reachedLevel >= 22 then map[2,1] = -1
		if reachedLevel >= 23 then map[1,2] = -1
		if reachedLevel >= 24 then map[2,2] = -1
		if reachedLevel >= 25 then map[3,2] = -1
		if reachedLevel >= 26 then map[1,3] = -1
		if reachedLevel >= 27 then map[2,3] = -1
		if reachedLevel >= 28 then map[1,4] = -1
		if reachedLevel >= 29 then map[2,4] = -1
		if reachedLevel >= 30 then map[3,4] = -1
	elseif levelNum = -4
		if reachedLevel >= 31 then map[1,1] = 4
		if reachedLevel >= 32 then map[2,1] = 4
		if reachedLevel >= 33 then map[1,2] = 4
		if reachedLevel >= 34 then map[2,2] = 4
		if reachedLevel >= 35 then map[3,2] = 4
		if reachedLevel >= 36 then map[1,3] = 4
		if reachedLevel >= 37 then map[2,3] = 4
		if reachedLevel >= 38 then map[1,4] = 4
		if reachedLevel >= 39 then map[2,4] = 4
		if reachedLevel >= 40 then map[3,4] = 4
	elseif levelNum = -5
		if reachedLevel >= 41 then map[1,1] = 5
		if reachedLevel >= 42 then map[2,1] = 5
		if reachedLevel >= 43 then map[1,2] = 5
		if reachedLevel >= 44 then map[2,2] = 5
		if reachedLevel >= 45 then map[3,2] = 5
		if reachedLevel >= 46 then map[1,3] = 5
		if reachedLevel >= 47 then map[2,3] = 5
		if reachedLevel >= 48 then map[1,4] = 5
		if reachedLevel >= 49 then map[2,4] = 5
		if reachedLevel >= 50 then map[3,4] = 5
	endif
	
	xOffset = (w-(tileSize*mapWidth)-tileSize/2)/2
	yOffset = (h-(tileSize*mapHeight*3/4))/2
	
	if currentlevel <> 0 then drawLevel()
	
	if currentlevel = 0
		SetSpriteVisible(1001, 0)
		CreateSprite(999, LoadImage("logoHH.png"))
		SetSpriteSize(999, 300*dRatio#, 150*dRatio#)
		SetSpritePosition(999, w/2-GetSpriteWidth(999)/2, h/2-GetSpriteHeight(999)/2)
		for i = i to 100
			if i <= 15 then SetSpriteColorAlpha(999, i*17)
			if i >= 85 then SetSpriteColorAlpha(999, (100-i)*17)
			BackgroundParticlesMove()
			Sync()
			Sleep(25)
		next i
		DeleteSprite(999)
		currentLevel = 1
		reachedLevel = 1
		createLevel(currentLevel)
	endif
	
endfunction

function CharacterButtons()
	if maxCharacterNum > 1
		for i = 711 to 722
			DeleteSprite(i)
		next i
		for i = 0 to 2 step 2
			for j = 0 to 1
				CreateSprite(711+j+i,0)
				SetSpriteSize(711+j+i, 98*dRatio#-j*8*dRatio#, 73*dRatio#-j*8*dRatio#)
				SetSpritePosition(711+j+i, w/2-127*dRatio#+i*78*dRatio#+j*4*dRatio#, 104*dRatio#+j*4*dRatio#)
				SetSpriteDepth(711+i+j, 1)
			next j
		next i
		if characterNum = 1
			SetSpriteColor(711, 0, 0, 0, 255)
			SetSpriteColor(712, 64, 64, 64, 255)
			SetSpriteColor(713, 100, 100, 100, 255)
			SetSpriteColor(714, 164, 164, 164, 255)
		elseif characterNum = 2
			SetSpriteColor(713, 0, 0, 0, 255)
			SetSpriteColor(714, 64, 64, 64, 255)
			SetSpriteColor(711, 100, 100, 100, 255)
			SetSpriteColor(712, 164, 164, 164, 255)
		endif
		CreateSprite(721, beeNormal)
		SetSpriteSize(721, 90*dRatio#, 65*dRatio#)
		SetSpritePosition(721, GetSpriteX(712), GetSpriteY(712))
		SetSpriteDepth(721, 1)
		CreateSprite(722, jebNormal)
		SetSpriteSize(722, 90*dRatio#, 65*dRatio#)
		SetSpritePosition(722, GetSpriteX(714), GetSpriteY(714))
		SetSpriteDepth(722, 1)
		BestTimeDraw()
	endif
endfunction

function BestTimeDraw()
	DeleteText(701)
	if bestTime[-currentLevel,characterNum] <> 0 and bestTime[-currentLevel,characterNum] > 60 and Mod(bestTime[-currentLevel,characterNum], 60) < 10 then CreateText(701, "Best Time-  " + Str(bestTime[-currentLevel,characterNum]/60) + ":0" + Str(Mod(bestTime[-currentLevel,characterNum],60)))
	if bestTime[-currentLevel,characterNum] <> 0 and bestTime[-currentLevel,characterNum] >= 10 then CreateText(701, "Best Time-  " + Str(bestTime[-currentLevel,characterNum]/60) + ":" + Str(Mod(bestTime[-currentLevel,characterNum],60)))
	if bestTime[-currentLevel,characterNum] <> 0 and bestTime[-currentLevel,characterNum] < 10 then CreateText(701, "Best Time-  0:0" + Str(Mod(bestTime[-currentLevel,characterNum],60)))
	if bestTime[-currentLevel,characterNum] = 0 then CreateText(701, "Record-  None Set")
	SetTextFontImage(701, LoadImage("font.png"))
	SetTextPosition(701, GetSpriteX(702)+5*dRatio#, GetSpriteY(702)+26*dRatio#)
	SetTextSize(701, 20*dRatio#)
endfunction

function drawLevel()
	DeleteSprite(1001)
	
	DeleteText(2)
	if currentLevel > 0 then CreateText(2, "Level " + Str(currentLevel))
	if currentLevel < 0 then CreateText(2, "Area " + Str(-currentLevel))
	SetTextSize(2, 30*dRatio#)
	SetTextPosition(2, w/2-55*dRatio#,  30*dRatio#)
	SetTextColorAlpha(2, 0)
	SetTextFontImage(2, LoadImage("font.png"))
	SetTextDepth(2, 1)
	for i = 1 to mapWidth
	    for j = 1 to mapHeight
			SetSpriteColorAlpha(sprite, 255)
			sprite = i+(j-1)*mapWidth
			if GetSpriteExists(sprite) = 0 then CreateSprite(sprite, 0)
	        if map[i,j] = 0 then SetSpriteImage(sprite, LoadImage("space0.png"))
	        if map[i,j] = 1 then SetSpriteImage(sprite, LoadImage("space2.png"))
	        if map[i,j] = 2 then SetSpriteImage(sprite, LoadImage("space4.png"))
	        if map[i,j] = -1 then SetSpriteImage(sprite, LoadImage("space-1.png"))
	        if map[i,j] = 4 then SetSpriteImage(sprite, LoadImage("space5.png"))
	        if map[i,j] = 5 then SetSpriteImage(sprite, LoadImage("space6.png"))
	        SetSpriteSize(sprite, tileSize, tileSize)
	        SetSpritePosition(sprite, (i-1)*tileSize+Mod(j,2)*tileSize/2+xOffset, (j-1)*tileSize*3/4+yOffset)
	        SetSpriteColorAlpha(sprite, 130)
	        if currentLevel < 0
				if sprite = 3 then DeleteSprite(3)
				if sprite = 9 then DeleteSprite(9)
				SetSpritePosition(sprite, GetSpriteX(sprite)+tileSize/4, GetSpriteY(sprite))
				if reachedLevel >= sprite-(currentLevel+1)*10
					CreateText(10+sprite, Str(sprite-(currentLevel+1)*10))
					SetTextFontImage(10+sprite, LoadImage("font.png"))
					SetTextDepth(10+sprite, 1)
					SetTextColor(10+sprite, 128, 64, 0, 255)
				endif
	        endif
//	        if sprite = 
	        Sync()
	        BackgroundParticlesMove()
	        Sleep(18)
	    next j
	next i
	SetSpriteColorAlpha(sprite, 255)
	
	//Level Select Text
	if currentLevel < 0
		SetSpriteVisible(1008, 0)
		SetSpriteVisible(1003, 0)
		if currentLevel = -1 
			if reachedLevel > 10 then SetSpriteVisible(1003, 1)
		elseif currentLevel = -2 
			SetSpriteVisible(1008, 1)
			if reachedLevel > 20 then SetSpriteVisible(1003, 1) 
		elseif currentLevel = -3 
			SetSpriteVisible(1008, 1)
			if reachedLevel > 30 then SetSpriteVisible(1003, 1)
		elseif currentLevel = -4 
			SetSpriteVisible(1008, 1)
			if reachedLevel > 40 then SetSpriteVisible(1003, 1)
		elseif currentLevel = -5 
			SetSpriteVisible(1008, 1)
			//if reachedLevel > 40 then SetSpriteVisible(1003, 1)
		endif
		//Text creation
		for i = 1 to 10
			//DeleteText(i+10)
			if reachedLevel >= i-(currentLevel+1)*10
				//CreateText(10+i, Str(i-(currentLevel+1)*10))
				SetTextPosition(10+i, GetSpriteX(i+i/3-i/6+i/8-i/9)+15*dRatio#, GetSpriteY(i+i/3-i/6+i/8-i/9)+35*dRatio#)
				SetTextSize(10+i, 40*dRatio#)
			endif
		next i
		DeleteText(21)
		DeleteText(22)
		//Time Trial
		if reachedLevel > -(currentLevel)*10
			//Background
			CreateSprite(701, 0)
			SetSpritePosition(701, 26*dRatio#, h-104*dRatio#)
			SetSpriteSize(701, w-(GetSpriteX(701)*2), 78*dRatio#)
			CreateSprite(702, 0)
			SetSpritePosition(702, 30*dRatio#, h-100*dRatio#)
			SetSpriteSize(702, w-(GetSpriteX(702)*2), 70*dRatio#)
			SetSpriteColor(702, 64, 64, 64, 255)
			BestTimeDraw()
			
			//Button
			CreateSprite(703, 0)
			SetSpriteSize(703, 68*dRatio#, 66*dRatio#)
			SetSpritePosition(703, GetSpriteX(701)+GetSpriteWidth(701)-GetSpriteWidth(703)-6*dRatio#, GetSpriteY(701)+6*dRatio#)
			CreateSprite(704, 0)
			SetSpriteSize(704, GetSpriteWidth(703)-8*dRatio#, GetSpriteHeight(703)-8*dRatio#)
			SetSpritePosition(704, GetSpriteX(703)+4*dRatio#, GetSpriteY(703)+4*dRatio#)
			SetSpriteColor(704, 46, 46, 46, 255)
			CreateText(702, "Set")
			CreateText(703, "New")
			CreateText(704, "Time")
			for i = 702 to 704
				SetTextFontImage(i, LoadImage("font.png"))
				SetTextSize(i, 18*dRatio#)
				SetTextPosition(i, GetSpriteX(704)+(8+3*(704-i))*dRatio#, GetSpriteY(704)+(5+15*(i-702))*dRatio#)
			next
		endif
		CharacterButtons()
	endif
	
	//Sets Bee in right place
	if currentLevel > 0
		if characterNum = 1 then CreateSprite(1001, beeNormal)
		if characterNum = 2 then CreateSprite(1001, jebNormal)
		SetSpritePosition(1001, (Mod(beePosition, mapWidth)+1)*tileSize-Mod(beePosition/mapWidth,2)*tileSize/2+GetSpriteWidth(2)/2-GetSpriteWidth(1001)/2+xOffset, (beePosition/mapWidth)*tileSize*3/4+GetSpriteHeight(2)/2+GetSpriteHeight(1001)/2*characterNum+yOffset)
		SetSpriteSize(1001, tileSize*3/4, tileSize/2)
	endif

	//Makes starting space correct state & color
	if currentLevel > 0
		map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] - 1
		if map[Mod(1+beePosition, mapWidth)-Mod(beePosition/mapWidth,2)+1, beePosition/mapWidth+2] = 1
			SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space3.png"))
		else
			SetSpriteImage(beePosition+mapWidth+2-Mod(beePosition/mapWidth,2), LoadImage("space1.png"))
		endif
	endif
	
	SetSpritePosition(1001, (Mod(beePosition, mapWidth)+1)*tileSize-Mod(beePosition/mapWidth,2)*tileSize/2+GetSpriteWidth(2)/2-GetSpriteWidth(1001)/2+xOffset, (beePosition/mapWidth)*tileSize*3/4+GetSpriteHeight(2)/2+GetSpriteHeight(1001)/2*characterNum+yOffset)
	jebTheta = 0
	
	for i = 1 to 3
		SetSpriteColorAlpha(1001, i*85)
		SetTextColorAlpha(2, i*85)
		BackgroundParticlesMove()
		Sleep(20)
		Sync()
	next i
	
	
	
	if (reachedLevel < 4 and currentLevel > 0) or (reachedLevel > 24 and maxCharacterNum = 1)
		CreateSprite(501, 0)
		SetSpritePosition(501, 26*dRatio#, h-104*dRatio#)
		SetSpriteSize(501, w-(GetSpriteX(501)*2), 78*dRatio#)
		CreateSprite(502, 0)
		SetSpritePosition(502, 30*dRatio#, h-100*dRatio#)
		SetSpriteSize(502, w-(GetSpriteX(502)*2), 70*dRatio#)
		SetSpriteColor(502, 100, 100, 100, 255)
		if currentLevel = 1
			CreateText(501, "Tap in the direction")
			CreateText(502, "you want to move.")
		elseif currentLevel = 2
			CreateText(501, "Collect all the honey")
			CreateText(502, "to complete the level.")
		elseif currentLevel = 3
			CreateText(501, "Restart the level if")
			CreateText(502, "you get stuck.")
			CreateSprite(708, LoadImage("backArrow.png"))
			SetSpritePosition(708, GetSpriteX(1003)+5*dRatio#, GetSpriteY(1003)+90*dRatio#)
			SetSpriteSize(708, GetSpriteWidth(1003)-10*dRatio#, GetSpriteHeight(1003)-10*dRatio#)
			SetSpriteAngle(708, 90)
		elseif reachedLevel > 24
			maxCharacterNum = 2
			CreateText(501, "New character unlocked!")
			CreateText(502, "Select level to change.")
			CreateSprite(708, LoadImage("backArrow.png"))
			SetSpritePosition(708, GetSpriteX(1008)+5*dRatio#, GetSpriteY(1008)+90*dRatio#)
			SetSpriteSize(708, GetSpriteWidth(1008)-10*dRatio#, GetSpriteHeight(1008)-10*dRatio#)
			SetSpriteAngle(708, 90)
		endif
		for i = 501 to 502
			SetTextFontImage(i, LoadImage("font.png"))
			SetTextPosition(i, GetSpriteX(502)+10*dRatio#, GetSpriteY(502)+8*dRatio#+(i-501)*25*dRatio#)
			SetTextSize(i, 22*dRatio#)
		next i
		
	endif

	
endfunction

function deleteLevel()
	iceOn = 0
	iceSlide = 0
	DeleteSprite(501)
	DeleteSprite(502)
	DeleteText(501)
	DeleteText(502)
	for i = 701 to 722
		DeleteSprite(i)
		DeleteText(i)
	next i
	for i = 1 to 12
		DeleteText(i+10)
	next i
	for k = 2 to 0 step -1
		for i = 1 to mapWidth*mapHeight
			SetSpriteColorAlpha(i, k*85)
		next i
		SetSpriteColorAlpha(1001, k*85)
		BackgroundParticlesMove()
		Sync()
		Sleep(15)
	next k
endfunction
