Class {
	#name : #CMUser,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'password'
	],
	#classInstVars : [
		'users'
	],
	#category : #'Contact-Management'
}

{ #category : #accessing }
CMUser class >> userWithID: idString password: passwordString [
^ self users
detect: [ :each | each id = idString and:
[ each verifyPassword: passwordString ] ]
ifNone: [ nil ].
]

{ #category : #accessing }
CMUser class >> users [
users ifNil: [
users := IdentitySet with: (self new
id: 'admin';
name: 'Site Administrator';
password: 'passwd';
yourself).
 ].
^ users.
]

{ #category : #accessing }
CMUser >> <= aUser [
^self id <= aUser id.
]

{ #category : #accessing }
CMUser >> id [
	^ id
]

{ #category : #accessing }
CMUser >> id: anObject [
	id := anObject
]

{ #category : #accessing }
CMUser >> initialize [
super initialize.
id := ''.
name := ''.
password := 0.
]

{ #category : #accessing }
CMUser >> name [
	^ name
]

{ #category : #accessing }
CMUser >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CMUser >> password [
	^ password
]

{ #category : #accessing }
CMUser >> password: anObject [
	password := anObject hash.
]

{ #category : #accessing }
CMUser >> verifyPassword: aString [
^ aString hash = password.
]
