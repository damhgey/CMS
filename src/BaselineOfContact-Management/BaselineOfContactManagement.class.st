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
					package: 'Contact-Management';
					package: 'Contact-Management-Tests' with: [ spec requires: #('Contact-Management') ].
		]

]
