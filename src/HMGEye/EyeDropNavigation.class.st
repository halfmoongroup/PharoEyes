"
Ui Controls to navigate tasks
"
Class {
	#name : #EyeDropNavigation,
	#superclass : #SpPresenter,
	#instVars : [
		'nextButton',
		'startTimer',
		'resetTimer',
		'name',
		'stepName',
		'timeRemaining'
	],
	#category : #'HMGEye-ui'
}

{ #category : #initialization }
EyeDropNavigation >> initializePresenter [


	name := self newLabel. 
	stepName := self newLabel.
	timeRemaining := self newLabel. 
	startTimer := self newButton. 
	resetTimer := self newButton. 
	nextButton := self newButton. 
	
]
