window.InitUserScripts = function()
{
var player = GetPlayer();
var object = player.object;
var addToTimeline = player.addToTimeline;
var setVar = player.SetVar;
var getVar = player.GetVar;
window.Script1 = function()
{
  var player = GetPlayer();

function sendAPIStatement(){
	console.log("sendAPIStatment called.");
	player.SetVar("sendstatement",true);
	thissendstatement = player.GetVar("sendstatement");
	console.log(thissendstatement);
 }
 
window.addEventListener("message", function(event) {
    if (event.data === "trigger_xapi") {
      console.log("Message heard.");
      sendAPIStatement();
    }
}, false);
}

};
