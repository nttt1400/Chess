"
it's a pawn what do you expect !?!
"
Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'commands' }
MyPawn >> attackingSquares [

	| forward |
	forward := self isWhite
		ifTrue: [ square up ]
		ifFalse: [ square down ].
	forward ifNil: [ ^ #() ].

	^ { forward left. forward right } select: [ :target |
		target notNil ]
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| forward captures |
	forward := self isWhite
		ifTrue: [ { square up } ]
		ifFalse: [ { square down } ].
	forward ifNil: [ ^ #() ].

	captures := {
		forward left.
		forward right }
		select: [ :target |
			target notNil and: [
				target hasPiece and: [ target contents color ~= color ] ] ].

	forward hasPiece ifTrue: [ ^ captures ].
	^ { forward }, captures
]
