//store current xml item list.
 _global. tempXList="";
 //Store temp Mc
 _global.$tempDoc=""
 //store history vars
_global.browseHistory={};
   browseHistory.pageVisited=new Array();
   browseHistory.documentId=new Array();
    browseHistory.documentTracker=1;
 /////////////////////////////////////////////////////////////////
  _global.browserModel=function()
      {
	    }
	   //initialize the browserModel class
  _global.siBrowser=new browserModel();
      //browser model methods
    browserModel.prototype.getPage=function(id)
         {  
		 resetCoach();
		 ///check id for coach activation
		 checkPageId(id);
		 /////////
		   if(siMainXml.childNodes[id].attributes.content_type=="xList")
		        {
			     _global.tempXlist="";
	              tempXlist=siMainXml.childNodes[id].childNodes;
				  browseHistory.documentId.splice(0);
				  browserHistory.documentTracker=1;
		           }
			else if(siMainXml.childNodes[id].attributes.content_type=="mc")
			   {  
			    if(browseHistory.documentId[0]==undefined)
			     {
				    browseHistory.documentId[0] = browseHistory.pageVisited[browseHistory.pageVisited.length-1];
					   }
			     this.pushDocId(id);
			  //   (browseHistory.documentTracker);
			 //  (  browseHistory.documentId);
			    _global.$tempDoc="";
	            _global.$tempDoc=id;
			}
		    /////browseHistory.pageVisited={title:siMainXml.childNodes[id].attributes.title,pageId:id};
			  browserModel.prototype.getNewDoc=function(id)
                  { 
				  browseHistory.documentTracker+=1;
				   this.getPage(id);
				  }
		    ///////////////////////////////////////////////////////////////////////
		  pathInfo.root.gotoAndPlay(siMainXml.childNodes[id].attributes.tmpl_type);
		   //push page info to the Browser's History
		  this.pushCurrentPg(id);
		   }

  browserModel.prototype.generateXlist=function(path,xSource)
         {  var currtentXlist=xSource;
			 var tempXlength=currtentXlist.length;
			 var tempXpath=path;
			  tempXpath.xListMc.createEmptyMovieClip("listShell",0); 
	     for(i=0;i<tempXlength;i++)
		  {    
		  var tempMc2= tempXpath.xListMc.listShell.attachMovie("xListInstance","listItem"+i,i+2)
		   tempMc2.xLabel.htmlText="";
	       
		    tempMc2._y= i*20;
		          tempMc2.label=currtentXlist[i].attributes.label;
		         tempMc2.linkId=currtentXlist[i].attributes.linkId;
				  tempMc2.jumpTo=currtentXlist[i].attributes.jumpTo;
				  tempMc2.talkTime=currtentXlist[i].attributes.talkTime;
				  tempMc2.msg=currtentXlist[i].attributes.msg;
                                  //////////alternative msg
                                 tempMc2.certMsg=currtentXlist[i].attributes.certMsg; 
                                   ///////////
			      tempMc2.msgMood=currtentXlist[i].attributes.msgMood;
			      tempMc2.bulletStyle=currtentXlist[i].attributes.bulletStyle;
				  tempMc2.xBullet.gotoAndStop(tempMc2.bulletStyle);
                          tempMc2.xLabel.htmlText="<A HREF=\"asfunction:getSiPage\">"+"<u>"+currtentXlist[i].attributes.label+"</u>";
				  }
		    tempXpath.tmpl1Footer._y=tempXpath.xListMc._y+tempXpath.xListMc._height;
			pathInfo.scrollPane.refreshPane();
			pathInfo.scrollPane.setScrollPosition(0);
			///////////////////////////
			      this.setBreadCrumbs();
	        }
			///////////////////////////////////////////////////////////////////
			
			   browserModel.prototype.loadMc=function(docId, holderName)
                      {   
	          var tempMcPath=holderName._parent;
			  var mcName=siMainXml.childNodes[docId].attributes.content
			  tempMcPath.tmpl3Title.text=siMainXml.childNodes[docId].attributes.title;
			 // var h = holderName==undefined ? "holder" : holderName;
             var h =holderName
            // this.createEmptyMovieClip(h, 1);
            h._visible = false;
         h.loadMovie("content/media_data/"+ mcName);
		 pathInfo.preloadMc.gotoAndStop(2);
		
         var id = setInterval(function (mc) {
			   
            if (mc.getBytesTotal() == mc.getBytesLoaded()) {
                 mc._alpha = 99;
				 pathInfo.preloadMc.gotoAndStop(1);
			 h._parent.tmpl3Footer._y=h._y+h._height+30;
			  pathInfo.scrollPane.refreshPane();
			pathInfo.scrollPane.setScrollPosition(0);
            clearInterval(id);
            // may want to move this next line to the onComplete routine
            // instead, if visibility is to be set after positioning
                //  mc._visible = true;
          //  mc.onComplete();
              } else {
				   pathInfo.preloadMc.gotoAndStop(3);
            ///mc.onLoading();
               }
       }, 80, h);  
   // tempXpath.tmpl1Footer._y=tempXpath.xListMc._y+tempXpath.xListMc._height;
			                  }
			
			
			////////////////////////////////////////////////////////////////////////
     browserModel.prototype.pushCurrentPg =function(id)
     {    
       browseHistory.pageVisited.push(id);
	   
       for(ii=0;ii<browseHistory.pageVisited.length;ii++)
	            {   
                 if(id == browseHistory.pageVisited[ii])
	                {
		             browseHistory.pageVisited.splice(ii, browseHistory.pageVisited.length,id)
					 break;
		            }
                 }
		 //  browseHistory.pageVisited.push(id);  
     }
	 ////push Doc Ids
	  browserModel.prototype.pushDocId=function(id)
  {  
 var  pushFlag=true;
  for(ii=0;ii<browseHistory.documentId.length;ii++)
	     {  
	     if(id == browseHistory.documentId[ii])
	      {
		  pushFlag=false;
		  }
		 }
  if(pushFlag==true){
	    browseHistory.documentId.push(id);
		  } 
		  pushFlag=true;
   
}
 //set bread crumbs
 browserModel.prototype.setBreadCrumbs=function()
      {var tempText="";
	   var tempNum="";
		 for(iii=0;iii<browseHistory.pageVisited.length;iii++)
		        {
			if(iii!=browseHistory.pageVisited.length-1)
					{
			     tempNum=browseHistory.pageVisited[iii];
			     tempText+= "<A HREF=\"asfunction:siBrowser.getPage,"+tempNum+"\">"+"<font color=\"#0000ff\">"+"<u>"+siMainXml.childNodes[tempNum].attributes.title +"</u>"+"</font>"+"</a>"+" - ";
					}
			  else{
				  tempNum=browseHistory.pageVisited[iii];
			      tempText+= siMainXml.childNodes[tempNum].attributes.title ;
					   }
			}
	 pathInfo.scrollPaneContent.breadCrumbs.htmlText= tempText;
	  }
 
