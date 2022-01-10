"
An eyedrop medicine and it's application times
"
Class {
	#name : #Drop,
	#superclass : #Object,
	#instVars : [
		'name',
		'closed',
		'open',
		'apply'
	],
	#category : #HMGEye
}

{ #category : #initialization }
Drop class >> dropData [

	| data |
	self initialize.
	data := OrderedCollection new.
	^ data
		  add: (Drop withName: 'wash'
					closed: 3
				   open: 0
				   apply: 11);
		  add: (Drop
				   withName: 'refresh'
				closed: 2
				open: 11
				apply: 11);
		  add: (Drop
				   withName: 'azopt'
					closed: 2
					open: 16
					apply: 11);
		  add: (Drop
				   withName: 'restasis'
					closed: 2
					open:0
					apply: 11);
		  add: (Drop
				   	withName: 'lantanaprost'
					closed: 2
					open: 0
					apply: 10);

		  add: (Drop
				   withName: 'geldrops'
				   closed: 2
					open: 0
				   apply: 10);
		  yourself
]

{ #category : #initialize }
Drop class >> withName: aName closed: closedt open: openT apply: applicationMask [
	| instance |
	
	instance := self basicNew. 
	^instance initializeWithName: aName closed: closedt open: openT apply: applicationMask 
]

{ #category : #accessing }
Drop >> apply [

	^ apply
]

{ #category : #accessing }
Drop >> apply: anObject [

	apply := anObject
]

{ #category : #accessing }
Drop >> closed [

	^ closed
]

{ #category : #accessing }
Drop >> closed: anObject [

	closed := anObject
]

{ #category : #initialization }
Drop >> initializeWithName: aName closed: closedt open: opent apply: applicationMask [

	self name: aName;
	closed: closedt;
	open: opent;
	apply: applicationMask.
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
Drop >> open [

	^ open
]

{ #category : #accessing }
Drop >> open: anObject [

	open := anObject
]
