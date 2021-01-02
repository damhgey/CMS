Class {
	#name : #CMContactEditor,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'Contact-Management'
}

{ #category : #'instance creation' }
CMContactEditor class >> on: anEvent [
^self basicNew
initialize: anEvent;
yourself.
]

{ #category : #initialization }
CMContactEditor >> initialize: anEvent [
self initialize.
model := anEvent.
]

{ #category : #initialization }
CMContactEditor >> renderContentOn: html [

html tbsFormGroup: [ 
		html label for: 'name'; with: 'Enter Name'.
		html textInput tbsFormControl; id: 'name'; placeholder: 'Enter Name';value: model name;
						callback: [ :value | model name: value ].
						 ].
html tbsFormGroup: [ 
		html label for: 'email1'; with: 'Email address'.
		html textInput tbsFormControl; id: 'email'; placeholder: 'Enter email';value: model email;
						callback: [ :value | model email: value ]. ].
html tbsFormGroup: [ 
		html label for: 'phone'; with: 'Enter Phone Number'.
		html textInput tbsFormControl; id: 'phone'; placeholder: 'Enter Phone';value: model phone;
						callback: [ :value | model phone:  value ]. ].									
html tbsFormGroup: [ 
		html label for: 'address'; with: 'Enter Address'.
		html textInput tbsFormControl; id: 'phone'; placeholder: 'Enter Address';value: model address;
						callback: [ :value | model address:  value ]. ].	
								html horizontalRule .	
html tbsFormGroup: [	
	  | tagID | 
		html label for: (tagID := html nextId); with: 'Enter Jop Position'.html space: 7 .
		html select
					id: tagID;
					selected: model jopPosition ;
					list: model jopPositionList ;
					callback: [ :value | model jopPosition: value ]. ].	
					html horizontalRule .	
					
html tbsFormGroup: [ 
		html label for: 'note'; with: 'Enter Note'.
		html textInput tbsFormControl  ; id: 'note'; placeholder: 'Enter Note';value: model note;
						callback: [ :value | model note:  value ]. ].
html tbsFormGroup: [ 
	html anchor
		class: 'btn btn-default'; 
	  callback: [ self answer: true ];
						with: 'Save'.
						html space: 5.
	html tbsSubmitButton beDefault callback: [ self answer: false ];
					with: 'Cancel'.	 ]	.	


					
			

		
	

					
				
	"html form: [
		html table: [
			html tableBody: [
				html tableRow: [
					html tableHeading: 'Name:'.
						html tableData: [
						html textInput
						value: model name;
						callback: [:value | model name: value].
					].
			].
					html tableRow: [
						html tableHeading: 'Email'.
						html tableData: [
						html textInput
						value: model email ;
						callback: [:value | model email:   value].
				].
			].
				html tableRow: [
					html tableHeading: 'Phone:'.
					html tableData: [
					html textInput
					value: model phone ;
					callback: [:value | model phone:  value].
			].
		].
			html tableRow: [
						html tableHeading: 'Address:'.
						html tableData: [
						html textInput
						value: model address  ;
						callback: [:value | model address:  value].
				].
			].
	html tableRow: [
					| tagID |
					html div: [
					html label 
					for: (tagID := html nextId);
					with: 'Jop Position'.
					html select
					id: tagID;
					selected: model jopPosition ;
					list: model jopPositionList ;
					callback: [:value | model jopPosition: value].
				].
			].
		html tableRow: [
					html tableHeading: 'Phone:'.
					html tableData: [
					html textInput
					value: model phone ;
					callback: [:value | model phone:  value].
			].
		].
				html tableRow: [
						html tableHeading: 'Note:'.
						html tableData: [
						html textInput
						value: model note  ;
						callback: [:value | model note: value].
				].
			].
				html tableRow: [
					html tableData: [
					html cancelButton
					callback: [self answer: false];
					with: 'Cancel'.
			].
				html tableData: [
					html submitButton
					callback: [self answer: true];
						with: 'Save'.
				].
			].
		].
	].
]."
]
