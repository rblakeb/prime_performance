// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .


function validateWodifyLeadForm()
{
	var reEmail = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	var returnValue = true;var fieldname=document.forms['wodifyLeadForm']['name'].value;
        if(fieldname==null||fieldname=='')
            {document.getElementById('errorname').style.display='inline';returnValue=false;}
        else
            {document.getElementById('errorname').style.display='none';}var fieldemail=document.forms['wodifyLeadForm']['email'].value;
	    if(fieldemail==null||fieldemail==''||!reEmail.test(fieldemail))
	        {document.getElementById('erroremail').style.display='inline';returnValue=false;}
	    else
	        {document.getElementById('erroremail').style.display='none';}var fieldlocation=document.forms['wodifyLeadForm']['location'].options[document.forms['wodifyLeadForm']['location'].selectedIndex].value;if(fieldlocation==null||fieldlocation=='')
	{document.getElementById('errorlocation').style.display='inline';returnValue=false;}
		else
	{document.getElementById('errorlocation').style.display='none';} return returnValue;
}; 