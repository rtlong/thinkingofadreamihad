require 'rubygems'
require 'active_support/inflector'

module Hamburglr
module Tumblr
# variables -- represent Tumblr's 'variables'
# Constants for each 'variable' accessor can be accessed directly or through a call to the _var_ method, or called as the lower case form directly, in which case it will be accessed by _method_missing_

#############################
# Basic Variables
VARIABLES = []
# The HTML-safe title of your blog.
VARIABLES.push 'Title'

# The description of your blog. (may include HTML)
VARIABLES.push 'Description'

# The HTML-safe description of your blog. (use in META tag)
VARIABLES.push 'MetaDescription'

#  RSS feed URL for your blog.
VARIABLES.push 'RSS'

#  Favicon URL for your blog.
VARIABLES.push 'Favicon'

#  Any custom CSS code added on your "Customize Theme" screen.
VARIABLES.push 'CustomCSS'

# Title of the post
VARIABLES.push 'PostTitle'

# Identical to {PostTitle}, but will automatically generate a summary if a title doesn't exist.
VARIABLES.push 'PostSummary'

# Portrait photo URL for your blog.  Square size in pixels given
VARIABLES.push 'PortraitURL-16'
VARIABLES.push 'PortraitURL-24'
VARIABLES.push 'PortraitURL-30'
VARIABLES.push 'PortraitURL-40'
VARIABLES.push 'PortraitURL-48'
VARIABLES.push 'PortraitURL-64'
VARIABLES.push 'PortraitURL-96'
VARIABLES.push 'PortraitURL-128'

#############################
# Navigation

# URL for the "previous" page (newer posts).
VARIABLES.push 'PreviousPage'

# URL for the "next" page (older posts).
VARIABLES.push 'NextPage'

# Current page number.
VARIABLES.push 'CurrentPage'

# Total page count.
VARIABLES.push 'TotalPages'

# The customizable label for the Ask link. (Example: "Ask me anything")
VARIABLES.push 'AskLabel'

#############################
# Permalink Navigation

# URL for the "previous" (newer) post.
VARIABLES.push 'PreviousPost'

# URL for the "next" (older) post.
VARIABLES.push 'NextPost'

#############################
# Posts

# The permalink for a post. (Example: "http://sample.tumblr.com/post/123")
VARIABLES.push 'Permalink'

# A shorter URL that redirects to this post. (Example: "http://tumblr.com/xpv5qtavm")
VARIABLES.push 'ShortURL'

# The numeric ID for a post. (Example: 1234567)
VARIABLES.push 'PostID'

# An HTML class-attribute friendly list of the post's tags. (Example: "humor office new_york_city") 
#
# By default, an HTML friendly version of the source domain of imported posts will be included.
# (Example: "twitter_com", "digg_com", etc.) This may not behave as expected with feeds like
# Del.icio.us that send their content URLs as their permalinks. 
# 
# The class-attribute "reblog" will be included automatically if the post was reblogged from another post.
VARIABLES.push 'TagsAsClasses'

#############################
# Reblogs

# Parent Blog
  # The username of the blog this post was reblogged from.
  VARIABLES.push 'ReblogParentName'
  
  # The title of the blog this post was reblogged from.
  VARIABLES.push 'ReblogParentTitle'
  
  # The URL for the blog this post was reblogged from.
  VARIABLES.push 'ReblogParentURL'

  # Portrait photo URL for the blog this post was reblogged from. Square size in pixels given
  VARIABLES.push 'ReblogParentPortraitURL-16'
  VARIABLES.push 'ReblogParentPortraitURL-24'
  VARIABLES.push 'ReblogParentPortraitURL-30'
  VARIABLES.push 'ReblogParentPortraitURL-40'
  VARIABLES.push 'ReblogParentPortraitURL-48'
  VARIABLES.push 'ReblogParentPortraitURL-64'
  VARIABLES.push 'ReblogParentPortraitURL-96'
  VARIABLES.push 'ReblogParentPortraitURL-128'

