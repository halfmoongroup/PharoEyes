Class {
	#name : #ClockTest,
	#superclass : #TestCase,
	#category : #'HMGEye-test'
}

{ #category : #tests }
ClockTest >> testInitializeClock [

	| clock |
	clock := Clock new.
	self assert: clock duration equals: 10.
	self assert: clock tick equals: 0. 
	self assert: clock runningclock isNotNil. 
	self assert: clock action isNil. 
	
]

{ #category : #tests }
ClockTest >> testInitializeWithParms [

	| clock |
	clock := Clock withBlock: [ 5 ] andDuration: 25. 
	self assert: clock duration equals: 25.
	self assert: clock tick equals: 0. 
	self assert: clock runningclock isNotNil. 
	self assert: (clock action value) equals: 5. 
	
]

{ #category : #tests }
ClockTest >> testRunningClock [ 

	| clock |
	clock := Clock withBlock: [ 5 ] andDuration: 25. 
	self assert: clock duration equals: 25.
	self assert: clock tick equals: 0. 
	self assert: clock runningclock isNotNil. 
	self assert: (clock action value) equals: 5. 
	
]
