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

	$(document).on 'click', '.button-sour-off', ->
		temp = $(this).val().match( /\d+/g )
		$(this).prop('value', "Sour (" + (parseInt(temp)+1) + ")")
		$(this).removeClass("button-sour-off")
		$(this).removeClass("btn-default")
		$(this).addClass("button-sour-on")
		$(this).addClass("btn-warning")
		sweet = $(this).parent().parent().parent().find(".button-sweet")
		if sweet.hasClass("button-sweet-on")
			temp2 = sweet.val().match( /\d+/g )
			sweet.prop('value', "Sweet (" + (parseInt(temp2)-1) + ")")
			sweet.removeClass("button-sweet-on")
			sweet.removeClass("btn-primary")
			sweet.addClass("button-sweet-off")
			sweet.addClass("btn-default")

	$(document).on 'click', '.button-sour-on', ->
		temp = $(this).val().match( /\d+/g )
		$(this).prop('value', "Sour (" + (parseInt(temp)-1) + ")")
		$(this).removeClass("button-sour-on")
		$(this).removeClass("btn-warning")
		$(this).addClass("button-sour-off")
		$(this).addClass("btn-default")

	$(document).on 'click', '.button-sweet-off', ->
		temp = $(this).val().match( /\d+/g )
		$(this).prop('value', "Sweet (" + (parseInt(temp)+1) + ")")
		$(this).removeClass("button-sweet-off")
		$(this).removeClass("btn-default")
		$(this).addClass("button-sweet-on")
		$(this).addClass("btn-primary")
		sour = $(this).parent().parent().parent().find(".button-sour")
		if sour.hasClass("button-sour-on")
			temp2 = sour.val().match( /\d+/g )
			sour.prop('value', "Sour (" + (parseInt(temp2)-1) + ")")
			sour.removeClass("button-sour-on")
			sour.removeClass("btn-warning")
			sour.addClass("button-sour-off")
			sour.addClass("btn-default")

	$(document).on 'click', '.button-sweet-on', ->
		temp = $(this).val().match( /\d+/g )
		$(this).prop('value', "Sweet (" + (parseInt(temp)-1) + ")")
		$(this).removeClass("button-sweet-on")
		$(this).removeClass("btn-primary")
		$(this).addClass("button-sweet-off")
		$(this).addClass("btn-default")