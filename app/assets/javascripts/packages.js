$(document).ready(function() {

  setInterval(function() {
    // your code goes here...
  
     $("#bounce").effect( "bounce", {times:3}, 1500 );

  }, 8 * 1000);

 

  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  }); 

  return $('select#package_country').change(function(event) {

    var country, select_wrapper, url;
    select_wrapper = $('#package_state_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    country = $(this).val();
    url = "/packages/subregion_options?parent_region=" + country;
    return select_wrapper.load(url);
 
  });

  

});


