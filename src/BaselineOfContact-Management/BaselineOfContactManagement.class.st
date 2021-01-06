Class {
	#name : #BaselineOfContactManagement,
	#superclass : #BaselineOf,
	#category : #'BaselineOfContact-Management'
}

{ #category : #baselines }
BaselineOfContactManagement >> baseline: spec [ 
	<baseline>
	spec
		for: #common
		do: [
					self tiny: spec .		
			
		
		
					spec
						package: 'Contact-Management';
						package: 'Contact-Management-Tests' with: [ spec requires: #('Contact-Management') ].
					
			

		]

]

{ #category : #'as yet unclassified' }
BaselineOfContactManagement >> tiny: spec [ 

	spec 
		baseline: 'TinyBlog'
		with: [ spec repository: 'github://LucFabresse/TinyBlog/src' ]

	
]
