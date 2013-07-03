# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
   jQuery ->
     $('#sel_dtest').change ->
      $('.jt_').hide()
      $('.jt_'+ $('#sel_dtest :selected').val()).show()
      # $('#testj').html(executeSql("select * from jtest where dtest_id = 22"))
      #alert($('#sel_dtest :selected').val())
       #alert(executeSql("select * from jtest where dtest_id = 22"))
