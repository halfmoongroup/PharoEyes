Class {
	#name : #EyeDropInfoPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'eyeDrop',
		'name',
		'phase',
		'progressBar',
		'startButton',
		'endButton',
		'resetButton'
	],
	#category : #'HMGEye-ui'
}

{ #category : #accessing }
EyeDropInfoPresenter >> eyeDrop [

	^ eyeDrop
]

{ #category : #accessing }
EyeDropInfoPresenter >> eyeDrop: anEyeDrop [

	name label: anEyeDrop drop name. 
	phase label: anEyeDrop stepName. 
	eyeDrop := anEyeDrop

]

{ #category : #initialization }
EyeDropInfoPresenter >> initializePresenter [

	| pauseButton |
	name := self newLabel.
	phase := self newLabel.
	startButton := self newButton label: 'Start'.
	pauseButton := self newButton label: 'Pause'.
	resetButton := self newButton label: 'Reset'.
	progressBar := self newProgressBar.
	progressBar progress: [ self percentage ] every: 0.5 second.

	self layout: (SpBoxLayout newVertical
			 spacing: 15;
			 add: (SpBoxLayout newLeftToRight
					  spacing: 15;
					  add: 'Drop Info: ' expand: false;
					  add: name expand: false;
					  add: phase expand: false;
					  yourself) 
			 expand: false;
			 add: progressBar withConstraints: [:constraints | constraints height:20];
			 add: (SpBoxLayout newLeftToRight
					  spacing: 15;
					  add: startButton;
					  add: pauseButton;
					  add: resetButton;
					  yourself)
					expand: false;
			 yourself)
]

{ #category : #accessing }
EyeDropInfoPresenter >> name [

	^ name
]

{ #category : #accessing }
EyeDropInfoPresenter >> name: anObject [

	name := anObject
]

{ #category : #'accessing - computed' }
EyeDropInfoPresenter >> percentage [ 

	self eyeDrop ifNil: [ ^0 ]
	ifNotNil: [ ^eyeDrop percentage ]
]

{ #category : #accessing }
EyeDropInfoPresenter >> phase [

	^ phase
]

{ #category : #accessing }
EyeDropInfoPresenter >> phase: anObject [

	phase := anObject
]

{ #category : #accessing }
EyeDropInfoPresenter >> progressBar [

	^ progressBar
]

{ #category : #accessing }
EyeDropInfoPresenter >> progressBar: anObject [

	progressBar := anObject
]
