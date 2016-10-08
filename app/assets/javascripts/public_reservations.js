
  $( function() {

    $.datepicker.setDefaults({ dateFormat: 'dd/mm/yy' });

    var dateFormat = "dd/mm/yy",
      from = $( "#from" ).datepicker({
        changeMonth: true,
        numberOfMonths: 2,
        minDate: 0
      })
      .on( "change", function() {
        to.datepicker( "option", "minDate", getDate( this ) );
      }),
      
      to = $( "#to" ).datepicker({
        changeMonth: true,
        numberOfMonths: 2,
        minDate: 0
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );

