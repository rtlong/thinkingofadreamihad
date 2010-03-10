/*jslint white: true, browser: true, undef: true, eqeqeq: true, plusplus: true, bitwise: true, strict: true, newcap: true, immed: true, indent: 2 */
/*global $:true, window: true */
'use strict';

//begin DEVELOPMENT
// Enable safe logging features
$.getScript('http://github.com/cowboy/javascript-debug/raw/master/ba-debug.min.js');
//end

// Creating custom :external selector
$.expr[':'].external = function (obj) {
  return !obj.href.match(/^mailto\:/) && (obj.hostname !== window.location.hostname);
};
// Note that this only works if highres images are hosted by Tumblr.
$.expr[':'].highres = function (obj) {
  return obj.href.match(/^http\:\/\/[\w.]+\/photo\/\d+\/\d+/) && (obj.hostname === window.location.hostname);
};

// Fix inserted flash objects, adding wmode=transparent to each of them
window.fixFlash = function (node) {
  var $node = $(node);
  $node.find("embed").each(function (i) {
    var elClone = this.cloneNode(true);
    elClone.setAttribute("wmode", "transparent");
    $(this).before(elClone);
    $(this).remove();
  });
  // For object and/or embed into objects
  $node.find("object").each(function (i, v) {
    var elEmbed = $(this).children("embed");
    if (typeof(elEmbed.get(0)) != "undefined") {
      if (typeof(elEmbed.get(0).outerHTML) != "undefined") {
        elEmbed.attr("wmode", "transparent");
        $(this.outerHTML).insertAfter(this);
        $(this).remove();
      }
      return true;
    }
    var algo = this.attributes;
    var str_tag = '<object ';
    for (var i = 0; i < algo.length; i+=1) { str_tag += algo[i].name + '="' + algo[i].value + '" '; }
    str_tag += '>';
    var flag = false;
    $(this).children().each(function (elem) {
      if (this.nodeName == "param") {
        if (this.name == "wmode") {
          flag = true;
          str_tag += '<param name="' + this.name + '" value="transparent">';
        }
        else str_tag += '<param name="' + this.name + '" value="' + this.value + '">';
      }
    });
    if (!flag) str_tag += '<param name="wmode" value="transparent">';
    str_tag += '</object>';
    $(str_tag).insertAfter(this);
    $(this).remove();
  });
};

window.alterContentBlock = function () {
  // Add 'external' CSS class to all external links
  $('a:external').each(function () {
    $(this).addClass('external');
  });
  
  // Look at all the new (unprocessed) posts and process them
  $('.post:not(.processed)').each(function () {
    var $this_post = $(this);
    
    // display post time on date hover
    $('.info .posted_at', this).mouseenter(function() {
      $('.time', this).show();
    });
    
    // Enable DHTML features on photos
    $('.photo', this).each(function () {
      var $this_photo = $(this);
      // Enable Colorbox
      $("a:highres", this).colorbox({
        maxWidth: '98%',
        maxHeight: '98%',
        photo: true,
        transition: 'elastic', 
        opacity: 0.8,
        close: 'click anywhere to return', 
        title: function () {
          return $(this).parent('.photo').find('img').attr('alt');
        },
        rel: 'nofollow'
      });
      // Assign the .hover-info the button class, making it appear on top of the image. Then hide it...
      $('.hover-info', this).addClass('button').hide();

      // ...except for on hover of the image has a link or highres      
      if ($this_photo.is(':has(a)')) {
        $this_photo.add('.hover-info', this).mouseenter(function () {
            // look for a child .hover-info. In the case of being called from .hover-info, nothing will happen :-)
            $('.hover-info', this).show();
          }).mouseleave(function () {
            $('.hover-info', this).hide();
          }
        );
      }
            
      // Add note informing user of a 'click-through link' on the photo, i.e. that clicking won't have 
      // the same effect as on most photos.
      $('a:external', this).each(function () {
        $(this).siblings('.hover-info').prepend('This photo links to: ' + this.hostname + '. ');
      });
      
      // On image load, set the `right` property of the .hover-info to sit at the right side of the photo
      var setPhotoPosition = function (img_elem) {
        if ($(img_elem).width() < 500){
          var newRight = (500 - $(img_elem).width()) / 2;
          $(img_elem).parents('.photo').find('.hover-info').css({right: newRight + 'px'});
        }
      };
      var img = $('img', this)[0];
      if (img.complete) {
        $(img).addClass('loaded-by-initialization');
        setPhotoPosition(img);
      } else {
        img.onload = setPhotoPosition;
      }
    });  
    // END OF PHOTO CODE
    
    // Look at all audio posts, link the artist, track name, and album name to a last.fm search for that name
    $('.audio-post .info dl dd:not(:has(a))', this).css({textDecoration: 'underline', cursor: 'pointer'}).click(function () {
      $.fn.colorbox({
        href: 'http://www.last.fm/search?q=' + encodeURIComponent($(this).text()),
        width: '75%',
        height: '75%',
        iframe: true,
        opacity: 0.5,
        close: 'close the popup'
      });
    });
    
    // Fix all flash on the page to have the wmode param set to transparent
    window.fixFlash(this);
    // END OF FLASH FIXER
    
    // Set click events for the show-player and hide-player controls
    $(".show-player", this).click(function () {
      var $this = $(this);
      $this.hide();
      $(this).siblings('.player').show();
      return false;
    });
    $(".hide-player", this).click(function () {
      var $player = $(this).parents('.player');
      $player.hide();
      $player.siblings('.show-player').show();
      return false;
    });
    
    // Hide the notes 
    $("div.notes ol.notes", this).hide();
    // Set the show-notes to show the notes
    $("div.notes .show-notes", this).click(function () { 
      $("div.notes ol.notes").slideDown(); 
      $(this).remove();
    });
    
    // Set this post as processed so we don't do it on next-page AJAX load
    $(this).addClass('processed');
  });
  
  if (window.disqus_shortname) {
    // Get comment count for all posts
    var disqus_query = [];
    $('a[href$=#disqus_thread]').each(function () {
      disqus_query.push('url' + (disqus_query.length + 1) + '=' + encodeURIComponent($(this).attr('href').split('#')[0]));
    });
    $.getScript("http://disqus.com/forums/" + window.disqus_shortname + "/get_num_replies.js?" + disqus_query.join('&'));
  }
};

$(document).ready(function () {
  debug.log('Document ready!');
  // set callbacks, etc.
  window.alterContentBlock();
  
  // shift the Tumblr controls over a bit so they don't cover the sidebar
  $('#tumblr_controls').css({
    right: '210px',
    top:   '2px'
  });
  
  // Set the entire colorbox modal to close on click, save for any buttons that may do something else
  $('#cboxWrapper, #cboxPhoto').css("cursor", "pointer").click($.fn.colorbox.close);
  
  // Set up the #return_to_top button
  $('#return_to_top').click(function () {
    $.scrollTo(0, 1000);
    return false;
  });
  $(window).scroll(function () {
    if ($(window).scrollTop() > $(window).height()) {
      $('#return_to_top').show();
    } else {
      $('#return_to_top').hide();
    }
  });
});

