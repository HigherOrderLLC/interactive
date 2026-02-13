//pass a custom msg to coach
 _global.callCoach= function(mood,msg,jumpId,talkTime)
   {  clearInterval(coachClock)
  if(mood=="")
	    {
 	   var tempMood="wait"	
    	  }
	else {
      var tempMood=mood}
	  var tempLoadObj = new LoadVars();
      var lString="content/text_data/si/"+msg;
	 // trace(lString);
      tempLoadObj.load(lString)
      tempLoadObj.onLoad =function(success)
         {
           if(success)
	         { //_parent.bubble._visible=true;
               var tempMsg=this.tMessage;
			   pathInfo.coachMc.coach_text=tempMsg;
			   pathInfo.coachMc.gotoAndPlay(jumpId)
			   pathInfo.coachMc.coach_mood=tempMood;
	   if(talkTime =="na" or talkTime ==""  or talkTime ==undefined)
					  { 
					    undefined;
					   }
				else
					{ coachTimer(talkTime); }
	          }
           else{
	         pathInfo.coachMc.coach_text="Message is not loading...";
			   pathInfo.coachMc.coach.gotoAndStop("think");
			   pathInfo.coachMc.gotoAndPlay("error")
			
	         }
          }
	   }
	   
	   //Coach timer
	  _global.coachTimer = function(talkTime) {
            var ticker=0;
           _global.coachClock = setInterval(function (talkTimeVal) {
          if (ticker >=talkTimeVal) {
               pathInfo.coachMc.gotoAndPlay("reset");
                clearInterval(coachClock);
             } else {
            ticker+=1;
        }
		 
    }, 1000, talkTime);  
};

	   //Coach timer
	  _global.resetCoach = function(page) {
            if(page==undefined)
			{
				      pathInfo.coachMc.gotoAndPlay("reset");
			}
			else{
				   pathInfo.coachMc.gotoAndPlay(page);
			}
};


///check which page id to call coach
 _global.checkPageId=function(pgId)
    {   var pgNum= new Number(pgId);
	   var tempPageInfo=siMainXml.childNodes[pgNum].attributes.msg;
	   trace(tempPageInfo);
         if(tempPageInfo == "na" or tempPageInfo == ""  or tempPageInfo == undefined)
		       { 
			    undefined;
			        }
	       else  {
			        var mood=siMainXml.childNodes[pgNum].attributes.msgMood;
			        var msg=siMainXml.childNodes[pgNum].attributes.msg
				    var jumpId=siMainXml.childNodes[pgNum].attributes.jumpTo;
				    var talkTime=siMainXml.childNodes[pgNum].attributes.talkTime;
			        callCoach(mood,msg,jumpId,talkTime);
			    }
                        
	     }
 

 



