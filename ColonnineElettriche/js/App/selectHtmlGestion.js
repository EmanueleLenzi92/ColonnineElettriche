$(document).ready(function() {
	
	$("#selectStart").change(function() {
	  
	  $('#selectArrive').prop('disabled', false);
	  var att= $('select[id="selectStart"] :selected').attr('class')
	  
	  if (att == "start0") {
		  $( ".dest1" ).hide();
		  $( ".dest2" ).hide();
		  $( ".dest0" ).show();
		
	  } else if (att == "start1"){
		$( ".dest0" ).hide();
		$( ".dest2" ).hide();
		$( ".dest1" ).show();
	  } else {
		$( ".dest0" ).hide();
		$( ".dest1" ).hide();
		$( ".dest2" ).show();
	  }
	
	});


});