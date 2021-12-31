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
		'stepNames'
	],
	#category : #'HMGEye-functional'
}

{ #category : #api }
EyeDrop >> addStep: name withDuration: minutes [

	minutes > 0 ifFalse: [ ^ self ].
	steps add: minutes.
	stepNames add: name
]

{ #category : #announce }
EyeDrop >> announceStepStatus: stepStatus [

	| line |
	line := self drop name.
	step <= (self stepNames size) ifTrue:
		[ line := line , ' ' , (self stepNames at: step) ].
	 ^(line,' ', stepStatus) traceCr
]

{ #category : #accessing }
EyeDrop >> drop [

	^ drop
]

{ #category : #accessing }
EyeDrop >> drop: aDrop [

	self addStep: 'closed eyes' withDuration: aDrop dropTimes closed.
	self addStep: 'open eyes' withDuration: aDrop dropTimes open.
	self addStep: 'rest' withDuration: aDrop dropTimes rest. 
	step  := 1.
	drop := aDrop
]

{ #category : #initialization }
EyeDrop >> initialize [ 

	step := 1.
	steps := OrderedCollection new. 
	stepNames := OrderedCollection new. 
	
]

{ #category : #api }
EyeDrop >> nextStep [ 
	self announceStepStatus: ' ending'.
	step := step + 1.
	self startSteps 
]

{ #category : #api }
EyeDrop >> startSteps [

	self announceStepStatus: ' starting'.
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
EyeDrop >> timer [

	^ timer
]

{ #category : #accessing }
EyeDrop >> timer: anObject [

	^ timer := anObject
]
