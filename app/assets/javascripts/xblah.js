$(document).ready(function(){
	$('body').on('click', '.button_to', function(e){
		e.preventDefault();
		var path = $(this).attr('action'),
			  method = $(this).attr('method');
        if ($(':first-child', this).attr('value') == 'delete')
        	method = 'DELETE';
		$.ajax({
	      url: path,
	      type: method,
        dataType: 'html'
	    })
	    .done(function(response){
          $('#info').html(response);
	    })
	    .fail(function(response){
        console.log('fail')
	    })    
	});

	$('body').on('click', '.create-event', function(e){
		e.preventDefault();
		var path = $(this).attr('href');
		$.ajax({
	      url: path,
	      type: 'GET',
        dataType: 'html'
	    })
	    .done(function(response){
          $('#info').html(response);
	    })
	    .fail(function(response){
        console.log('fail')
	   	})    
	})

  // $('body').on('submit', '#event-form', function(e){
  // e.preventDefault();
  // var path = $(this).attr('action'),
  //     method = $(this).attr('method'),
  //     formData = $(this).serialize();
  // $.ajax({
  //     url: path,
  //     type: method,
  //     data: formData,
  //     dataType: 'json'
  //   })
  //   .done(function(response){
  //     $('#info').html('');
  //     console.log(response)
  //     map.featureLayer.setGeoJSON({
  //       type: "FeatureCollection",
  //       features: response
  //     });
  //   })
  //   .fail(function(response){
  //     console.log('fail')
  //   })    
  // })

  // $('body').on('click', '.sign-in', function(e){
		// e.preventDefault();
		// var path = $(this).attr('href');
		// $.ajax({
	 //      url: path,
	 //      type: 'GET',
  //       dataType: 'html'
	 //    })
	 //    .done(function(response){
  //         $('#sign-in-ajax').show();
  //         $('#sign-in-ajax').html(response);
	 //    })
	 //    .fail(function(response){
  //       console.log('fail')
	 //   	})       
  // })

}); //document ready