"
Application of a drop
"
Class {
	#name : #EyeDrop,
	#superclass : #Object,
	#instVars : [
		'drop',
		'startTime',
		'step',
		'steps',
		'timer',
		'stepNames',
		'watchers'
	],
	#category : #HMGEye
}

{ #category : #'instance creation' }
EyeDrop class >> fromDrop: aDrop [ 

	| instance | 
	instance := self basicNew. 
	^ instance initializeFromDrop: aDrop. 
]

{ #category : #api }
EyeDrop >> addStep: name withDuration: minutes [

	minutes > 0 ifFalse: [ ^ self ].
	steps add: minutes.
	stepNames add: name
]

{ #category : #adding }
EyeDrop >> addWatcher: aWatcher [

	 watchers add: aWatcher
]

{ #category : #accessing }
EyeDrop >> drop [

	^ drop
]

{ #category : #accessing }
EyeDrop >> drop: aDrop [

	self addStep: 'closed eyes' withDuration: aDrop  closed.
	self addStep: 'open eyes' withDuration: aDrop  open.
	step  := 1.
	drop := aDrop
]

{ #category : #initialization }
EyeDrop >> initialize [ 

	step := 1.
	steps := OrderedCollection new. 
	stepNames := OrderedCollection new. 
	watchers := Set new. 
	
]

{ #category : #initialization }
EyeDrop >> initializeFromDrop: aDrop [
  self initialize.
  ^self drop: aDrop.
]

{ #category : #api }
EyeDrop >> nextStep [ 
	self step:  (self step + 1).
	watchers ifNotEmpty:  [ watchers do: [ :watcher | watcher modelChanged] ].
	self start 
]

{ #category : #'accessing - computed' }
EyeDrop >> percentage [ 

	^ timer ifNil: [ ^0 ]
	ifNotNil: [ 
			step > (steps size) 
				ifTrue: [^0]
				ifFalse: [^ (self timer tick) /(60 * steps at: step)]
				]
]

{ #category : #removing }
EyeDrop >> removeWatchers [

	watchers := Set new.
]

{ #category : #api }
EyeDrop >> start [

	self startTime ifNil: [ self startTime: DateAndTime now ].
	step <= steps size ifFalse: [ ^ self ].
	timer := Clock
		         withBlock: [ self nextStep ]
		         andDuration: (60 * steps at: step).
	timer start
]

{ #category : #accessing }
EyeDrop >> startTime [

	^ startTime
]

{ #category : #accessing }
EyeDrop >> startTime: anObject [

	startTime := anObject
]

{ #category : #accessing }
EyeDrop >> step [

	^ step
]

{ #category : #accessing }
EyeDrop >> step: anObject [

	step := anObject
]

{ #category : #accessing }
EyeDrop >> stepName [ 
	(step <= stepNames size  ) ifTrue: [ ^stepNames at: step ]
	ifFalse: [ ^'done' ]
]

{ #category : #accessing }
EyeDrop >> stepNames [

	^ stepNames
]

{ #category : #accessing }
EyeDrop >> stepNames: anObject [

	stepNames := anObject
]

{ #category : #accessing }
EyeDrop >> steps [

	^ steps
]

{ #category : #accessing }
EyeDrop >> steps: anObject [

	steps := anObject
]

{ #category : #accessing }
EyeDrop >> timer [

	^ timer
]

{ #category : #accessing }
EyeDrop >> timer: anObject [

	^ timer := anObject
]

{ #category : #accessing }
EyeDrop >> watchers [

	^ watchers
]