# Root/Creator Blog
  # The username of the blog this post was created by.
  VARIABLES.push 'ReblogRootName'
  
  # The title of the blog this post was created by.
  VARIABLES.push 'ReblogRootTitle'
  
  # The URL for the blog this post was created by.
  VARIABLES.push 'ReblogRootURL'

  # Portrait photo URL for the blog this post was created by. Square size in pixels given 
  VARIABLES.push 'ReblogRootPortraitURL-16'
  VARIABLES.push 'ReblogRootPortraitURL-24'
  VARIABLES.push 'ReblogRootPortraitURL-30'
  VARIABLES.push 'ReblogRootPortraitURL-40'
  VARIABLES.push 'ReblogRootPortraitURL-48'
  VARIABLES.push 'ReblogRootPortraitURL-64'
  VARIABLES.push 'ReblogRootPortraitURL-96'
  VARIABLES.push 'ReblogRootPortraitURL-128'

############################
# Text Posts

# The title of this post.
# {Title}

# The content of this post.
VARIABLES.push 'Body'

#############################
# Photo Posts

# The HTML-safe version of the caption (if one exists) of this post.
VARIABLES.push 'PhotoAlt'

# The caption for this post.
VARIABLES.push 'Caption'

# A click-through URL for this photo if set.
VARIABLES.push 'LinkURL'

# An HTML open anchor-tag including the click-through URL if set. (Example: <a href="http://">)
VARIABLES.push 'LinkOpenTag'

# A closing anchor-tag output only if a click-through URL is set. (Example: </a>)
VARIABLES.push 'LinkCloseTag'

# URL for the photo of this post. No wider than x-pixels.
VARIABLES.push 'PhotoURL-500'
VARIABLES.push 'PhotoURL-400'
VARIABLES.push 'PhotoURL-250'
VARIABLES.push 'PhotoURL-100'

# URL for a square version the photo of this post. 75-pixels by 75-pixels.
VARIABLES.push 'PhotoURL-75sq'

# URL for the high-res photo of this post.
VARIABLES.push 'PhotoURL-HighRes'

#############################
# Photoset Posts

# The caption for this post.
# {Caption}

# Embed-code for the photoset. x-pixels wide.
VARIABLES.push 'Photoset-500'
VARIABLES.push 'Photoset-400'
VARIABLES.push 'Photoset-250'

#############################
# Quote Posts

# The content of this post.
VARIABLES.push 'Quote'

# Rendered if there is a source for this post.
# {block:Source}
# The source for this post. (May contain HTML)
VARIABLES.push 'Source'

# "short", "medium", or "long", depending on the length of the quote.
VARIABLES.push 'Length'

#############################
# Link Posts

# The URL of this post.
VARIABLES.push 'URL'

# The name of this post. Defaults to the URL if no name is entered.
VARIABLES.push 'Name'

# Should be included inside the A-tags of Link posts. Output target="_blank" if you've enabled "Open links in new window".
VARIABLES.push 'Target'

# Rendered if there is a description for this post.
# {block:Description}
# The description for this post.
# {Description}

#############################
# Chat Posts

# Rendered if there is a title for this post.
# {block:Title}

# The title of this post.
# {Title}

# Rendered for each line of this post.
# {block:Lines}

# Rendered if a label was extracted for the current line of this post.
# {block:Label}

# The label (if one was extracted) for the current line of this post.
VARIABLES.push 'Label'

# The username (if one was extracted) for the current line of this post.
# {Name}

# The current line of this post.
VARIABLES.push 'Line'

# A unique identifying integer representing the user of the current line of this post.
VARIABLES.push 'UserNumber'

# "odd" or "even" for each line of this post.
VARIABLES.push 'Alt'

#############################
# Audio Posts

# Rendered if there is a caption for this post.
# {block:Caption}

# The caption for this post.
# {Caption}

# Default audio player.
VARIABLES.push 'AudioPlayer'

