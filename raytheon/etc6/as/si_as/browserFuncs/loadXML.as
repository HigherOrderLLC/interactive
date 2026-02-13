//custom function to load xml files
 _global. loadXml=function(xmlObj,xmlSrc)
{  
    pathInfo.preloadMc.gotoAndStop(2);
  xmlObj = new XML();
  xmlObj.ignoreWhite = true;
  xmlObj.onLoad = function (success) {
 if (success) {
	   _global.siMainXml=xmlObj.firstChild;
		// trace(xmlObj.firstChild);
		//totalChild=xmlObj.childNodes.length;
		//firstItem=mainXml.firstChild;
	    pathInfo.root.gotoAndStop("mainPage");
		pathInfo.preloadMc.gotoAndStop(1);
	       }
	 };
  
xmlObj.load(xmlSrc);
 }
 
 