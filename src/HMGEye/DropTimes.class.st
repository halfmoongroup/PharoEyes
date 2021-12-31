"
The times spread for each drop
"
Class {
	#name : #DropTimes,
	#superclass : #Object,
	#instVars : [
		'closed',
		'open',
		'rest'
	],
	#category : #HMGEye
}

{ #category : #initialization }
DropTimes class >> withClosed: aTime open: asecondtime rest: restTime [ 
	| instance |
	instance := self basicNew. 
	^ instance initializeWithClosed: aTime open: asecondtime rest: restTime
]

{ #category : #accessing }
DropTimes >> closed [

	^ closed
]

{ #category : #accessing }
DropTimes >> closed: anObject [

	closed := anObject
]

{ #category : #initialization }
DropTimes >> initializeWithClosed: firstTime open: secondTime rest: restTime [
	self initialize .
	closed := firstTime.
	open := secondTime.
	rest := restTime. 
]

{ #category : #accessing }
DropTimes >> open [

	^ open
]

{ #category : #accessing }
DropTimes >> open: anObject [

	open := anObject
]

{ #category : #accessing }
DropTimes >> rest [

	^ rest
]

{ #category : #accessing }
DropTimes >> rest: anObject [

	rest := anObject
]
