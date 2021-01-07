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
			
					spec
						baseline: 'Seaside3'
						with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.2/repository' ].

					spec
					  package: 'Contact-Management';
					  package: 'Contact-Management-Tests' with: [ spec requires: #('Contact-Management') ].		
		]

]
