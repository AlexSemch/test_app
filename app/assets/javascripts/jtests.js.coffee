jQuery ->
  dtests = $('#jtest_dtest_id').html()
  $('#dthem_id').change ->
    dthem = $('#dthem_id :selected').text()
    options = $(dtests).filter("optgroup[label='#{dthem}']").html()
    if options
      $('#jtest_dtest_id').html(options)
    else
      document.getElementsByClassName('btn dropdown-toggle')[1].hide();
      $('#jtest_dtest_id').empty()


