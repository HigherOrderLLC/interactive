window.InitUserScripts = function()
{
var player = GetPlayer();
var object = player.object;
var addToTimeline = player.addToTimeline;
var setVar = player.SetVar;
var getVar = player.GetVar;
window.Script1 = function()
{
  window.addEventListener('message', function(event) {
   // The received message
   var receivedVariable = event.data;
   console.log("Recieved variable" + receivedVariable)

   var player = GetPlayer();
   player.SetVar("message", receivedVariable);
}, false);

// Get the Storyline player
var player = GetPlayer();

//Testing variable change
player.SetVar("username", message);
player.SetVar("useremail", "Getting useremail");


}

};
