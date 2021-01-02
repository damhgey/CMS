Class {
	#name : #CMSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Contact-Management'
}

{ #category : #accessing }
CMSession >> user [
	^ user
]

{ #category : #accessing }
CMSession >> user: anObject [
	user := anObject
]
