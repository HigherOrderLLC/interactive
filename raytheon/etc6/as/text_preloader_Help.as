
_global.$helpTextVarsContainer$={}
  $helpTextVarsContainer$.loadedFileArray = [];
  $helpTextVarsContainer$.thisPath=this;
  $helpTextVarsContainer$.preloadXmlObj ={};


//custom function to load xml files

 _global.loadHelpObj=function(xmlSrc)
      {  
        $helpTextVarsContainer$.preloadXmlObj = new XML();
        $helpTextVarsContainer$.preloadXmlObj.ignoreWhite = true;

        $helpTextVarsContainer$.preloadXmlObj.onLoad = function (success) {
                 if (success) {
	                var tempXML=$helpTextVarsContainer$.preloadXmlObj.firstChild;
                    $helpTextVarsContainer$.thisPath.xmlExtractor(tempXML);
                        }
	      };

     var tempString="content/text_data/"+xmlSrc;
    $helpTextVarsContainer$.preloadXmlObj.load(tempString);
      }
 
 //extracts data from xml obj
  function xmlExtractor(tempXML)
      {   var totalNodes=tempXML.childNodes.length;
         for(i=0;i<totalNodes;i++)
                {
                      var tempNode=tempXML.childNodes[i].firstChild.nodeValue;
                      var thisText=tempNode.toString();
                       thisText.toString();
                      var thisIndex=tempXML.childNodes[i].attributes.index;
                      var thisPageId=tempXML.childNodes[i].attributes.pageId;
                    
                            //put data in loadedFileArray
                            $helpTextVarsContainer$.loadedFileArray[thisIndex]={id:thisIndex,pageId:thisPageId.toLowerCase(),myText:thisText};
                   
                          if(i==totalNodes-1)
                           {
                              $helpTextVarsContainer$.thisPath.play();
                                   }
                           }
		   }

 
  //get loaded msg
     _global.getHelpMsg = function(id) {
        var matchFound=false;
          var augType=typeof(id);
          var tempText=""
		if(augType=="number")
                     {  tempText =  $helpTextVarsContainer$.loadedFileArray[id].myText;
                             } 
		 else if(augType=="string") 
		       { 
				 //search for a match
				     for(ii in $helpTextVarsContainer$.loadedFileArray)
					     { 
						 var tempPageId= $helpTextVarsContainer$.loadedFileArray[ii].pageId;
						    if(id==tempPageID)
						           {
							  tempText = $helpTextVarsContainer$.loadedFileArray[ii].myText ;
							  matchFound=true
							   
						          }
						
							//returns error if pageId not Found
                                                        if(ii==0 and matchFound==false)
                                                           
                                                         {
                                                             tempText = "Page Id does not exist.";    
                                                                    }
						   	
					      }         
				     }
                      else{
                         tempText = "Need to pass a paramater.";          
                            }


  	          return tempText;
          };