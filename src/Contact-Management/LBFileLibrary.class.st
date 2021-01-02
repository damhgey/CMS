Class {
	#name : #LBFileLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Contact-Management'
}

{ #category : #uploaded }
LBFileLibrary >> mainCss [ 

^ 'body {

}
	#allcontent {
		width: 100%;
		margin-left: auto;
		margin-right: auto;
}
	#header{
		color:#9e6593.
}
	#main{ 
	 margin: auto;
 	 width: 95%;
	 
}

  #image{ display: block;
 	 margin-left: auto;
 	 margin-right: auto;
 	 margin-bottom: 18px;
 	 width: 67%;
 	 height: 550px;
}
	#contact{
	margin-top:40px;
	 margin-left: 25%;
	font-family: "Times New Roman", Times, serif;
	font-size: 17px;font-weight: bold
}
	#hrline{
	 margin-right: 43%;
	border-bottom:5px solid grey
}
	#table{
	text-align:center;
	word-spacing: 1px;
	
	}
	#footer {
	  position: absolute;
    bottom: 0;
	width: 100%;
	margin:0 auto;
	text-align: center;
}
	#log{
	border:15px;
	border-color: black;
	margin-left:550px;
	margin-top:10px;
	}
form { display: table;}
form > div { display: table-row; }
form > div > * { display: table-cell; }
form textarea { height: 4em; width: 40em; }
form div.hidden { display: none; }
	*.sub{
	margin-left:650px;}
	#alert{width:40%;
	text-align:center;
	margin-left: 400px;
	margin-top: 120px}
'
]

{ #category : #uploaded }
LBFileLibrary >> odooJpg [
]