# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery.fn.submitOnCheck = ->
	@find('input[type=checkbox]').live "click",  ->
		$(this).parent('form').submit()
		this
    #alert('!!click!!')
    #

jQuery ->
	$('.edit_janswer').submitOnCheck()