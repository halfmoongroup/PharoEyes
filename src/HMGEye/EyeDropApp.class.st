Class {
	#name : #EyeDropApp,
	#superclass : #SpApplication,
	#instVars : [
		'settings',
		'model',
		'runDate',
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

{ #category : #accessing }
EyeDropApp >> eyeDropInfoPresenter [

	^ eyeDropInfoPresenter
]

{ #category : #accessing }
EyeDropApp >> eyeDropInfoPresenter: anObject [

	eyeDropInfoPresenter := anObject
]

{ #category : #accessing }
EyeDropApp >> model [

	^ model
]

{ #category : #accessing }
EyeDropApp >> model: anObject [

	model := anObject
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
EyeDropApp >> settings [

	^ settings
]

{ #category : #accessing }
EyeDropApp >> settings: anObject [

	settings := anObject
]

{ #category : #running }
EyeDropApp >> start [
	model drops: (EyeDropModel sampleEyeDropData).
	eyeDropInfoPresenter eyeDrop: (self model currentDrop).
   eyeDropInfoPresenter application: self. 
	eyeDropInfoPresenter openWithSpec. 
]