# White audio player.
VARIABLES.push 'AudioPlayerWhite'

# Grey audio player.
VARIABLES.push 'AudioPlayerGrey'

# Black audio player.
VARIABLES.push 'AudioPlayerBlack'

# The number of times this post has been played.
VARIABLES.push 'PlayCount'

# The number of times this post has been played, formatted with commas. (e.g. 12,309)
VARIABLES.push 'FormattedPlayCount'

# Rendered if this post uses an externally hosted MP3. (Useful for adding a "Download" link)
# {block:ExternalAudio}

#  The external MP3 URL, if this post uses an externally hosted MP3.
VARIABLES.push 'ExternalAudioURL'

# Rendered if this audio file's ID3 info contains album art.
# {block:AlbumArt}
VARIABLES.push 'AlbumArtURL'

# Rendered if this audio file's ID3 info contains the artist name.
# {block:Artist}
VARIABLES.push 'Artist'

# Rendered if this audio file's ID3 info contains the album title.
# {block:Album}
VARIABLES.push 'Album'

# Rendered if this audio file's ID3 info contains the track name.
# {block:TrackName}
VARIABLES.push 'TrackName'

#############################
# Video Posts

# Rendered if there is a caption for this post.
# {block:Caption}

# The caption for this post.
# {Caption}

# Embed-code for the content of this post. x-pixels wide.
VARIABLES.push 'Video-500'
VARIABLES.push 'Video-400'
VARIABLES.push 'Video-250'

#############################
# Answer Posts

# The question for this post. (May contain heavily filtered HTML)
VARIABLES.push 'Question'

# The answer for this post. (May contain HTML)
VARIABLES.push 'Answer'

# Simple HTML text link with the asker's username and URL, or the plain text string "Anonymous".
VARIABLES.push 'Asker'

# Portrait photo URL for the asker. x-pixels square.
VARIABLES.push 'AskerPortraitURL-16'
VARIABLES.push 'AskerPortraitURL-24'
VARIABLES.push 'AskerPortraitURL-30'
VARIABLES.push 'AskerPortraitURL-40'
VARIABLES.push 'AskerPortraitURL-48'
VARIABLES.push 'AskerPortraitURL-64'
VARIABLES.push 'AskerPortraitURL-96'
VARIABLES.push 'AskerPortraitURL-128'

#############################
# Dates

# Rendered for posts that are the first to be listed for a given day.
# {block:NewDayDate}

# Rendered for subsequent posts listed for a given day.
# {block:SameDayDate}

# "1" to "31"
VARIABLES.push 'DayOfMonth'

# "01" to "31"
VARIABLES.push 'DayOfMonthWithZero'

# "Monday" through "Sunday"
VARIABLES.push 'DayOfWeek'

# "Mon" through "Sun"
VARIABLES.push 'ShortDayOfWeek'

# "1" through "7"
VARIABLES.push 'DayOfWeekNumber'

# "st", "nd", "rd", "th"
VARIABLES.push 'DayOfMonthSuffix'

# "1" through "365"
VARIABLES.push 'DayOfYear'

# "1" through "52"
VARIABLES.push 'WeekOfYear'

# "January" through "December"
VARIABLES.push 'Month'

# "Jan" through "Dec"
VARIABLES.push 'ShortMonth'

# "1" through "12"
VARIABLES.push 'MonthNumber'

# "01" through "12"
VARIABLES.push 'MonthNumberWithZero'

# "2007"
VARIABLES.push 'Year'

# "07"
VARIABLES.push 'ShortYear'

# "am" or "pm"
VARIABLES.push 'AmPm'

# "AM" or "PM"
VARIABLES.push 'CapitalAmPm'

#These couple will not be accessible directly. Use the var method
# "1" through "12"
VARIABLES.push '12Hour'

# "0" through "23"
VARIABLES.push '24Hour'

# "01" through "12"
VARIABLES.push '12HourWithZero'

# "00" through "23"
VARIABLES.push '24HourWithZero'

