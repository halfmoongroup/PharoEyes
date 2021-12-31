"
Application of a drop
"
Class {
	#name : #EyeDrop,
	#superclass : #Object,
	#instVars : [
		'drop',
		'appliedTime',
		'status'
	],
	#category : #HMGEye
}

{ #category : #accessing }
EyeDrop >> appliedTime [

	^ appliedTime
]

{ #category : #accessing }
EyeDrop >> appliedTime: anObject [

	appliedTime := anObject
]

{ #category : #accessing }
EyeDrop >> drop [

	^ drop
]

{ #category : #accessing }
EyeDrop >> drop: anObject [

	drop := anObject
]

{ #category : #accessing }
EyeDrop >> status [

	^ status
]

{ #category : #accessing }
EyeDrop >> status: anObject [

	status := anObject
]
