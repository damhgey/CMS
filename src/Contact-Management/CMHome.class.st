Class {
	#name : #CMHome,
	#superclass : #WAComponent,
	#category : #'Contact-Management'
}

{ #category : #rendering }
CMHome >> renderContentOn: html [
			
	html image id: 'image';
		altText: 'Welcome to CL-Managment';
		url: LBFileLibrary / 'odoo.jpg';
	yourself.	
]

{ #category : #updating }
CMHome >> updateRoot: anHtmlRoot [
super updateRoot: anHtmlRoot.
anHtmlRoot title: anHtmlRoot title , ' -- Home'.
]