# "00" through "59"
VARIABLES.push 'Minutes'

# "00" through "59"
VARIABLES.push 'Seconds'

# "000" through "999"
VARIABLES.push 'Beats'

# "1172705619"
VARIABLES.push 'Timestamp'

# A contextual time. ("1 minute ago", "2 hours ago", "3 weeks ago", etc.)
VARIABLES.push 'TimeAgo'

#############################
# Notes

# Notes include posts' reblogs, likes, and answers.

# Rendered on permalink pages this post has notes.
# {block:PostNotes}
# Standard HTML output of this post's notes. Only rendered on permalink pages.
VARIABLES.push 'PostNotes'

# Rendered if this post has notes.
# {block:NoteCount}
# The number of this post's notes.
VARIABLES.push 'NoteCount'

# The number of this post's notes with pluralized label. (e.g. "24 notes")
VARIABLES.push 'NoteCountWithLabel'

#############################
# Tags

# Rendered inside {block:Posts} if post has tags.
# {block:HasTags}
# Rendered for each of a post's tags.
# {block:Tags}

# The name of this tag.
VARIABLES.push 'Tag'
# A URL safe version of this tag.
VARIABLES.push 'URLSafeTag'
# The tag page URL with other posts that share this tag.
VARIABLES.push 'TagURL'
# The tag page URL with other posts that share this tag in chronological order.
VARIABLES.push 'TagURLChrono'

#############################
# Group Blogs

# Rendered on additional public group blogs.
# {block:GroupMembers}
# Rendered for each additional public group blog member.
# {block:GroupMember}

# The username of the member's blog.
VARIABLES.push 'GroupMemberName'

# The title of the member's blog.
VARIABLES.push 'GroupMemberTitle'

# The URL for the member's blog.
VARIABLES.push 'GroupMemberURL'

# Portrait photo URL for the member. x-pixels square.
VARIABLES.push 'GroupMemberPortraitURL-16'
VARIABLES.push 'GroupMemberPortraitURL-24'
VARIABLES.push 'GroupMemberPortraitURL-30'
VARIABLES.push 'GroupMemberPortraitURL-40'
VARIABLES.push 'GroupMemberPortraitURL-48'
VARIABLES.push 'GroupMemberPortraitURL-64'
VARIABLES.push 'GroupMemberPortraitURL-96'
VARIABLES.push 'GroupMemberPortraitURL-128'

#############################
# Group Blog Posts

# The username of the author of a post to an additional group blog.
VARIABLES.push 'PostAuthorName'

# The title of the author's blog for a post to an additional group blog.
VARIABLES.push 'PostAuthorTitle'

# The blog URL for the author of a post to an additional group blog.
VARIABLES.push 'PostAuthorURL'

#  The portrait photo URL for the author of a post to an additional group blog. x-pixels square
VARIABLES.push 'PostAuthorPortraitURL-16'
VARIABLES.push 'PostAuthorPortraitURL-24'
VARIABLES.push 'PostAuthorPortraitURL-30'
VARIABLES.push 'PostAuthorPortraitURL-40'
VARIABLES.push 'PostAuthorPortraitURL-48'
VARIABLES.push 'PostAuthorPortraitURL-64'
VARIABLES.push 'PostAuthorPortraitURL-96'
VARIABLES.push 'PostAuthorPortraitURL-128'

#############################
# Day Pages

# Tumblr blogs can display posts from a given day using a URL like
# http://david.tumblr.com/day/2007/04/29/ By including the following markup, these pages can include
# pagination for the previous and next days with posts.
# 
# Rendered on day pages.
# {block:DayPage}

# Rendered if there is a "previous" or "next" day page.
# {block:DayPagination}

# Rendered if there is a "previous" day page to navigate to.
# {block:PreviousDayPage}

# Rendered if there is a "next" day page to navigate to.
# {block:NextDayPage}

# URL for the "previous" day page.
VARIABLES.push 'PreviousDayPage'

