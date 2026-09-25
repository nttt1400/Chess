Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testWhitePawnMovesForwardWhenSquareIsEmpty [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	self assert: (pawn targetSquares includes: (board at: 'e5')).
	self assert: pawn targetSquares size equals: 1
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMovesForwardWhenSquareIsEmpty [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e5' put: (pawn := MyPawn black).

	self assert: (pawn targetSquares includes: (board at: 'e4')).
	self assert: pawn targetSquares size equals: 1
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveForwardWhenSquareIsOccupied [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'e5' put: MyRook black.

	self deny: (pawn targetSquares includes: (board at: 'e5')).
	self assert: pawn targetSquares isEmpty
]

{ #category : 'tests' }
MyPawnTest >> testPawnCapturesOpponentDiagonally [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyRook black.
	board at: 'f5' put: MyKnight black.

	self assertCollection: pawn targetSquares includesAll: {
		board at: 'd5'.
		board at: 'e5'.
		board at: 'f5' }
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotCaptureSameColorOrEmptyDiagonal [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyRook white.

	self deny: (pawn targetSquares includes: (board at: 'd5')).
	self deny: (pawn targetSquares includes: (board at: 'f5')).
	self assert: pawn targetSquares equals: { board at: 'e5' }
]
