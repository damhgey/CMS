Class {
	#name : #CMLoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userID',
		'password'
	],
	#category : #'Contact-Management'
}

{ #category : #rendering }
CMLoginComponent >> login [
| user |
	user := CMUser	userWithID: userID
		password: password.
		self session user: user.
		user notNil ifTrue: [
		userID := nil.
		password := nil.
].
]

{ #category : #rendering }
CMLoginComponent >> renderContentOn: html [


	self session user isNil ifTrue: [
	self renderFormOn: html.
	] ifFalse: [
	html heading: 'Welcome, ' , self session user name.
	].
]

{ #category : #rendering }
CMLoginComponent >> renderFormOn: html [
	
		html div 
	id: 'alert';
	with:[html tbsAlert beSuccess;
			with: [ html strong: 'LogIn to enter Admin side'. ].].
	html div 
	id: 'log';
	with:[
	html form
	class: 'loginForm';	
		with: [
	self
		renderUserOn: html.
		html break.
		 self renderPasswordOn: html.
		html break.		
		self renderWarningOn: html.
		html break.
	 	html div class:'sub'; with: [self renderSubmitOn: html].
		html space:20
].
]
]

{ #category : #rendering }
CMLoginComponent >> renderPasswordOn: html [
	| htmlID |
	html div: [
		html label
			for: (htmlID := html nextId);
			with: 'Password:'.
	html passwordInput
		id: htmlID;
		value: password;
		callback: [ :value | password := value ];
	yourself.
].
]

{ #category : #rendering }
CMLoginComponent >> renderSubmitOn: html [
		html div: [
		html submitButton
		callback: [self login];
		with: 'LogIn'.
	].

]

{ #category : #rendering }
CMLoginComponent >> renderUserOn: html [
	| htmlID |
	html div: [
		html label
			for: (htmlID := html nextId);
			with: 'User:'.
		html textInput 
			id: htmlID;
			value: userID;
			callback: [ :value | userID := value ];
			script: 'document.getElementById(' ,
				htmlID printString , ').focus()';
			yourself.
].
]

{ #category : #rendering }
CMLoginComponent >> renderWarningOn: html [
	html div: [
		html
			span: '';
			span: self warning;
	yourself.
].
]

{ #category : #updating }
CMLoginComponent >> updateRoot: anHtmlRoot [
super updateRoot: anHtmlRoot.
anHtmlRoot title: anHtmlRoot title , ' -- Contact'.
]

{ #category : #rendering }
CMLoginComponent >> warning [
	self session user notNil ifTrue: [
		^ 'Logged in as ' , self session user name.
	].
	(userID isNil or: [ userID isEmpty ]) ifTrue: [
		^ 'Please enter User ID and Password'.
		].
	^ 'Login failed!'.
]
