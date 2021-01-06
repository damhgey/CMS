Class {
	#name : #CMContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'email',
		'phone',
		'address',
		'jopPosition',
		'note'
	],
	#classInstVars : [
		'contacts'
	],
	#category : #'Contact-Management'
}

{ #category : #accessing }
CMContact class >> contacts [
	contacts  ifNil: [ contacts := IdentitySet new ].
	^ contacts.
]

{ #category : #accessing }
CMContact class >> createContacts [
"
LBEvent createEvents.
"
	contacts := nil.
	self contacts 
		add: (self new
			name: 'Mohamed mohamed';
			email: 'mohamed@gmail.com';
			address:'Giza-Egypt';
			phone: 0123456789;
			jopPosition:'HR';
			note:'New employee'
			yourself);
		add: (self new
			name: 'karim karim';
			email: 'karim@gmail.com';
			address:'Giza-Egypt';
			phone: 0123456789;
			jopPosition:'Sales';
			note:'New employee'
			yourself);
		add: (self new
			name: 'Omar Omar';
			email: 'Omar@gmail.com';
			address:'Giza-Egypt';
			phone: 0123456789;
			jopPosition:'Marketing';
			note:'New employee'
			yourself);
yourself.
]

{ #category : #accessing }
CMContact >> <= anEvent [
^ self name  <= anEvent name.
]

{ #category : #accessing }
CMContact >> address [
	^ address
]

{ #category : #accessing }
CMContact >> address: anObject [
	address := anObject
]

{ #category : #accessing }
CMContact >> email [
	^ email
]

{ #category : #accessing }
CMContact >> email: anObject [
	email := anObject
]

{ #category : #accessing }
CMContact >> initialize [ 

	super initialize .
	name :='Ahmed '.
	email :='ahmed@gmail.com'.
	phone := 01215686548 asNumber .
	address := 'Cairo-Egypt'.
	jopPosition := self jopPositionList first.
	note := ''
]

{ #category : #accessing }
CMContact >> jopPosition [
	^ jopPosition
]

{ #category : #accessing }
CMContact >> jopPosition: anObject [
	jopPosition := anObject
]

{ #category : #accessing }
CMContact >> jopPositionList [
^#('Developer' 'HR' 'Accountant' 'Marketing' 'Sales').
]

{ #category : #accessing }
CMContact >> name [
	^ name
]

{ #category : #accessing }
CMContact >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CMContact >> note [
	^ note
]

{ #category : #accessing }
CMContact >> note: anObject [
	note := anObject
]

{ #category : #accessing }
CMContact >> phone [
	^ phone asNumber 
]

{ #category : #accessing }
CMContact >> phone: anObject [ 
	phone := anObject  asNumber 
]
