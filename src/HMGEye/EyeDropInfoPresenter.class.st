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
		'resetButton',
		'secondsPassed',
		'timeRemaining'
	],
	#category : #'HMGEye-ui'
}

{ #category : #accessing }
EyeDropInfoPresenter >> eyeDrop [

	^ eyeDrop
]

{ #category : #accessing }
EyeDropInfoPresenter >> eyeDrop: anEyeDrop [
	eyeDrop := anEyeDrop.
	eyeDrop addWatcher: self. 

]

{ #category : #initialization }
EyeDropInfoPresenter >> initializePresenter [

	| pauseButton |
	name := self newLabel.
	phase := self newLabel.
	timeRemaining := self newLabel label: '0:00'.
	secondsPassed := self newLabel label: '0:00'.
	startButton := self newButton label: 'Start'; action: [self  start].
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
			 add: (SpBoxLayout newHorizontal  
					  spacing: 15;
					  add: secondsPassed expand: false;
					  add: (SpBoxLayout newTopToBottom
								add: progressBar withConstraints: [ :constraints | constraints height: 15]);
					  add: timeRemaining expand: false;
					  yourself)
			 expand: false;
			 add: (SpBoxLayout newLeftToRight
					  spacing: 15;
					  add: startButton;
					  add: pauseButton;
					  add: resetButton;
					  yourself)
			 expand: false;
			 yourself)    
]

{ #category : #updating }
EyeDropInfoPresenter >> modelChanged [
	
	name label: (self eyeDrop) drop name. 
	phase label: (self eyeDrop) stepName. 
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

{ #category : #accessing }
EyeDropInfoPresenter >> start [ 
" eyeDrop start."
 eyeDrop addWatcher: self. 
 self modelChanged 
]
