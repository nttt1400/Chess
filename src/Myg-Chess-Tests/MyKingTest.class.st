Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testId [

	self assert: MyKing new id equals: 'K'
]

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an same color rook on e column"
	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsPiece [ 
	| kingPiece |
	
   kingPiece := MyKing new.
	self assert: (kingPiece isPiece).
]

{ #category : 'tests' }
MyKingTest >> testKingCanCaptureUnprotectedEnemyPiece [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).
	board at: 'e5' put: MyRook black.

	self assert: (king targetSquares includes: (board at: 'e5'))
]

{ #category : 'tests' }
MyKingTest >> testKingCannotMoveIntoRookAttack [

	| king board |
	board := MyChessBoard empty.
	board at: 'e1' put: (king := MyKing white).
	board at: 'e8' put: MyRook black.

	self deny: (king legalTargetSquares includes: (board at: 'e2'))
]

{ #category : 'tests' }
MyKingTest >> testPinnedPieceCannotExposeKing [

	| board rook |
	board := MyChessBoard empty.
	board at: 'e1' put: MyKing white.
	board at: 'e2' put: (rook := MyRook white).
	board at: 'e8' put: MyRook black.

	self deny: (rook legalTargetSquares includes: (board at: 'd2')).
	self assert: (rook legalTargetSquares includes: (board at: 'e3'))
]

{ #category : 'tests' }
MyKingTest >> testMovesWithSameColorObstacle [
    | king squares board |
    board := MyChessBoard empty.
    board at: 'e4' put: (king := MyKing white).

    "King cannot move onto squares occupied by same-color pieces"
    board at: 'e5' put: MyRook white.

    squares := king targetSquares.
    self
        assertCollection: squares
        includesAll:
            (#( d5 f5 d4 f4 d3 e3 f3 ) collect: [ :name |
                    board at: name ]).
    self deny: (squares includes: (board at: 'e5')).
]
