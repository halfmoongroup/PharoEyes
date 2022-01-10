Class {
	#name : #DropTest,
	#superclass : #TestCase,
	#category : #'HMGEye-test'
}

{ #category : #tests }
DropTest >> testInit [

	| drop | 
	

	drop := Drop  withName: 'DropTest' closed: 1 open: 2 apply: 11.
	self assert: drop name equals: 'DropTest'.
	self assert: drop closed equals: 1.
	self assert: drop open equals: 2.
	self assert: drop apply equals: 11. 
]
