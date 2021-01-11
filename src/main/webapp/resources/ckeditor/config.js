/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	  
	    
	CKEDITOR.on( 'dialogDefinition', function( ev ) {
		  var tab, field, dialogName = ev.data.name,
		      dialogDefinition = ev.data.definition;
		  var timerVal = null;
		  var defaultImageSize = 500;
		  var defaultImageI =300;
		  var infoTab; 
		  
		  
		  function timeoutHander()
			{
			  	//������ ���� info�̸� 
				var dialog = CKEDITOR.dialog.getCurrent();
				var img = new Image();
				//var img1 = new Image();
				var url = dialog.getValueOf('info','txtUrl');			
			  	img.src = url; // �̹��� ����
			  	//alert(img.src);
			  	if(img.width > 0 && img.height > 0)
			  	{
			  		var width = dialog.getValueOf('info','txtWidth');
			  		var height = dialog.getValueOf('info','txtHeight');
			  		clearInterval(timerVal);
			  			  		
			  		if(defaultImageSize > img.width)
			  			dialog.setValueOf('info','txtWidth',500);
			  		    dialog.setValueOf('info','txtHeight',300);
			  		if(defaultImageSize <= img.width)
			  		{
			  		  var ratio = defaultImageSize/img.width;	  		
			  		  dialog.setValueOf('info','txtWidth',500);
			  		  dialog.setValueOf('info','txtHeight',300);
			  		}
			  		
			  		img = null;
			  	}
			  	else	  		
			  	img = null;
		  	
			}

		  if( dialogName == 'image' )
		  { 

			
			infoTab = dialogDefinition.getContents( 'info' );
			txtWidth = infoTab.get( 'txtWidth' );
			txtHeight = infoTab.get( 'txtHeight' );
		    txtWidth['default'] = defaultImageSize;
		    txtHeight['default'] = defaultImageI;
		    //link tab remove
		    dialogDefinition.removeContents('link');
		    //advanced tab remove
		    dialogDefinition.removeContents('advanced');
		 
			
			dialogDefinition.onLoad = function()
			{
					
				 this.selectPage('Upload');
				
				var dialog = CKEDITOR.dialog.getCurrent();		
				
				dialog.on( 'selectPage', function( ev ) {
					
					//alert(ev.data.page);
					if(ev.data.page =='info')
					{				
			        	timerVal = setInterval(timeoutHander,100);        				       	
					}			
				});	
			}
		  }  //if( dialogName == 'image' )
			
			
		  
		});

};
