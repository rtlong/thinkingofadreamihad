// Creating custom :external selector
$.expr[':'].external = function(obj){
    return !obj.href.match(/^mailto\:/) && (obj.hostname != location.hostname);
};
// http://rtlong.tumblr.com/photo/1280/398203545/1/tumblr_ky2vyrCf9Z1qzn1mq
$.expr[':'].highres = function(obj){
    return obj.href.match(/^http\:\/\/[\w.]+\/photo\/\d+\/\d+/) && (obj.hostname == location.hostname);
};

function alterContentBlock(){
  // Add 'external' CSS class to all external links
  $('a:external').each(function(){
    $(this).addClass('external');
    $(this).attr('target', '_blank');
  });

  $(".photo-post .photo a:highres").colorbox({
    maxWidth: '98%',
    maxHeight: '98%',
    photo: true,
    transition: 'elastic', 
    opacity: 0.8,
    current: '{current} of {total}',
    previous: '<span>previous</span>',
    next: '<span>next</span>',
    close: '<span>close</span>', 
    title: function(){
      return $(this).parent('.photo').find('img').attr('alt');
    },
    onComplete: function(){
      $('#cboxWrapper, #cboxPhoto').css("cursor", "pointer").click( function(){
        $.fn.colorbox.close();
      });
    }
  });
  
  $('a.photo_zoom').each(function(){
    var img = $(this).parent('.photo').find('img')[0];
    $(this).css({'color': '#ffffff', 'background-color': '#000000', 'padding': '3px', 'position': 'absolute'});
    new_y = img.y;
    new_x = img.x + img.width - $(this).width;
    //console.log(img);
    $(this).css({'left': new_x, 'top': new_y});
  });
  
  // FireFox
  $("embed").attr("wmode", "transparent");
  // IE
  var embedTag;
  $("embed").each(function(i) {
      embedTag = $(this).attr("outerHTML");
      if ((embedTag != null) && (embedTag.length > 0)) {
          embedTag = embedTag.replace(/embed /gi, "embed wmode=\"transparent\" ");
          $(this).attr("outerHTML", embedTag);
      }
      else {
          $(this).wrap("<div></div>");
      }
  });
}

$(document).ready(function(){
  // set callbacks, etc.
  alterContentBlock();
  
  // shift the Tumblr controls over a bit so they don't cover the sidebar
  $('#tumblr_controls').css("right", '220px');
  
  // infinitescroll
  if($.fn.infinitescroll){
    $('#posts').infinitescroll({
      navSelector: '#pagination',
      nextSelector: '#next_page',
      itemSelector: '#posts .post, #posts hr',
      donetext: null,
      bufferPx: 200
    }, alterContentBlock);
  }
});

