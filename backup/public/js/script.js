(function(){

  // Github Repos
  if($('#gh_repos').length > 0){
    github.showRepos({
      user: 'kevinthompson',
      count: 5,
      skip_forks: true,
      target: '#gh_repos'
    }); 
  }
  
  // External Links in New Tab
  $('a').not('[href^="/"],[href*="kevinthompson.info"]').attr('target','_blank');
  
  // Project Behaviors
  $('.project').click(function(event){
    event.preventDefault();
    event.stopPropagation();
    
    var href      = $(this).find('a').attr('href');
    var regex     = new RegExp('/' + window.location.host + '/');
    var internal  = regex.test(href);
    
    window.open(href, internal ? '_parent' : '_blank');
  });
  
  // Adjust Heights
  var resize = function(){
    if( $(window).width() >= 768 ){
      $('.bubble').equalHeightColumns();
      $('.project').equalHeightColumns();
      $('.equal').each(function(){
        $(this).siblings('.equal').andSelf().equalHeightColumns();
      });
      $('.equal.unit:last-child').css('display','table-cell'); 
      
    }else{
      $('.equal,.bubble,.project').css({
        'height'  : 'auto',
        'display' : 'block'
      });
    }
  }
  
  // Make Code Samples Swipable on Mobile Devices
	$('.gist-data').each(function(i,el){
				
  	var swipeOptions=
  	{
  		triggerOnTouchEnd : true,	
  		swipeStatus : swipeStatus,
  		allowPageScroll:"vertical",
  		threshold:200
  	}
  	
  	var swipeStatus = function(event, phase, direction, distance)
  	{
  		//If we are moving before swipe, and we are going Lor R in X mode, or U or D in Y mode then drag.
  		if( phase=="move" && (direction=="left" || direction=="right") )
  		{
  			var duration=0;
			
  			if (direction == "left")
  				scrollImages(distance, duration);
			
  		}
		
  		else if ( phase == "cancel" || phase =="end" )
  		{
  			scrollImages(0, 500);
  		}
  	}
  	
  	var scrollImages = function(distance, duration)
  	{
  		$(el).css("-webkit-transition-duration", (duration/1000).toFixed(1) + "s");
		
  		//inverse the number we set in the css
  		var value = (distance<0 ? "" : "-") + Math.abs(distance).toString();
		
  		$(el).css("-webkit-transform", "translate3d("+value +"px,0px,0px)");
  	}
				
  	var swipeOptions=
  	{
  		triggerOnTouchEnd : true,	
  		swipeStatus : swipeStatus,
  		allowPageScroll:"vertical",
  		threshold:200
  	}
	  
	  $(el).swipe( swipeOptions );
	  
	});
  
  // Recommendation Refresh
  var refreshTimer;
  $('.refresh').click(function(event){
    event.preventDefault();
    event.stopPropagation();
    
    // Exclude Current Recommendations
    var exclude = '';
    var $recommendations = $('.recommendation');
    $recommendations.each(function(){
      exclude += (exclude != '' ? '|' : '') + $(this).attr('data-id')
    });
    
    // Cycle Rotation Button Once
    $(this).removeClass('rotating').addClass('rotating');
    clearTimeout(refreshTimer);
    refreshTimer = setTimeout(function(){
      $('.refresh').removeClass('rotating');
    },2000);
    
    var contentReady    = false;
    var containerReady  = false;
    var newRecs;
    $.ajax('/ajax/recommendations/?exclude=' + exclude,{
      'success' : function(data){
        newRecs      = data;
        if(containerReady){
          $('#recommendations').html(newRecs).animate({
            'opacity' : 1
          },800);
          resize();
        }else{
          contentReady = true;
        }
      }
    })
    
    // Animate Recommendations
    $('#recommendations').animate({
      'opacity' : 0
    },800,function(){
      if(contentReady){
        $('#recommendations').html(newRecs).animate({
          'opacity' : 1
        },800);
        resize();
      }else{
        containerReady = true; 
      }
    });
  });
  
  // Adjust Heights After Page Ready
  resize();
  
  // Window Events
  $(window).bind({ 
    'resize'  : resize, 
    'load'    : function(){
      resize();
      
      if( $(window).width() >= 768 && !$.browser.msie || ( $.browser.msie && $.browser.version > 8 ) ){
        // Sticky Elements
        $('.sticky').sticky({
          'stopper' : '.footer',
          'offset'  : 18
        });
      }
    }
  });
	
})();