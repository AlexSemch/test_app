# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery -> 
	$('#top_student').dataTable( {
    "oLanguage": {
      "sSearch": "Пошук:"
      "sLengthMenu": "Показувати _MENU_ записів"
      "sInfo": "Показано _START_ - _END_ з _TOTAL_ записів",

    }
  } )