Class {
	#name : #EyeDropApp,
	#superclass : #SpApplication,
	#instVars : [
		'settings',
		'model',
		'runDate',
		'drops',
		'index',
		'currentDrop',
		'eyeDropInfoPresenter'
	],
	#category : #'HMGEye-ui'
}

{ #category : #initialization }
EyeDropApp class >> initializeWithDateAndTime: aDateTime [
	| instance |
	instance := 	self basicNew. 
	instance initialize. 
	instance runDate:  aDateTime. 
	^ instance
]

{ #category : #initialization }
EyeDropApp >> initialize [ 

	super initialize.  
	settings := Dictionary new. 
	runDate := DateAndTime now. 
	model := EyeDropDay new. 
	index := 1.
	currentDrop := Drop new. 
	eyeDropInfoPresenter := EyeDropInfoPresenter new. 
	
]

{ #category : #accessing }
EyeDropApp >> runDate [

	^ runDate
]

{ #category : #accessing }
EyeDropApp >> runDate: anObject [

	runDate := anObject
]

{ #category : #accessing }
EyeDropApp >> start [ 

	drops := model drops. 
	drops size isNotEmpty ifTrue: [ 
		index := 1.
		currentDrop := drops at: index. 
		eyeDropInfoPresenter drop: currentDrop.
		].
	^self openWithSpec
]
