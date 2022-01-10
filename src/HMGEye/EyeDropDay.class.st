"
.838842-05:00 Test10.image priorSource: 99
"
Class {
	#name : #EyeDropDay,
	#superclass : #Object,
	#instVars : [
		'date',
		'morningDrops',
		'eveningDrops',
		'drops'
	],
	#category : #HMGEye
}

{ #category : #'as yet unclassified' }
EyeDropDay class >> createDayWithDrops: aCollection [
	|instance | 
	instance :=  self basicNew. 
	^ instance intializeWithDrops: aCollection
]

{ #category : #'as yet unclassified' }
EyeDropDay class >> sampleDropData [

	| data |
	data := OrderedCollection new.
	^ data
		  add: (Drop
				   withName: 'test1'
				   closed: 1
				   open: 1
				   apply: 11);
		  add: (Drop
				   withName: 'test2'
				   closed: 2
				   open: 2
				   apply: 10);
		  add: (Drop
				   withName: 'test3'
				   closed: 3
				   open: 3
				   apply: 10);
		  yourself
]

{ #category : #accessing }
EyeDropDay >> date [

	^ date
]

{ #category : #accessing }
EyeDropDay >> date: anObject [

	date := anObject
]

{ #category : #'as yet unclassified' }
EyeDropDay >> drops [
	| isMorning | 
	isMorning := ((self date hour24) <= 13).
	(isMorning) ifTrue: [ ^morningDrops ].
	^eveningDrops
]

{ #category : #accessing }
EyeDropDay >> drops: aCollection [

	morningDrops := aCollection select:  [ :item | 1 == (item apply bitAnd: 1) ].
	eveningDrops := aCollection select:  [ :item | 10 == (item apply bitAnd: 10) ].
	^ drops := aCollection
]

{ #category : #accessing }
EyeDropDay >> eveningDrops [

	^ eveningDrops
]

{ #category : #accessing }
EyeDropDay >> eveningDrops: anObject [

	eveningDrops := anObject
]

{ #category : #initialization }
EyeDropDay >> initialize [ 

	eveningDrops := OrderedCollection new. 
	morningDrops := OrderedCollection new.
	date := DateAndTime now.

]

{ #category : #initialization }
EyeDropDay >> initializeWithDateAndTime: when [ 

	eveningDrops := OrderedCollection new. 
	morningDrops := OrderedCollection new.
	date :=when

]

{ #category : #'as yet unclassified' }
EyeDropDay >> intializeWithDrops: allDrops [

	self initialize. 
	^ drops :=  allDrops
]

{ #category : #accessing }
EyeDropDay >> morningDrops [

	^ morningDrops
]

{ #category : #accessing }
EyeDropDay >> morningDrops: anObject [

	morningDrops := anObject
]
