
_global.$textVarsContainer$={}
  $textVarsContainer$.loadedFileArray = [];
  $textVarsContainer$.thisPath=this;
  $textVarsContainer$.preloadXmlObj ={};


//custom function to load xml files

 _global.loadObj=function(xmlSrc)
      {  
        $textVarsContainer$.preloadXmlObj = new XML();
        $textVarsContainer$.preloadXmlObj.ignoreWhite = true;

        $textVarsContainer$.preloadXmlObj.onLoad = function (success) {
                 if (success) {
	                var tempXML=$textVarsContainer$.preloadXmlObj.firstChild;
                    $textVarsContainer$.thisPath.xmlExtractor(tempXML);
                        }
	      };

     var tempString="content/text_data/"+xmlSrc;
    $textVarsContainer$.preloadXmlObj.load(tempString);
      }
 
 //extracts data from xml obj
  function xmlExtractor(tempXML)
      {   var totalNodes=tempXML.childNodes.length;
         for(i=0;i<totalNodes;i++)
                {
                      var tempNode=new Xml(tempXML.childNodes[i].firstChild.nodeValue);
                      var thisText=tempNode.toString();
                       thisText.toString();
                      var thisIndex=tempXML.childNodes[i].attributes.index;
                      var thisPageId=tempXML.childNodes[i].attributes.pageId;
                    
                            //put data in loadedFileArray
                            $textVarsContainer$.loadedFileArray[thisIndex]={id:thisIndex,pageId:thisPageId,myText:thisText};
                   
                          if(i==totalNodes-1)
                           {
                              $textVarsContainer$.thisPath.play();
                                   }
                           }
		   }

 
  //get loaded msg
     _global.getMsg = function(id) {
        var matchFound=false;
          var augType=typeof(id);
          var tempText=""
		if(augType=="number")
                     {  tempText =  $textVarsContainer$.loadedFileArray[id].myText;
                             } 
		 else if(augType=="string") 
		       { 
				 //search for a match
				     for(ii in $textVarsContainer$.loadedFileArray)
					     {  
						 var tempPageId= $textVarsContainer$.loadedFileArray[ii].pageId;
						    if(id.toLowerCase()==tempPageID.toLowerCase())
						           {
							  tempText = $textVarsContainer$.loadedFileArray[ii].myText ;
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