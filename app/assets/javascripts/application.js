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
//= require turbolinks
//= require_tree .
//= require typed
//= require filterrific/filterrific-jquery
//= require moment
//= require daterangepicker

$(function() {
  if ($("#filterrific_tour_type option:selected").val() == "private") {
      $("#filterrific_date_range").parent().hide();
      
    } else {

      $("#filterrific_date_range").show();
    }
	$(".index_page").css("height", $(window).height()+"px");
	$(".bg2").css("height", $(window).height()+"px");
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
});

