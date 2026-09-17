Class {
	#name : 'MyKnightTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKnightTest >> testIsPiece [
	| knightPiece |
	
   knightPiece := MyKnight new.
	self assert: (knightPiece isPiece).
]

{ #category : 'tests' }
MyKnightTest >> testMovesWithOponentObstacle [

	| knight squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (knight := MyKnight white).

	"Knights jump in L-shape"
	board at: 'f6' put: MyKnight black.

	squares := knight targetSquares.
    self
        assertCollection: squares
        includesAll:
            (#( d6 f6 g5 g3 f2 d2 c3 c5 ) collect: [ :name |
                    board at: name ]).
]
