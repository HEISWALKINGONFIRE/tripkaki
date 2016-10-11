// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-sprockets
//= require typed
//= require filterrific/filterrific-jquery
//= require moment
//= require daterangepicker
//= require jquery.scrollTo
//= require turbolinks
//= require_tree .


$(function() {
  if ($("#filterrific_tour_type option:selected").val() == "private") {
      $("#filterrific_date_range").parent().hide();
      
    } else {

      $("#filterrific_date_range").show();
    }
	$(".index_page").css("height", $(window).height()+"px");
  $(".bg1").css("height", $(window).height()+$("footer").height()+"px");
  $(".bg2").css("height", $(window).height()+"px");
  $(".bg3").css("height", $(window).height()+$("footer").height()+"px");
	$(".role-selection input").on("click", function() {
		$(this).parent().submit();
	});

  $(".element").typed({
      strings: ["KIND OF HOLIDAY.", "SWEET MEMORIES.", "AWESOME TRIPS.", "SPECIAL GETAWAY." ],
      typeSpeed: 55
  });
  $('input[name="filterrific[date_range]"]').daterangepicker();
  $("#filterrific_tour_type").change(function() {
    if ($("#filterrific_tour_type option:selected").val() == "private") {
      $("#filterrific_date_range").parent().hide();
      
    } else {

      $("#filterrific_date_range").parent().show();
    }
  })


	$(window).scroll(function() {
	    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
	        $('#return-to-top').fadeIn(200);    // Fade in the arrow
	    }	else {
	        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
	    } 
	});
	$('#return-to-top').click(function() {      // When arrow is clicked
	    $('body,html').animate({
	        scrollTop : 0                       // Scroll to top of body
	    }, 500);
	});

  var availableTags = [
    "Kuala Lumpur",
    "Labuan",
    "Putrajaya",
    "Johor",
    "Kedah",
    "Kelantan",
    "Malacca",
    "Negeri Sembilan",
    "Pahang",
    "Pulau Pinang",
    "Perak",
    "Perlis",
    "Sabah",
    "Sarawak",
    "Selangor",
    "Terengganu"
    ];
    $( "#filterrific_search_query" ).autocomplete({
      source: availableTags
    });
   
    $( "#slider-range" ).slider({
      range: true,
      min: 20,
      max: 1000,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        $( "#filterrific_price_range" ).val(ui.values[0] + "-" + ui.values[1]);
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );

});

