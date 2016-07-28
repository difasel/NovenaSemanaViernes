$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 
      var temp_image_1 = ""
      var temp_image_2 = ""

  // Aplicación Create
  $('#submit_1').click(function(event){
    console.log("Search 1");
    event.preventDefault();
    var option = $('#option_1').val();
    $.get('/search_img',{search:option}, function(data){
      // console.log(image_1);
      temp_image_1 = data;
      $("#image_1").html("<img width=\"200px\" class='image_sizer' src='" + data + "'>")
    });
  });

    $('#submit_2').click(function(event){
    console.log("Search 2");
    event.preventDefault();
    var option = $('#option_2').val();
    $.get('/search_img',{search:option}, function(data){
      temp_image_2 = data;
      // console.log(data);
      $("#image_2").html("<img width=\"200px\" class='image_sizer' src='" + data + "'>")
    });
  });

  $('#create_form').submit(function(event){
    event.preventDefault();
    var title = $("#title").val();
    var option_1 = $("#option_1").val();
    var option_2 = $("#option_2").val();
    var category = $(".category").val();
    var image_1 = temp_image_1;
    var image_2 = temp_image_2;
    console.log(category);
    console.log(title);
    console.log(image_1);
    console.log(image_2);
    console.log(option_1);
    console.log(option_2);
    $.post('/mashups/create', {category: category, title: title, option_1: option_1, option_2: option_2, image_1: image_1, image_2: image_2}, function( data ){
      window.location.href = '/mashups';
    });
  });

  $("#button_vote_1").click(function(){
    var bulean = true;
    if (bulean = true) {
      $("#button_vote_1").html("Already voted!")
      bulean = false
    }
  });



    // Aplicación Sidebar

$('#image_id1').click(function(){
		

		$("ul:nth-child(1)").animate({width: '60px'}, "slow");
		$("div.container_mashup").animate({marginLeft: '60px'}, "slow");
		$("ul:nth-child(1) li:nth-child(2)").hide();
		$("ul:nth-child(1) li:nth-child(3)").hide();
		$("ul:nth-child(1) li:nth-child(4)").hide();
		$("ul:nth-child(1) li:nth-child(5)").hide();
		$("ul:nth-child(1) li:nth-child(6)").hide();
		$("ul:nth-child(1) li:nth-child(7)").hide();
		$('#image_id1').hide();
		$('#image_id2').show();


	});

$('#image_id2').click(function(){
		
		console.log('test');
		$("ul:nth-child(1)").animate({width: '150px'}, "slow");
		$("div.container_mashup").animate({marginLeft: '150px'}, "slow");
		$("ul:nth-child(1) li:nth-child(2)").show();
		$("ul:nth-child(1) li:nth-child(3)").show();
		$("ul:nth-child(1) li:nth-child(4)").show();
		$("ul:nth-child(1) li:nth-child(5)").show();
		$("ul:nth-child(1) li:nth-child(6)").show();
		$("ul:nth-child(1) li:nth-child(7)").show();
		$('#image_id2').hide();
		$('#image_id1').show();


	});




});
