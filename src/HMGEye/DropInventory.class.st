Class {
	#name : #DropInventory,
	#superclass : #Object,
	#instVars : [
		'drops'
	],
	#category : #'HMGEye-functional'
}

{ #category : #initialization }
DropInventory class >> defaultDropData [

	| data |
	self initialize.
	data := OrderedCollection new.
	^ data
		  add: (Drop withName: 'wash'
					closed: 3
				   open: 0
				   apply: 11);
		  add: (Drop
				   withName: 'refresh'
				closed: 2
				open: 11
				apply: 11);
		  add: (Drop
				   withName: 'azopt'
					closed: 2
					open: 16
					apply: 11);
		  add: (Drop
				   withName: 'restasis'
					closed: 2
					open:0
					apply: 11);
		  add: (Drop
				   	withName: 'lantanaprost'
					closed: 2
					open: 0
					apply: 10);

		  add: (Drop
				   withName: 'geldrops'
				   closed: 2
					open: 0
				   apply: 10);
		  yourself
]

{ #category : #data }
DropInventory class >> testDropData [

	| data |
	data := OrderedCollection new.
   data
		  add: (Drop
				   withName: 'D&N Drop 1'
				   closed: 1
				   open: 1
				   apply: 11);
		  add: (Drop
				   withName: 'NightOnly Drop2'
				   closed: 2
				   open: 2
				   apply: 10);
		  add: (Drop
				   withName: 'NightOnly Drop3'
				   closed: 3
				   open: 3
				   apply: 10).
	^ EyeDrop fromDrops: data.
]