# URL for the "next" day page.
VARIABLES.push 'NextDayPage'

#############################
# Tag Pages

# Rendered on tag pages.
# {block:TagPage}

# The name of this tag.
# {Tag}

# A URL safe version of this tag.
# {URLSafeTag}

# The tag page URL with other posts that share this tag.
# {TagURL}

# The tag page URL with other posts that share this tag in chronological order.
# {TagURLChrono}

#############################
# Search

# The current search query.
VARIABLES.push 'SearchQuery'

# A URL-safe version of the current search query for use in links and Javascript.
VARIABLES.push 'URLSafeSearchQuery'

# Rendered on search pages.
# {block:SearchPage}

# The number of results returned for the current search query.
VARIABLES.push 'SearchResultCount'

# Rendered if no search results were returned for the current search query.
# {block:NoSearchResults}

#############################
# Following

# Rendered if you're following other blogs.
# {block:Following}

# Rendered for each blog you're following.
# {block:Followed}

# The username of the blog you're following.
VARIABLES.push 'FollowedName'

# The title of the blog you're following.
VARIABLES.push 'FollowedTitle'

# The URL for the blog you're following.
VARIABLES.push 'FollowedURL'

# Portrait photo URL for the blog you're following. x-pixels square.
VARIABLES.push 'FollowedPortraitURL-16'
VARIABLES.push 'FollowedPortraitURL-24'
VARIABLES.push 'FollowedPortraitURL-30'
VARIABLES.push 'FollowedPortraitURL-40'
VARIABLES.push 'FollowedPortraitURL-48'
VARIABLES.push 'FollowedPortraitURL-64'
VARIABLES.push 'FollowedPortraitURL-96'
VARIABLES.push 'FollowedPortraitURL-128'

#############################
# Likes

# Rendered if you are sharing your likes.
# {block:Likes}

#This one, accessed directly, gets you just "{Likes}", but via the method, will accept parameters
# Standard HTML output of your likes.
VARIABLES.push 'Likes'

# Standard HTML output of your last 5 likes. Maximum: 10
# {Likes limit="5"}

# Standard HTML output of your likes with Audio and Video players scaled to
# 200-pixels wide. (Scale images with CSS max-width or similar.)
# {Likes width="200"}

# Standard HTML output of your likes with text summarize to 100-characters. Maximum: 250
# {Likes summarize="100"}

#############################
# Enabling Custom Colors

# By including the special meta-color tags in your theme, users can easily tweak those colors using
# the "Customize" screen.
# 
# EXAMPLE
# %html
#   %head
#     / DEFAULT COLORS
#     %meta{ :name => "color:Background", :content => "#eee" }
#     %meta{ :name => "color:Content Background", :content => "#fff" }
#     %meta{ :name => "color:Text", :content => "#000" }
#     %style{ :type => "text/css" }
#       sass:
#         #content
#           :background-color = "#{color 'Content Background'}"
#           :color = "#{color :Text}"
#           
#   %body{ :bgcolor => "{color:Background}" }
#     #content ...

def color(name)
  "{color:#{name.to_s}}"
end

#############################
# Enabling Custom Fonts

# By including the special meta-font tags in your theme, users can easily change those fonts using the
# "Customize" screen.
# 
# EXAMPLE
# %meta{ :name => "font:Title", :content =>"Helvetica Neue" }/
# %meta{ :name => "font:Body", :content => "Arial, Helvetica, sans-serif" }/
# 
# %style{ :type => "text/css" }
#   sass:
#     h1
#       :font = "30px #{font :Title}"
#     #content
#       :font = "12px #{font :Body}"

def font(name)
  "{font:#{name.to_s}}"
end

#############################
# Enabling Booleans

