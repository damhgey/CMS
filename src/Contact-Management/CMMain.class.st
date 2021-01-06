Class {
	#name : #CMMain,
	#superclass : #WAComponent,
	#instVars : [
		'mainArea'
	],
	#category : #'Contact-Management'
}

{ #category : #'class initialization' }
CMMain class >> canBeRoot [ 
	^true
]

{ #category : #'class initialization' }
CMMain class >> initialize [
      "self initialize"

      | app |

      app := WAAdmin register: self asApplicationAt: 'contact'.
		app 
		preferenceAt: #sessionClass put:CMSession.
      app
         addLibrary: JQDeploymentLibrary;
         addLibrary: JQUiDeploymentLibrary;
         addLibrary: TBSDeploymentLibrary;
			addLibrary: TBSDevelopmentLibrary 
]

{ #category : #initialization }
CMMain >> children [
^ super children , (Array with: mainArea).
]

{ #category : #initialization }
CMMain >> initialize [
super initialize.
mainArea := CMHome new.
]

{ #category : #rendering }
CMMain >> renderContactAnchorOn: html [

		html tbsNavbarBrand 
				callback: [mainArea := CMContactComponent  new];
				with: 'Contacts'.
]

{ #category : #rendering }
CMMain >> renderContentOn: html [
	html div
		id: 'allcontent';
		with: [
				self
					renderHeaderOn: html;
					renderMainOn: html;
					renderFooterOn: html;
					yourself.
				].
			

	
]

{ #category : #rendering }
CMMain >> renderFooterOn: html [
	
	html div
		id: 'footer';
		with: [
			html tbsAlert 
			beInfo ;
			with: [ html text: 'Copyright (c) ' , Date today year printString. ].
				
				].

]

{ #category : #rendering }
CMMain >> renderHeaderOn: html [
	
	html div id: 'header';
	class: '';
	with: [	
			html tbsNavbar  beDefault  with: [ 
				
				self
				renderHomeAnchorOn: html;
			   	renderContactAnchorOn: html ;
				renderUserOn: html;
				yourself .
				
				
				
		"		html tbsNavbarBrand  
					callback: [ mainArea := CMHome  new ];
					with: 'Home'.
			html tbsNavbarBrand 
				callback: [mainArea := CMContactComponent  new];
				with: 'Contacts'."
		"		
		html tbsNavbarButton 
				tbsPullRight 					
					with:[ 
						html anchor	
						callback: [mainArea := CMLoginComponent new];
						with: 'LogIn'. 
						html space: 1.
						html tbsGlyphIcon iconLogin .]"
					
	
					]
		].

			
	
]

{ #category : #rendering }
CMMain >> renderHomeAnchorOn: html [

			html tbsNavbarBrand  
					callback: [ mainArea := CMHome  new ];
					with: 'Home'
]

{ #category : #rendering }
CMMain >> renderLoginAnchorOn: html [

		html tbsNavbarButton 
				tbsPullRight 					
					with: [  
						html anchor	
						callback: [ mainArea := CMLoginComponent new ];
						with: [html strong with:'LogIn']. 
						html space: 1.
						html tbsGlyphIcon iconLogin . ].
					
			

]

{ #category : #rendering }
CMMain >> renderLogoutAnchorOn: html [

		html tbsNavbarButton 
				tbsPullRight 					
					with: [ 
						html anchor	
						callback:[ self session user: nil ];
						with: 'LogOut'. 
						html space: 1.
						html tbsGlyphIcon iconLogout  .]
					
]

{ #category : #initialization }
CMMain >> renderMainOn: html [

	html div
	id: 'main';
	with: [	"html tbsAlert 
			beSuccess ;
			with: [ html strong: 'Welcome to Contact list management'. ]."
		 html render: mainArea
		 ].
]

{ #category : #rendering }
CMMain >> renderUserOn: html [
self session user isNil ifTrue: [
self renderLoginAnchorOn: html.
] ifFalse: [
self renderLogoutAnchorOn: html.
].
html break.
]

{ #category : #initialization }
CMMain >> updateRoot: anHtmlRoot [
super updateRoot: anHtmlRoot.
anHtmlRoot title: 'CMS'.
anHtmlRoot link
type: 'text/css';
beStylesheet;
addAll;
url: LBFileLibrary / 'main.css';
yourself.
]
