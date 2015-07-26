# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	max = 140
	$(".erase-click").each ->
		$(this).parent().parent().find("textarea").val('')
		$(this).attr('value', 'Enter Text').attr('disabled',true)

	$('.new_sweet').bind 'ajax:complete', ->
		$(this).find("textarea").val('')
		$(this).find(".counter").text(max)

	$(".sweet_message").keyup (e) ->
		if @value.length > 0
			$(this).parent().parent().find('.erase-click').attr('value', 'Submit')
			$(this).parent().parent().find('.erase-click').attr('disabled',false)
		else
			$(this).parent().parent().find('.erase-click').attr('value', 'Enter Text')
			$(this).parent().parent().find('.erase-click').attr('disabled',true)
		$(this).parent().parent().find(".counter").text(max-@value.length)

	$(".sweet_message").keypress (e) ->
		if e.which < 0x20
			return
		if @value.length == max
			e.preventDefault()
		else if @value.length > max
			@value = @value.substring(0, max)
			return