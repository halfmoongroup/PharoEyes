"
.838842-05:00 Test10.image priorSource: 99
"
Class {
	#name : #EyeDropModel,
	#superclass : #Object,
	#instVars : [
		'date',
		'currentDrops',
		'drops',
		'index'
	],
	#category : #'HMGEye-functional'
}

{ #category : #'as yet unclassified' }
EyeDropModel class >> createDayWithDrops: aCollection [
	|instance | 
	instance :=  self basicNew. 
	^ instance intializeWithDrops: aCollection
]

{ #category : #'as yet unclassified' }
EyeDropModel >> advanceToNextDrop [

	index := index + 1.
	(index <= currentDrops size) ifTrue: [ ^true ]
	ifFalse: [ ^false ]
]

{ #category : #'as yet unclassified' }
EyeDropModel >> currentDrop [ 

	^ currentDrops at: index. 
]

{ #category : #accessing }
EyeDropModel >> date [

	^ date
]

{ #category : #accessing }
EyeDropModel >> date: anObject [

	date := anObject
]

{ #category : #'as yet unclassified' }
EyeDropModel >> drops [
	^drops
]

{ #category : #accessing }
EyeDropModel >> drops: aCollection [

	^ drops := aCollection
]

{ #category : #'as yet unclassified' }
EyeDropModel >> dropsForTime [
	| isMorning | 
	isMorning := ((self date hour24) <= 13).
	(isMorning) ifTrue: [ ^self morningDrops ].
	^self eveningDrops
]

{ #category : #accessing }
EyeDropModel >> eveningDrops [

	^ drops select: [ :item | 10 == (item drop apply bitAnd: 10) ]
]

{ #category : #initialization }
EyeDropModel >> initialize [ 


	drops := OrderedCollection new. 
	date := DateAndTime now.
	index := 1.

]

{ #category : #initialization }
EyeDropModel >> initializeWithDateAndTime: when [ 


	drops := OrderedCollection new. 
	date :=when

]

{ #category : #initialization }
EyeDropModel >> intializeWithDrops: allDrops [

	self initialize. 
	^ drops :=  EyeDrop fromDrops: allDrops
]

{ #category : #accessing }
EyeDropModel >> morningDrops [

	^ drops select:  [ :item | 1 == (item drop apply bitAnd: 1) ]
]

{ #category : #'as yet unclassified' }
EyeDropModel >> prepareModel [

	index= 1.
	currentDrops := self dropsForTime. 
	
]

{ #category : #'as yet unclassified' }
EyeDropModel >> prepareModelWithDrops: aCollection [

	index := 1.
	self drops: aCollection.
	currentDrops := self dropsForTime. 
	
]
