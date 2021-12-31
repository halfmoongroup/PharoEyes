"
An application for managing process of applying eyedrops
"
Class {
	#name : #EyeDropDay,
	#superclass : #Object,
	#instVars : [
		'date',
		'morningDrops',
		'eveningDrops'
	],
	#category : #'HMGEye-functional'
}

{ #category : #initialization }
EyeDropDay >> initialize [
	super initialize.
	date := Date today.  
	morningDrops := (Drop sampleData select: [ :entry | 
		                 11 == entry status ]) collect: [ :item | 
		                EyeDrop fromDrop: item ].
	eveningDrops := (Drop sampleData select: [ :entry | 
		                 (entry status)>=10 ]) collect: [ :item | 
		                EyeDrop fromDrop: item ].
	
]
