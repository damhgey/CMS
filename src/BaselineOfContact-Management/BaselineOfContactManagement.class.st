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
							
					spec baseline: 'PharoWeb' with: [ spec repository: 'github://LucFabresse/PharoWeb/src' ].
					spec package: 'TinyBlog' with: [ spec requires: #('PharoWeb') ].
					spec package: 'TinyBlog-Tests' with: [ spec requires: #('TinyBlog') ].
						
					spec
					package: 'Contact-Management';
					package: 'Contact-Management-Tests' with: [ spec requires: #('Contact-Management') ].
					
				   spec configuration: 'Seaside30' with: [
   					 spec
   					  version: #stable;
			        repository: 'http://www.squeaksource.com/MetacelloRepository' ].

		]

]
