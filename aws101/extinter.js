// JavaScript Document
     var jsReady = false;
     function isReady() {
         return jsReady;
     }
     function pageInit() {
         jsReady = true;
		 //alert("JavaScript is ready");
         //document.forms["form1"].output.value += "\n" + "JavaScript is ready.\n";
     }
     function thisMovie(movieName) {
         if (navigator.appName.indexOf("Microsoft") != -1) {
             return window[movieName];
         } else {
             return document[movieName];
         }
     }
     function sendToActionScript(value) {
         thisMovie("ExternalInterfaceExample").sendToActionScript(value);
		 alert("sendToActionScript: " + value);
     }
     function sendToJavaScript(value) {
		 alert("sendToJavaScript: " + value);
        // document.forms["form1"].output.value += "ActionScript says: " + value + "\n";
     }