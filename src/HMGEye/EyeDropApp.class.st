"
An application for managing process of applying eyedrops
"
Class {
	#name : #EyeDropApp,
	#superclass : #Object,
	#instVars : [
		'eyedrops',
		'clock'
	],
	#category : #HMGEye
}

{ #category : #initialization }
EyeDropApp >> initialize [ 
	super initialize. 
	eyedrops := OrderedCollection new. 
	clock := Clock new. 
]
