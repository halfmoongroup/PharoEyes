Class {
	#name : #EyeDropTest,
	#superclass : #TestCase,
	#category : #'HMGEye-test'
}

{ #category : #tests }
EyeDropTest >> testAddStepWithDuration [
	| testObject |
	
	testObject := EyeDrop new.  
	self assert: (testObject steps size ) equals: 0. 
	self assert: (testObject stepNames size ) equals:0. 
	testObject addStep: 'aStep' withDuration: 5. 
	self assert: (testObject steps size ) equals: 1. 
	self assert: (testObject stepNames size ) equals:1. 
	self assert: (testObject stepNames at:1) equals: 'aStep'.
	
]

{ #category : #tests }
EyeDropTest >> testAddWatcher [

	|  eyeDrop |
	
	eyeDrop := EyeDrop fromDrop: (Drop  withName: 'DropTest' closed: 1 open: 2 apply: 11). 
	self assert: (eyeDrop watchers size) equals: 0. 
	eyeDrop addWatcher: 'aWatcher'. 
	self assert: (eyeDrop watchers size) equals: 1. 
	eyeDrop removeWatchers.
	self assert: (eyeDrop watchers size) equals: 0. 
	
]

{ #category : #'as yet unclassified' }
EyeDropTest >> testInitializeFromDrop [

	| drop testObj |
	drop := Drop  withName: 'DropTest' closed: 1 open: 2 apply: 11.
	testObj := EyeDrop fromDrop: drop. 
	self assert: testObj drop equals: drop. 
	self assert: testObj stepNames size equals: 2. 
	self assert: (testObj stepNames at:1) equals:'closed eyes'.
	self assert: (testObj stepNames at:2) equals:'open eyes'.
	self assert: (testObj percentage ) equals: 0.
	self assert: (testObj startTime isNil) equals: true. 
	self assert: (testObj timer isNil) equals: true.
]

{ #category : #tests }
EyeDropTest >> testTimer [
	| drop testObject |
	
	drop := Drop  withName: 'DropTest' closed: 1 open: 2 apply: 11.
	testObject := EyeDrop fromDrop: drop. 
	self assert: (testObject timer) isNil equals: true. 
	testObject start.
	self assert: (testObject timer) isNotNil equals: true. 
	self assert: (testObject startTime isNotNil) equals: true.
	self assert: (testObject stepName ) equals: 'closed eyes'.
	self assert: (testObject startTime isNotNil) equals: true. 
	

]
