# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".erase-click").each ->
		$(this).parent().parent().find("textarea").val('')
		$(this).attr('value', 'Enter Text').attr('disabled',true)

	$(".submit-sweet-button").click ->
		text = $(this).parent().parent().find("textarea").val()
		$(this).parent().parent().parent().find(".thread").prepend(text + "<br>")

	$(".submit-main-button").click ->
		text = $(this).parent().parent().find("textarea").val()
		$("tr").first().clone().insertBefore("tbody")
		$("tr").first().find(".thread").text(text)

	$('.new_sweet').bind 'ajax:complete', ->
		$(this).find("textarea").val('')

	max = 140
	$(".sweet_message").keyup (e) ->
		if @value.length > 0
			$(this).parent().parent().find('.erase-click').attr('value', 'Submit')
			$(this).parent().parent().find('.erase-click').attr('disabled',false)
		else
			$(this).parent().parent().find('.erase-click').attr('value', 'Enter Text')
			$(this).parent().parent().find('.erase-click').attr('disabled',true)
		$(this).parent().parent().find(".counter").text(140-@value.length)

	$(".sweet_message").keypress (e) ->
		if e.which < 0x20
			return
		if @value.length == max
			e.preventDefault()
		else if @value.length > max
			@value = @value.substring(0, max)
			return