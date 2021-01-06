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
						
				   spec configuration: 'Seaside30' with: [
   					 spec
   					  version: #stable;
			        repository: 'http://www.squeaksource.com/MetacelloRepository' ].	
				
					spec
					package: 'Contact-Management';
					package: 'Contact-Management-Tests' with: [ spec requires: #('Contact-Management') ].
					


		]

]
