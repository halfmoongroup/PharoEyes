"
A clock that counts by half seconds
"
Class {
	#name : #Clock,
	#superclass : #Object,
	#instVars : [
		'duration',
		'status',
		'tick',
		'runningclock',
		'action'
	],
	#category : #'HMGEye-functional'
}

{ #category : #initialize }
Clock class >> withBlock: aBlock andDuration: aNumber [
	| instance |

	instance := self basicNew. 
	
	^ instance initializeWith: aBlock andDuration: aNumber. 
]

{ #category : #accessing }
Clock >> action [

	^ action
]

{ #category : #accessing }
Clock >> action: anObject [

	action := anObject
]

{ #category : #accessing }
Clock >> duration [

	^ duration
]

{ #category : #accessing }
Clock >> duration: anObject [

	duration := anObject
]

{ #category : #initialization }
Clock >> initialize [
	super initialize.
	duration := 10.
	status := 0.
	self reset. 

]

{ #category : #initialization }
Clock >> initializeWith: aBlock andDuration:aNumber [

	action := aBlock.
	duration := aNumber. 
	self reset
]

{ #category : #initialization }
Clock >> reset [ 

	self tick: 0.
	runningclock ifNotNil: [ runningclock terminate ].
	runningclock := [ 
		                [ status == 1 ] whileTrue: [ 
			                tick := tick + 0.5.
			                tick >= duration ifTrue: [ 
				                status := 0.
				                action ifNotNil: [ self action value ] ].
			                (Delay forMilliseconds: 500) wait ] ] newProcess.
]

{ #category : #accessing }
Clock >> runningclock [

	^ runningclock
]

{ #category : #accessing }
Clock >> runningclock: anObject [

	runningclock := anObject
]

{ #category : #accessing }
Clock >> start [

	runningclock isActiveProcess  ifFalse: [ 
		self status: 1.
		runningclock resume.
		].
	^ self status.  
]

{ #category : #accessing }
Clock >> status [

	^ status
]

{ #category : #accessing }
Clock >> status: anObject [

	status := anObject
]

{ #category : #accessing }
Clock >> stop [ 

	runningclock notNil ifTrue: [ runningclock terminate ].
	(runningclock isTerminated) ifTrue: [ self status: 0 ]
]

{ #category : #accessing }
Clock >> tick [

	^ tick
]

{ #category : #accessing }
Clock >> tick: anObject [

	tick := anObject
]
