$(function() {
  return $('select#package_country').change(function(event) {

    var country, select_wrapper, url;
    select_wrapper = $('#package_state_wrapper');
    $('select', select_wrapper).attr('disabled', true);
    country = $(this).val();
    url = "/packages/subregion_options?parent_region=" + country;
    return select_wrapper.load(url);
 
  });
});