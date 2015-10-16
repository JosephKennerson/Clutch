$(document).ready(function(){
  console.log('hi')
	$('body').on('click', '.button_to', function(e){
		e.preventDefault();
		var path = $(this).attr('action'),
			  method = $(this).attr('method'),
        that = this;
		$.ajax({
	      url: path,
	      type: method,
        dataType: 'text'
	    })
	    .done(function(rsvpResponse){
        console.log('success')
        // if ($(that).val == "Join") {
          $(that).parent().append(rsvpResponse)
          $(that).remove();
        // }
        // else if (rsvpResponse.pending == true && rsvpResponse.confirmed == false) {
        // }
	    })
	    .fail(function(rsvpResponse){
        console.log('fail')
	    })    
	});

});
