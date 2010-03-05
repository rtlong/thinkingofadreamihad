// Creating custom :external selector
$.expr[':'].external = function(obj){
    return !obj.href.match(/^mailto\:/) && (obj.hostname != location.hostname);
};
// http://rtlong.tumblr.com/photo/1280/398203545/1/tumblr_ky2vyrCf9Z1qzn1mq
// Note that this only works if highres images are hosted by Tumblr.
$.expr[':'].highres = function(obj){
    return obj.href.match(/^http\:\/\/[\w.]+\/photo\/\d+\/\d+/) && (obj.hostname == location.hostname);
};

function fixFlash(){
  // Most Browsers
  $("embed").attr("wmode", "transparent");
  // IE
  var embedTag;
  $("embed").each(function(i) {
      embedTag = this.outerHTML;
      if ((embedTag != null) && (embedTag.length > 0)) {
          embedTag = embedTag.replace(/embed /gi, "embed wmode=\"transparent\" ");
          this.outerHTML = embedTag;
      }
      else {
          $(this).wrap("<div></div>");
      }
  });
}

function alterContentBlock(){
  // Add 'external' CSS class to all external links
  $('a:external').each(function(){
    $(this).addClass('external');
    //$(this).attr('target', '_blank');
  });

  // Enable DHTML features on photo posts that have not yet been processed
  $('.photo:not(.processed)').each(function(){
    $this = $(this);
    $this.data('hover-info', $('.hover-info'));
    // Enable Colorbox
    $("a:highres", this).colorbox({
      maxWidth: '98%',
      maxHeight: '98%',
      photo: true,
      transition: 'elastic', 
      opacity: 0.8,
      close: 'click anywhere to return', 
      title: function(){
        return $(this).parent('.photo').find('img').attr('alt');
      },
      rel: 'nofollow'
    });
    // Assign the .hover-info the button class, making it appear on top of the image. Then hide it...
    $('.hover-info',this).addClass('button').hide();
    
    // ...except for on hover of the image
    $this.add('.hover-info',this).mouseenter(function(){
        // look for a child .hover-info. In the case of being called from .hover-info, nothing will happen :-)
        $('.hover-info', this).show();
      }).mouseleave(function(){
        $('.hover-info', this).hide();
      }
    );
    
    // Add note informing user of a 'click-through link' on the photo, i.e. that clicking won't have 
    // the same effect as on most photos.
    $('a:external', this).each(function(){
      $(this).siblings('.hover-info').prepend('This photo links to: '+this.hostname+'. ');
    });
    
    // On image load, set the `right` property of the .hover-info to sit at the right side of the photo
    $('img',this).load(function(){
      var newRight = (500 - $(this).width()) / 2;
      $(this).parents('.photo').find('.hover-info').css({right: newRight });
    });
    
    // Set this photo as processed so we don't do it on next-page AJAX load
    $(this).addClass('processed');
  });  
  
  // Look at all audio posts, link the artist, track name, and album name to a last.fm search for that name
  $('.audio-post .info dl dd').css({'text-decoration': 'underline', 'cursor': 'pointer'}).click(function(){
    $.fn.colorbox({
      href: 'http://www.last.fm/search?q='+escape($(this).text()),
      width: '75%',
      height: '75%',
      iframe: true,
      opacity: 0.5,
      close: 'close the popup'
      
    });
  });
  
  // Fix all flash on the page to have the wmode param set to transparent
  fixFlash();
}

$(document).ready(function(){
  // set callbacks, etc.
  alterContentBlock();
  
  // shift the Tumblr controls over a bit so they don't cover the sidebar
  $('#tumblr_controls').css({
    right: '210px',
    top:   '2px'
  });
  
  // Set up infinite scrolling
  if($.fn.infinitescroll){
    $('#posts').infinitescroll({
      navSelector: '#pagination',
      nextSelector: '#next_page',
      itemSelector: '#posts .post, #posts hr',
      donetext: '[End of Posts]'
    }, alterContentBlock);
  }
  // Set the entire colorbox modal to close on click, save for any buttons that may do something else
  $('#cboxWrapper, #cboxPhoto').css("cursor", "pointer").click( $.fn.colorbox.close );
});

