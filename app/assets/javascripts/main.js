$(document).ready(function() { 

	//load external html
	$('.content').load('pages/ideas.html');

	//Modal Show and hide
	function HideModal(){
		if ($('.overlay-new-project').hasClass('hide')){
			$('.overlay-new-project').removeClass('hide').fadeIn();
		} else {
			$('.overlay-new-project').addClass('hide');
		}
	}


	$('.top-navigation button').on('click', function(){
		HideModal();
	});

	$('.overlay-new-project').on('click', '.modal-close', function(){
		HideModal();
	});

	
	//Side Navigation Fixed
	$(window).scroll(function(){
            var scrollTop = 155;
            if($(window).scrollTop() >= scrollTop){
                $('.content-nav').css({
                    position : 'fixed',
                    top : '55px'
                });
            }
            if($(window).scrollTop() < scrollTop){
                $('.content-nav').removeAttr('style');  
            }
        })

	
	// side Navigation Menu Toggle

	$('.content-nav li').eq(0).on('click', function(){
		//load external html
		$('.content').load('pages/ideas.html');

		$('.content-nav li').removeClass('active');
		$(this).addClass('active');
	});

	$('.content-nav li').eq(1).on('click', function(){
		//load external html
		$('.content').load('pages/management.html');

		$('.content-nav li').removeClass('active');
		$(this).addClass('active');

	});

	$('.content-nav li').eq(2).on('click', function(){
		//load external html
		$('.content').load('pages/generator.html');

		$('.content-nav li').removeClass('active');
		$(this).addClass('active');
	});

	$('.content-nav li').eq(3).on('click', function(){
		//load external html
		$('.content').load('pages/invite.html');

		$('.content-nav li').removeClass('active');
		$(this).addClass('active');
	});

	$('.content-nav li').eq(4).on('click', function(){
		//load external html
		$('.content').load('pages/deposit.html');

		$('.content-nav li').removeClass('active');
		$(this).addClass('active');
	});

});