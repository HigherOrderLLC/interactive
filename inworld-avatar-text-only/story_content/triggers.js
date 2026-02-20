function ExecuteScript(strId)
{
  switch (strId)
  {
  }
}

window.InitExecuteScripts = function()
{
var player = GetPlayer();
var object = player.object;
var addToTimeline = player.addToTimeline;
var setVar = player.SetVar;
var getVar = player.GetVar;
};
function getActor() {
	var userName = parent.document.querySelector('#ms--user-display-name').textContent;
	var userEmail = parent.document.querySelector('p[data-profile-property="upn"]').textContent;

	console.log('User Name:', userName);
	console.log('Email Address:', userEmail);
  /*
  return {
    "mbox": "mailto:myexample@domain.com",
    "objectType": "Agent",
    "name": "My Example"
  };*/  
  return {
    "mbox": "mailto:" + userEmail,
    "objectType": "Agent",
    "name": userName
  };
}
