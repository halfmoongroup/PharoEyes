"
.838842-05:00 Test10.image priorSource: 99
"
Class {
	#name : #EyeDropDay,
	#superclass : #SpPresenter,
	#instVars : [
		'date',
		'drops',
		'timer',
		'info'
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
