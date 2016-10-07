# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('select#package_country').change (event) ->
    select_wrapper = $('#package_state_wrapper')

    $('select', select_wrapper).attr('disabled', true)

    country = $(this).val()

    url = "/packages/subregion_options?parent_region=#{country}"
    select_wrapper.load(url)

