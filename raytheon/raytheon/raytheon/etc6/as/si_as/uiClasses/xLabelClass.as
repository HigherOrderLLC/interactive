/////
_global.xLabelClass=function()
 { 
 
	this.xButton.onRollOver=function()
	  {
		  undefined;
		 
	 
 }

 
    }
	
	xLabelClass.prototype.getSiPage=function()
	{  
                       //////////////////////////////
 trace(this.msg);
 trace(this.certMsg);
                         if(cert==1)
                                { 
                                    if(this.certMsg!=null)
                                            {
                                      var tempMsg=this.certMsg
                                              }
                                         else{
                                             var tempMsg=this.msg
                                             }

                                 }

                          else if(cert==0 or cert==null)
                                  {var tempMsg=this .msg
                                            }

             ///////////////////////////////////
		  //trace(this.jumpTo);
		 if(this.linkId == "na" or this.linkId == "na" or this.linkId == undefined)
		     {trace(tempMsg);
				 callCoach(this.msgMood,tempMsg,this.jumpTo,this.talkTime);
		     }
			  else
			    {
					 siBrowser.getPage(this.linkId);
					
					}
		
	}
	
  Object.registerClass("xListInstance",xLabelClass);