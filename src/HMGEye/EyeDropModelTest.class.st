Class {
	#name : #EyeDropModelTest,
	#superclass : #TestCase,
	#category : #'HMGEye-test'
}

{ #category : #data }
EyeDropModelTest class >> sampleEyeDropData [

	| data |
	data := OrderedCollection new.
   data
		  add: (Drop
				   withName: 'D&N Drop 1'
				   closed: 1
				   open: 1
				   apply: 11);
		  add: (Drop
				   withName: 'NightOnly Drop2'
				   closed: 2
				   open: 2
				   apply: 10);
		  add: (Drop
				   withName: 'NightOnly Drop3'
				   closed: 3
				   open: 3
				   apply: 10).
	^ EyeDrop fromDrops: data.
]

{ #category : #tests }
EyeDropModelTest >> testAdvanceToNextDrop [

	|model result|

	model   := EyeDropModel new. 
	model prepareModelWithDrops: (DropInventory testDropData ).
	self assert: (model currentDrop dropName) equals: (((DropInventory testDropData ) at: 1) dropName).
	result := model advanceToNextDrop.
	self assert: result.
	self assert: (model currentDrop dropName) equals: (((DropInventory testDropData ) at: 2) dropName).
	
]

{ #category : #tests }
EyeDropModelTest >> testDropsForTime [ 
	|eyedropday |
	
	eyedropday := EyeDropModel new. 
	eyedropday drops:  (self class sampleEyeDropData).
	eyedropday date: (DateAndTime  readFrom: '2021-01-07T12:59:59.876-05:00' readStream).
	self assert: (eyedropday dropsForTime) equals: eyedropday morningDrops. 
	

	eyedropday date: (DateAndTime  readFrom: '2021-01-07T18:59:59.876-05:00' readStream).
	self assert: (eyedropday dropsForTime) equals: eyedropday eveningDrops. 

]

{ #category : #tests }
EyeDropModelTest >> testEveningDrops [

	| eyedropday |

	eyedropday   := EyeDropModel new. 
	self assert: (eyedropday eveningDrops size) equals: 0. 
	eyedropday drops:  (self class sampleEyeDropData).
	self assert: (eyedropday eveningDrops size) equals: 3. 

]

{ #category : #tests }
EyeDropModelTest >> testInitialize [

	| eyedropday |
	eyedropday   := EyeDropModel new. 
	eyedropday date: (DateAndTime  readFrom: '2021-01-07T12:59:59.876-05:00' readStream).
	self assert: (eyedropday morningDrops size) equals: 0. 
	self assert: (eyedropday eveningDrops size) equals: 0. 
	self assert: (eyedropday drops size) equals: 0.
	

	
	
]

{ #category : #tests }
EyeDropModelTest >> testMorningDrops [

	| model |
	model   := EyeDropModel new. 
	self assert: (model morningDrops size) equals: 0. 
	model drops:  (self class sampleEyeDropData).
	self assert: (model morningDrops size) equals: 1. 

]