# By including the special meta-if tags in your theme, users can easily toggle options you define.
# This is useful for showing or hiding different widgets or design elements.
# 
# EXAMPLE
# <html>
#     <head>
#         <!-- DEFAULTS -->
#         <meta name="if:Show people I follow" content="1"/>
#         <meta name="if:Reverse pagination" content="0"/>
#     </head>
#     <body>
#         {block:IfNotReversePagination}
#             <a href="...">Previous</a> <a href="...">Next</a>
#        
#         
#         {block:IfReversePagination}
#             <a href="...">Next</a> <a href="...">Previous</a>
#        
#         
#         {block:IfShowPeopleIFollow}
#             <div id="following">...</div>
#        
#     </body>
# </html>

#############################
# Enabling Custom Text

# By including the special meta-text tags in your theme, users can easily configure text variables you
# define. This is useful for adjusting text or configuring widgets that require information from the
# user.
# 
# EXAMPLE
# %script{ :type=> "text/javascript" :src => "http://flickr.com/widget?user=#{text 'Flickr Username'}"

def text(name)
  "{text:#{name.to_s}}"
end

#############################
# Enabling Custom Images

# By including the special meta-image tags in your theme, users can easily use custom images without
# editing your theme. Image variables (eg. image :Logo}) will return a 1-pixel transparent square if
# no image is set.

def image(name)
  "{image:#{name.to_s}}"
end

#############################
# Enabling Custom CSS

# By including the {CustomCSS} tag at the bottom of your theme's CSS style block, users you share your
# theme with will be able to tweak the appearance of your theme without editing its markup.

# {CustomCSS}

#############################
# Twitter

# If you've enabled Twitter integration in your Tumblr preferences, you can include the /tweets.js
# Javascript file on your primary blog to display your recent tweets. This file runs the callback
# function recent_tweets(), sending the Twitter API JSON data as its only parameter.

# Your Twitter username.
VARIABLES.push 'TwitterUsername'

#############################
# Freeze the VARIABLES array so it won't be modified by anyone else
VARIABLES.freeze
# TODO Set constants for all the VARIABLES
VARIABLES.each do |var_name|
  instance_eval do
    define_method var_name.underscore.to_sym do |*params|
      var(var_name, *params)
    end
  end
  const_set var_name.gsub(/-/, '_'), "{#{var_name}}" unless var_name =~ (/^\d/)
end
#############################
# Methods

def get_tumblr_variable(name)
  match = /^([-_\w]+?)[-_]?(\d+)?$/.match(name.to_s)
  return [ match[1].camelize.gsub(/(url|id|css)/i){|s| s.upcase}, match[2] ].compact.join('-')
end

# Adds a meta tag with the named variable
def meta_var(type, name, value)
  type = type.to_s.downcase
  name = name.to_s.camelize
  haml_tag :meta, :/, :name => [type,name].join(':'), :content => value
end

# Constructs a new {BlahBlah foo="bar"} string with the name and any parameters passed to it. Does
# no checking for the existance of such a variable. It just returns the string formatted properly.
def var(name, params={})
  raise ArgumentError, "var requires a name and, optionally, a hash of parameters", caller unless params.is_a? Hash
  
  name = get_tumblr_variable(name)
  return '{' + [name, params.to_a.collect{|param| [param.first.to_s, %Q|"#{param.last.to_s}"|].join('=')}].flatten.join(' ') + '}'
end

# Grabs a call to any nonexistant method, camelizes the method name, and checks to see if it's been 
# defined in VARIABLES. If it has, it forwards the call to _var_
#alias_method :old_method_missing, :method_missing
#def method_missing(method_id, *args, &block)
#  #var_name = get_tumblr_variable(method_id)
#  #if VARIABLES.include? var_name
#  #  return var(method_id, *args)
#  #else
#    old_method_missing(method_id, *args, &block)
#  #end
#end

def b(name, &block)
  #ret = ErrorReturn.new("b")
  
  name = name.id2name.camelize
  #TODO
  if block_given?
    haml_concat "{block:#{name}}"
    tab_up
    block.call
    tab_down
    haml_concat "{/block:#{name}}"
  else
    raise Error.now("The block method isn't very useful without a block...")
  end
end

end
end
