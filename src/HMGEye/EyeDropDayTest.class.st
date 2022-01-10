Class {
	#name : #EyeDropDayTest,
	#superclass : #TestCase,
	#category : #'HMGEye-test'
}

{ #category : #tests }
EyeDropDayTest >> testInit [

	| eyedropday |
	eyedropday   := EyeDropDay new. 
	eyedropday date: (DateAndTime  readFrom: '2021-01-07T12:59:59.876-05:00' readStream).
	self assert: (eyedropday morningDrops size) equals: 0. 
	self assert: (eyedropday eveningDrops size) equals: 0. 
	
	eyedropday drops:  (EyeDropDay sampleDropData).
	self assert: (eyedropday drops size ) equals: 1. 
	eyedropday date: (DateAndTime  readFrom: '2021-01-07T14:47:52.876-05:00' readStream).

	eyedropday drops:  (EyeDropDay sampleDropData).
	self assert: (eyedropday drops size ) equals: 3. 

	
	
]
