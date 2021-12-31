"
An eyedrop medicine and it's application times
"
Class {
	#name : #Drop,
	#superclass : #Object,
	#instVars : [
		'name',
		'dropTimes',
		'status'
	],
	#category : #'HMGEye-functional'
}

{ #category : #initialization }
Drop class >> sampleData [

	| data |
	self initialize.
	data := OrderedCollection new.
	^ data
		  add: (Drop
				   withName: 'wash'
				   times: (DropTimes withClosed: 3 open: 0 rest: 0)
				   status: 11);
		  add: (Drop
				   withName: 'refresh'
				   times: (DropTimes withClosed: 2 open: 6 rest: 2)
				   status: 11);
		  add: (Drop
				   withName: 'alphagan'
				   times: (DropTimes withClosed: 2 open: 9 rest: 2)
				   status: 11);
		  add: (Drop
				   withName: 'azopt'
				   times: (DropTimes withClosed: 2 open: 14 rest: 2)
				   status: 11);
		  add: (Drop
				   withName: 'restasis'
				   times: (DropTimes withClosed: 2 open: 2 rest: 2)
				   status: 11);
		  add: (Drop
				   withName: 'lantanaprost'
				   times: (DropTimes withClosed: 2 open: 0 rest: 2)
				   status: 10);
		  add: (Drop
				   withName: 'geldrops'
				   times: (DropTimes withClosed: 2 open: 6 rest: 0)
				   status: 10);
		  yourself
]

{ #category : #initialize }
Drop class >> withName: aName times: aTime status: aStatus [
	| instance |
	
	instance := self basicNew. 
	^instance initializeWithName: aName dropTimes: aTime andStatus: aStatus. 
]

{ #category : #accessing }
Drop >> dropTimes [

	^ dropTimes
]

{ #category : #accessing }
Drop >> dropTimes: anObject [

	dropTimes := anObject
]

{ #category : #initialization }
Drop >> initializeWithName: aName dropTimes: times andStatus: aStatus [

	self initialize.
	name := aName.
	dropTimes := times. 
	status := aStatus
]

{ #category : #accessing }
Drop >> name [

	^ name
]

{ #category : #accessing }
Drop >> name: anObject [

	name := anObject
]

{ #category : #accessing }
Drop >> status [

	^ status
]

{ #category : #accessing }
Drop >> status: anObject [

	status := anObject
]
