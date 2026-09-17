Class {
	#name : 'MyQueenTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyQueenTest >> testId [

	self assert: MyQueen new id equals: 'Q'
]

{ #category : 'tests' }
MyQueenTest >> testIsPiece [ 
	| queenPiece |
	
   queenPiece := MyQueen new.
	self assert: (queenPiece isPiece).
]
