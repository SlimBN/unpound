jQuery ->
	$(window).scroll ->
		if $(window).scrollTop() > 45
			jQuery('#header').css({position:'fixed', top: '0px', left: '0px'});
			jQuery('#header .lefty').css({visibility: "visible"});
			$('#logo-header').remove();


		# if $('html').offset().top;
