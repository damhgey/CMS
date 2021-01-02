Class {
	#name : #CMContactComponent,
	#superclass : #WAComponent,
	#instVars : [
		'listComponent'
	],
	#category : #'Contact-Management'
}

{ #category : #'class initialization' }
CMContactComponent class >> initialize [ 
WAAdmin register: self  asApplicationAt: 'contact-list'.
]

{ #category : #rendering }
CMContactComponent >> actionReportColumn [
	^ WAReportColumn new
		title: 'Action';
			valueBlock: [ :each :html |
				html anchor
				callback: [ self edit: each ];
				with: 'Edit'.
	html space .
			html anchor
			callback: [ self delete:  each ];
			with: 'delete'.
	] ;
yourself.
]

{ #category : #rendering }
CMContactComponent >> add [
| event editor |
event := CMContact  new.
editor := CMContactEditor  on: event.
(self call: editor) ifTrue: [
CMContact  contacts  add: event.
].
]

{ #category : #rendering }
CMContactComponent >> addressReportColumn [

	^ WAReportColumn new
		title: 'Address';
		selector: #address;
		clickBlock: nil;
		yourself.

]

{ #category : #rendering }
CMContactComponent >> delete: anEvent [
CMContact  contacts  remove: anEvent.
]

{ #category : #rendering }
CMContactComponent >> edit: anEvent [
	| editor answer |
	editor := CMContactEditor  on: anEvent.
	answer := self call: editor.
	answer
	ifTrue: [self inform: 'Edits were saved']
	ifFalse: [self inform: 'Edits were cancelled'].
]

{ #category : #rendering }
CMContactComponent >> emailReportColumn [
	^ WAReportColumn new
		title: 'Email';
		selector: #email;
		clickBlock: nil;
		yourself
]

{ #category : #rendering }
CMContactComponent >> initialize [
	| columns |
	super initialize.
	columns := OrderedCollection new
		add: self nameReportColumn;
		add: self emailReportColumn ;
		add: self phoneReportColumn ;
		add: self addressReportColumn ;
		add: self jopPositionReportColumn ;
		add: self noteReportColumn  ;
		yourself .
		self session user notNil ifTrue: [
		columns add: self actionReportColumn .
		]
yourself.
	listComponent := WATableReport new
	columns: columns;
	rowPeriod: 1;
	yourself.
]

{ #category : #rendering }
CMContactComponent >> jopPositionReportColumn [
	^ WAReportColumn new
		title: 'Position';
		selector: #jopPosition;
		clickBlock: nil;
		yourself
]

{ #category : #rendering }
CMContactComponent >> nameReportColumn [
	^ WAReportColumn new
		title: 'Name';
		selector: #name;
		clickBlock: nil;
		yourself
]

{ #category : #rendering }
CMContactComponent >> noteReportColumn [
	^ WAReportColumn new
		title: 'Note';
		selector: #note;
		clickBlock: nil;
		yourself
]

{ #category : #rendering }
CMContactComponent >> phoneReportColumn [
	^ WAReportColumn new
		title: 'Phone';
		selector: #phone;
		clickBlock: nil;
		yourself
]

{ #category : #rendering }
CMContactComponent >> renderContentOn: html [
	html div 
			id:'contact';
			with: [	 
					self session user notNil ifTrue: [ html anchor   
		 class: 'btn btn-primary';
		callback: [ self add ];
		with: 'Add New Contact'.	].
	 html horizontalRule id: 'hrline'.
	html div id:'table';
			with: [  listComponent rows: CMContact contacts asSortedCollection .
	 html render: listComponent. ]
     ].


	

]

{ #category : #rendering }
CMContactComponent >> updateRoot: anHtmlRoot [
super updateRoot: anHtmlRoot.
anHtmlRoot title: anHtmlRoot title , ' -- Contact'.
]
