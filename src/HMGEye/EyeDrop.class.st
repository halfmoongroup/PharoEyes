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
		'watchers',
		'announcing'
	],
	#category : #'HMGEye-functional'
}

{ #category : #'instance creation' }
EyeDrop class >> fromDrop: aDrop [ 

	| instance | 
	instance := self basicNew. 
	^ instance initializeFromDrop: aDrop. 
]

{ #category : #'instance creation' }
EyeDrop class >> fromDrops: aCollection [

	^ aCollection collect: [ :item | self fromDrop: item]
]

{ #category : #api }
EyeDrop >> addStep: name withDuration: minutes [

	minutes > 0 ifFalse: [ ^ self ].
	steps add: minutes.
	stepNames add: name
]

{ #category : #watching }
EyeDrop >> addWatcher: aWatcher [

	(watchers includes: aWatcher) ifFalse: [ watchers add: aWatcher ]
]

{ #category : #accessing }
EyeDrop >> announcing [

	^ (self watchers contains: self)
]

{ #category : #accessing }
EyeDrop >> announcing: aBoolean [

	(aBoolean) ifTrue: [ self addWatcher: self ]
	ifFalse: [ self removeWatcher: self]

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

{ #category : #'as yet unclassified' }
EyeDrop >> dropName [

	^ drop name. 
]

{ #category : #initialization }
EyeDrop >> initialize [ 

	step := 1.
	steps := OrderedCollection new. 
	stepNames := OrderedCollection new. 
	watchers := Set new. 
	announcing := false. 
	
]

{ #category : #initialization }
EyeDrop >> initializeFromDrop: aDrop [
  self initialize.
  ^self drop: aDrop.
]

{ #category : #initialization }
EyeDrop >> modelChanged [ 
	('model changed-> dropName ', (self dropName), ' step: ', self stepName) traceCr.
]

{ #category : #'as yet unclassified' }
EyeDrop >> modelState [
	self modelChanged
]

{ #category : #api }
EyeDrop >> nextStep [ 
   step:= (step + 1).
	watchers ifNotEmpty:  [ watchers do: [ :watcher | watcher modelChanged] ].
	self startClockTimer 
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
EyeDrop >> removeWatcher: aWatcher [ 

	watchers remove: aWatcher. 
	
]

{ #category : #watching }
EyeDrop >> removeWatchers [

	watchers := Set new.
]

{ #category : #api }
EyeDrop >> start [

	self startTime ifNil: [ self startTime: DateAndTime now ].
	step <= steps size ifFalse: [ ^ self ].
	self modelChanged.
	self startClockTimer

]

{ #category : #accessing }
EyeDrop >> startClockTimer [

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

{ #category : #watching }
EyeDrop >> watchers [

	^ watchers
]
