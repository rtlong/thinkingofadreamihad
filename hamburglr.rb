require 'rubygems'
require 'active_support/inflector'
require 'lorem_ipsum'

module Hamburglr
module Tumblr
# variables -- represent Tumblr's 'variables'
# Constants for each 'variable' accessor can be accessed directly or through a call to the _var_ method, or called as the lower case form directly, in which case it will be accessed by _method_missing_

#############################
# Basic Variables
VARIABLES = {}
META_VARS = {:image => {}, :color => {}, :text => {}, :font => {}, :if => {}}
# The HTML-safe title of your blog.
VARIABLES['Title'] = 'The Things We Do'

# The description of your blog. (may include HTML)
VARIABLES['Description'] = 'A blog. For you.'

# The HTML-safe description of your blog. (use in META tag)
VARIABLES['MetaDescription'] = 'A blog. For you.'

#  RSS feed URL for your blog.
VARIABLES['RSS'] = 'http://thingswedo.com/feed.xml'

#  Favicon URL for your blog.
VARIABLES['Favicon'] = 'http://www.favicon.cc/?action=download_copy&file_id=174929'

#  Any custom CSS code added on your "Customize Theme" screen.
VARIABLES['CustomCSS'] = '// Custom css will go here'

# Title of the post
VARIABLES['PostTitle'] = 'Post Title'

# Identical to {PostTitle}, but will automatically generate a summary if a title doesn't exist.
VARIABLES['PostSummary'] = Proc.new { SampleText::LOREM_IPSUM.randomly_pick(3).join(". ") }

# Portrait photo URL for your blog.  Square size in pixels given
VARIABLES['PortraitURL-16'] = 'bender-icon-16.png'
VARIABLES['PortraitURL-24'] = 'bender-icon-24.png'
VARIABLES['PortraitURL-30'] = 'bender-icon-30.png'
VARIABLES['PortraitURL-40'] = 'bender-icon-40.png'
VARIABLES['PortraitURL-48'] = 'bender-icon-48.png'
VARIABLES['PortraitURL-64'] = 'bender-icon-64.png'
VARIABLES['PortraitURL-96'] = 'bender-icon-96.png'
VARIABLES['PortraitURL-128'] = 'bender-icon-128.png'

#############################
# Navigation

# URL for the "previous" page (newer posts).
VARIABLES['PreviousPage'] = '#previous_page'

# URL for the "next" page (older posts).
VARIABLES['NextPage'] = '#next_page'

# Current page number.
VARIABLES['CurrentPage'] = '3'

# Total page count.
VARIABLES['TotalPages'] = '5'

# The customizable label for the Ask link. (Example: "Ask me anything")
VARIABLES['AskLabel'] = ''

#############################
# Permalink Navigation

# URL for the "previous" (newer) post.
VARIABLES['PreviousPost'] = 'newer'

# URL for the "next" (older) post.
VARIABLES['NextPost'] = 'older'

#############################
# Posts

# The permalink for a post. (Example: "http://sample.tumblr.com/post/123")
VARIABLES['Permalink'] = 'http://sample.tumblr.com/post/123'

# A shorter URL that redirects to this post. (Example: "http://tumblr.com/xpv5qtavm")
VARIABLES['ShortURL'] = 'http://tumblr.com/xpv5qtavm'

# The numeric ID for a post. (Example: 1234567)
VARIABLES['PostID'] = '1234567'

# An HTML class-attribute friendly list of the post's tags. (Example: "humor office new_york_city") 
#
# By default, an HTML friendly version of the source domain of imported posts will be included.
# (Example: "twitter_com", "digg_com", etc.) This may not behave as expected with feeds like
# Del.icio.us that send their content URLs as their permalinks. 
# 
# The class-attribute "reblog" will be included automatically if the post was reblogged from another post.
VARIABLES['TagsAsClasses'] = 'humor office new_york_city'

#############################
# Reblogs

# Parent Blog
  # The username of the blog this post was reblogged from.
  VARIABLES['ReblogParentName'] = 'Jaques Strapp'
  
  # The title of the blog this post was reblogged from.
  VARIABLES['ReblogParentTitle'] = 'Poast'
  
  # The URL for the blog this post was reblogged from.
  VARIABLES['ReblogParentURL'] = 'http://jaquesstrapp.tumblr.com/posts/123'

  # Portrait photo URL for the blog this post was reblogged from. Square size in pixels given
  VARIABLES['ReblogParentPortraitURL-16'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=16'
  VARIABLES['ReblogParentPortraitURL-24'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=24'
  VARIABLES['ReblogParentPortraitURL-30'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=30'
  VARIABLES['ReblogParentPortraitURL-40'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=40'
  VARIABLES['ReblogParentPortraitURL-48'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=48'
  VARIABLES['ReblogParentPortraitURL-64'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=64'
  VARIABLES['ReblogParentPortraitURL-96'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=96'
  VARIABLES['ReblogParentPortraitURL-128'] = 'http://www.gravatar.com/avatar/3de4be5a6edcab9d6daa1dbcaf2c541c?s=128'

# Root/Creator Blog
  # The username of the blog this post was created by.
  VARIABLES['ReblogRootName'] = 'bitmuncher'
  
  # The title of the blog this post was created by.
  VARIABLES['ReblogRootTitle'] = 'Blagy Blog'
  
  # The URL for the blog this post was created by.
  VARIABLES['ReblogRootURL'] = 'http://www.BlagyBlog.com/'

  # Portrait photo URL for the blog this post was created by. Square size in pixels given 
  VARIABLES['ReblogRootPortraitURL-16'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=16'
  VARIABLES['ReblogRootPortraitURL-24'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=24'
  VARIABLES['ReblogRootPortraitURL-30'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=30'
  VARIABLES['ReblogRootPortraitURL-40'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=40'
  VARIABLES['ReblogRootPortraitURL-48'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=48'
  VARIABLES['ReblogRootPortraitURL-64'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=64'
  VARIABLES['ReblogRootPortraitURL-96'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=96'
  VARIABLES['ReblogRootPortraitURL-128'] = 'http://www.gravatar.com/avatar/3de4be5a6edcac9d6daa1dbcaf2c541c?s=128'
  
############################
# Text Posts

# The title of this post.
# {Title}

# The content of this post.
VARIABLES['Body'] = Proc.new{ SampleText::LOREM_IPSUM.randomly_pick(4).join(". ") }

#############################
# Photo Posts

# The HTML-safe version of the caption (if one exists) of this post.
VARIABLES['PhotoAlt'] = Proc.new{ @photo_caption = SampleText::LOREM_IPSUM.randomly_pick(1).join(". ") }

# The caption for this post.
VARIABLES['Caption'] = @photo_caption || Proc.new{ @photo_caption = SampleText::LOREM_IPSUM.randomly_pick(1).join(". ") }

# A click-through URL for this photo if set.
VARIABLES['LinkURL'] = 'http://flickr.com/photos/710536154320114210'

# An HTML open anchor-tag including the click-through URL if set. (Example: <a href="http://">)
VARIABLES['LinkOpenTag'] = '<a href="http://flickr.com/photos/710536154320114210">'

# A closing anchor-tag output only if a click-through URL is set. (Example: </a>)
VARIABLES['LinkCloseTag'] = '</a>'

# URL for the photo of this post. No wider than x-pixels.
VARIABLES['PhotoURL-500'] = 'images/photos/photo1_500.jpg'
VARIABLES['PhotoURL-400'] = 'images/photos/photo1_400.jpg'
VARIABLES['PhotoURL-250'] = 'images/photos/photo1_250.jpg'
VARIABLES['PhotoURL-100'] = 'images/photos/photo1_100.jpg'

# URL for a square version the photo of this post. 75-pixels by 75-pixels.
VARIABLES['PhotoURL-75sq'] = 'images/photos/photo1_75s.jpg'

# URL for the high-res photo of this post.
VARIABLES['PhotoURL-HighRes'] = 'images/photos/photo1.jpg'

#############################
# Photoset Posts

# The caption for this post.
# {Caption}

# Embed-code for the photoset. x-pixels wide.
VARIABLES['Photoset-500'] = ''
VARIABLES['Photoset-400'] = ''
VARIABLES['Photoset-250'] = ''

#############################
# Quote Posts

# The content of this post.
VARIABLES['Quote'] = ''

# Rendered if there is a source for this post.
# {block:Source}
# The source for this post. (May contain HTML)
VARIABLES['Source'] = ''

# "short", "medium", or "long", depending on the length of the quote.
VARIABLES['Length'] = ''

#############################
# Link Posts

# The URL of this post.
VARIABLES['URL'] = 'http://linky.com/0u5snu2'

# The name of this post. Defaults to the URL if no name is entered.
VARIABLES['Name'] = "Link to Somethin' Cool"

# Should be included inside the A-tags of Link posts. Output target="_blank" if you've enabled "Open links in new window".
VARIABLES['Target'] = '_blank'

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
VARIABLES['Label'] = ''

# The username (if one was extracted) for the current line of this post.
# {Name}

# The current line of this post.
VARIABLES['Line'] = ''

# A unique identifying integer representing the user of the current line of this post.
VARIABLES['UserNumber'] = ''

# "odd" or "even" for each line of this post.
VARIABLES['Alt'] = ''

#############################
# Audio Posts

# Rendered if there is a caption for this post.
# {block:Caption}

# The caption for this post.
# {Caption}

# Default audio player.
VARIABLES['AudioPlayer'] = ''

# White audio player.
VARIABLES['AudioPlayerWhite'] = ''

# Grey audio player.
VARIABLES['AudioPlayerGrey'] = ''

# Black audio player.
VARIABLES['AudioPlayerBlack'] = ''

# The number of times this post has been played.
VARIABLES['PlayCount'] = ''

# The number of times this post has been played, formatted with commas. (e.g. 12,309)
VARIABLES['FormattedPlayCount'] = ''

# Rendered if this post uses an externally hosted MP3. (Useful for adding a "Download" link)
# {block:ExternalAudio}

#  The external MP3 URL, if this post uses an externally hosted MP3.
VARIABLES['ExternalAudioURL'] = ''

# Rendered if this audio file's ID3 info contains album art.
# {block:AlbumArt}
VARIABLES['AlbumArtURL'] = ''

# Rendered if this audio file's ID3 info contains the artist name.
# {block:Artist}
VARIABLES['Artist'] = ''

# Rendered if this audio file's ID3 info contains the album title.
# {block:Album}
VARIABLES['Album'] = ''

# Rendered if this audio file's ID3 info contains the track name.
# {block:TrackName}
VARIABLES['TrackName'] = ''

#############################
# Video Posts

# Rendered if there is a caption for this post.
# {block:Caption}

# The caption for this post.
# {Caption}

# Embed-code for the content of this post. x-pixels wide.
VARIABLES['Video-500'] = ''
VARIABLES['Video-400'] = ''
VARIABLES['Video-250'] = ''

#############################
# Answer Posts

# The question for this post. (May contain heavily filtered HTML)
VARIABLES['Question'] = ''

# The answer for this post. (May contain HTML)
VARIABLES['Answer'] = ''

# Simple HTML text link with the asker's username and URL, or the plain text string "Anonymous".
VARIABLES['Asker'] = ''

# Portrait photo URL for the asker. x-pixels square.
VARIABLES['AskerPortraitURL-16'] = ''
VARIABLES['AskerPortraitURL-24'] = ''
VARIABLES['AskerPortraitURL-30'] = ''
VARIABLES['AskerPortraitURL-40'] = ''
VARIABLES['AskerPortraitURL-48'] = ''
VARIABLES['AskerPortraitURL-64'] = ''
VARIABLES['AskerPortraitURL-96'] = ''
VARIABLES['AskerPortraitURL-128'] = ''

#############################
# Dates

# Rendered for posts that are the first to be listed for a given day.
# {block:NewDayDate}

# Rendered for subsequent posts listed for a given day.
# {block:SameDayDate}

# "1" to "31"
VARIABLES['DayOfMonth'] = Proc.new { "%01.0f" % (1..31).to_a.randomly_pick }

# "01" to "31"
VARIABLES['DayOfMonthWithZero'] = Proc.new { "%02.0f" % (1..31).to_a.randomly_pick }

# "Monday" through "Sunday"
VARIABLES['DayOfWeek'] = Proc.new { Date::DAYNAMES.randomly_pick.to_s }

# "Mon" through "Sun"
VARIABLES['ShortDayOfWeek'] = Proc.new { Date::ABBR_DAYNAMES.randomly_pick.to_s }

# "1" through "7"
VARIABLES['DayOfWeekNumber'] = Proc.new { (1..7).to_a.randomly_pick.to_s }

# "st", "nd", "rd", "th"
VARIABLES['DayOfMonthSuffix'] = ''

# "1" through "365"
VARIABLES['DayOfYear'] = Proc.new { (1..365).to_a.randomly_pick.to_s }

# "1" through "52"
VARIABLES['WeekOfYear'] = Proc.new { (1..52).to_a.randomly_pick.to_s }

# "January" through "December"
VARIABLES['Month'] = Proc.new { Date::MONTHNAMES.compact.randomly_pick.to_s }

# "Jan" through "Dec"
VARIABLES['ShortMonth'] = Proc.new { Date::ABBR_MONTHNAMES.compact.randomly_pick.to_s }

# "1" through "12"
VARIABLES['MonthNumber'] = Proc.new { (1..12).to_a.randomly_pick.to_s }

# "01" through "12"
VARIABLES['MonthNumberWithZero'] = Proc.new { "%02.0f" % (1..12).to_a.randomly_pick }

# "2007"
VARIABLES['Year'] = Proc.new { (2009..2010).to_a.randomly_pick.to_s }

# "07"
VARIABLES['ShortYear'] = Proc.new { "%02.0f" % (9..10).to_a.randomly_pick.to_s }

# "am" or "pm"
VARIABLES['AmPm'] = Proc.new { %w( am pm ).randomly_pick.to_s }

# "AM" or "PM"
VARIABLES['CapitalAmPm'] = Proc.new { %w( AM PM ).randomly_pick.to_s }

#These couple will not be accessible directly. Use the var method
# "1" through "12"
VARIABLES['12Hour'] = Proc.new { (1..12).to_a.randomly_pick.to_s }

# "0" through "23"
VARIABLES['24Hour'] = Proc.new { (0..23).to_a.randomly_pick.to_s }

# "01" through "12"
VARIABLES['12HourWithZero'] = Proc.new { "%02.0f" % (1..12).to_a.randomly_pick }

# "00" through "23"
VARIABLES['24HourWithZero'] = Proc.new { "%02.0f" % (0..23).to_a.randomly_pick }

# "00" through "59"
VARIABLES['Minutes'] = Proc.new { "%02.0f" % (0..59).to_a.randomly_pick }

# "00" through "59"
VARIABLES['Seconds'] = VARIABLES['Minutes']

# "000" through "999"
VARIABLES['Beats'] = Proc.new { "%03.0f" % (0..999).to_a.randomly_pick }

# "1172705619"
VARIABLES['Timestamp'] = Proc.new { Time.now.to_i.to_s }

# A contextual time. ("1 minute ago", "2 hours ago", "3 weeks ago", etc.)
VARIABLES['TimeAgo'] = "# minutes ago"

#############################
# Notes

# Notes include posts' reblogs, likes, and answers.

# Rendered on permalink pages this post has notes.
# {block:PostNotes}
# Standard HTML output of this post's notes. Only rendered on permalink pages.
VARIABLES['PostNotes'] = 'These are the notes about this post'

# Rendered if this post has notes.
# {block:NoteCount}
# The number of this post's notes.
VARIABLES['NoteCount'] = '5'

# The number of this post's notes with pluralized label. (e.g. "24 notes")
VARIABLES['NoteCountWithLabel'] = '5 notes'

#############################
# Tags

# Rendered inside {block:Posts} if post has tags.
# {block:HasTags}
# Rendered for each of a post's tags.
# {block:Tags}

# The name of this tag.
VARIABLES['Tag'] = ''
# A URL safe version of this tag.
VARIABLES['URLSafeTag'] = ''
# The tag page URL with other posts that share this tag.
VARIABLES['TagURL'] = ''
# The tag page URL with other posts that share this tag in chronological order.
VARIABLES['TagURLChrono'] = ''

#############################
# Group Blogs

# Rendered on additional public group blogs.
# {block:GroupMembers}
# Rendered for each additional public group blog member.
# {block:GroupMember}

# The username of the member's blog.
VARIABLES['GroupMemberName'] = ''

# The title of the member's blog.
VARIABLES['GroupMemberTitle'] = ''

# The URL for the member's blog.
VARIABLES['GroupMemberURL'] = ''

# Portrait photo URL for the member. x-pixels square.
VARIABLES['GroupMemberPortraitURL-16'] = ''
VARIABLES['GroupMemberPortraitURL-24'] = ''
VARIABLES['GroupMemberPortraitURL-30'] = ''
VARIABLES['GroupMemberPortraitURL-40'] = ''
VARIABLES['GroupMemberPortraitURL-48'] = ''
VARIABLES['GroupMemberPortraitURL-64'] = ''
VARIABLES['GroupMemberPortraitURL-96'] = ''
VARIABLES['GroupMemberPortraitURL-128'] = ''

#############################
# Group Blog Posts

# The username of the author of a post to an additional group blog.
VARIABLES['PostAuthorName'] = ''

# The title of the author's blog for a post to an additional group blog.
VARIABLES['PostAuthorTitle'] = ''

# The blog URL for the author of a post to an additional group blog.
VARIABLES['PostAuthorURL'] = ''

#  The portrait photo URL for the author of a post to an additional group blog. x-pixels square
VARIABLES['PostAuthorPortraitURL-16'] = ''
VARIABLES['PostAuthorPortraitURL-24'] = ''
VARIABLES['PostAuthorPortraitURL-30'] = ''
VARIABLES['PostAuthorPortraitURL-40'] = ''
VARIABLES['PostAuthorPortraitURL-48'] = ''
VARIABLES['PostAuthorPortraitURL-64'] = ''
VARIABLES['PostAuthorPortraitURL-96'] = ''
VARIABLES['PostAuthorPortraitURL-128'] = ''

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
VARIABLES['PreviousDayPage'] = ''

# URL for the "next" day page.
VARIABLES['NextDayPage'] = ''

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
VARIABLES['SearchQuery'] = 'jillian'

# A URL-safe version of the current search query for use in links and Javascript.
VARIABLES['URLSafeSearchQuery'] = 'jillian'

# Rendered on search pages.
# {block:SearchPage}

# The number of results returned for the current search query.
VARIABLES['SearchResultCount'] = '32'

# Rendered if no search results were returned for the current search query.
# {block:NoSearchResults}

#############################
# Following

# Rendered if you're following other blogs.
# {block:Following}

# Rendered for each blog you're following.
# {block:Followed}

# The username of the blog you're following.
VARIABLES['FollowedName'] = ''

# The title of the blog you're following.
VARIABLES['FollowedTitle'] = ''

# The URL for the blog you're following.
VARIABLES['FollowedURL'] = ''

# Portrait photo URL for the blog you're following. x-pixels square.
VARIABLES['FollowedPortraitURL-16'] = ''
VARIABLES['FollowedPortraitURL-24'] = ''
VARIABLES['FollowedPortraitURL-30'] = ''
VARIABLES['FollowedPortraitURL-40'] = ''
VARIABLES['FollowedPortraitURL-48'] = ''
VARIABLES['FollowedPortraitURL-64'] = ''
VARIABLES['FollowedPortraitURL-96'] = ''
VARIABLES['FollowedPortraitURL-128'] = ''

#############################
# Likes

# Rendered if you are sharing your likes.
# {block:Likes}

#This one, accessed directly, gets you just "{Likes}", but via the method, will accept parameters
# Standard HTML output of your likes.
VARIABLES['Likes'] = ''

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
#     - meta_var :color, 'Background', '#eee'
#     - meta_var :color, 'Content Background', '#fff'
#     - meta_var :color, 'Text', '#000'
#     %style{ :type => "text/css" }
#       sass:
#         #content
#           :background-color = "#{color 'Content Background'}"
#           :color = "#{color :Text}"
#           
#   %body{ :bgcolor => "{color:Background}" }
#     #content ...

def color(name)
  if SAMPLE_DATA
    META_VARS[:color][name.to_s]
  else
    "{color:#{name.to_s}}"
  end
end

#############################
# Enabling Custom Fonts

# By including the special meta-font tags in your theme, users can easily change those fonts using the
# "Customize" screen.
# 
# EXAMPLE
# - meta_var :font, 'Title', 'Helvetica Neue'
# - meta_var :font, 'Body', 'Arial, Helvetica, sans-serif'
# 
# %style{ :type => "text/css" }
#   sass:
#     h1
#       :font = "30px #{font :Title}"
#     #content
#       :font = "12px #{font :Body}"

def font(name)
  if SAMPLE_DATA
    META_VARS[:font][name.to_s]
  else
    "{font:#{name.to_s}}"
  end
end

#############################
# Enabling Booleans

# By including the special meta-if tags in your theme, users can easily toggle options you define.
# This is useful for showing or hiding different widgets or design elements.
# 
# EXAMPLE
# %html
#   %head
#     / DEFAULTS
#     - meta_var :if, "Show people I follow", 1
#     - meta_var :if, "Reverse pagination", 0
#   %body
#     - block :IfNotReversePagination do
#       %a{:href=>"..."} Previous
#       %a{:href=>"..."} Next
#         
#     - block :IfReversePagination do
#       %a{:href=>"..."} Next
#       %a{:href=>"..."} Previous
#         
#     - block :IfShowPeopleIFollow do
#       #following 
#         ...

#############################
# Enabling Custom Text

# By including the special meta-text tags in your theme, users can easily configure text variables you
# define. This is useful for adjusting text or configuring widgets that require information from the
# user.
# 
# EXAMPLE
# %script{ :type=> "text/javascript" :src => "http://flickr.com/widget?user=#{text 'Flickr Username'}"

def text(name)
  if SAMPLE_DATA
    META_VARS[:text][name.to_s]
  else
    "{text:#{name.to_s}}"
  end
end

#############################
# Enabling Custom Images

# By including the special meta-image tags in your theme, users can easily use custom images without
# editing your theme. Image variables (eg. image :Logo}) will return a 1-pixel transparent square if
# no image is set.

def image(name)
  if SAMPLE_DATA
    META_VARS[:image][name.to_s]
  else
    "{image:#{name.to_s}}"
  end
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
VARIABLES['TwitterUsername'] = 'rtlong'

#############################
# Freeze the VARIABLES hash so it won't be modified by anyone else
VARIABLES.freeze
# TODO Set constants for all the VARIABLES
VARIABLES.keys.each do |var_name|
  instance_eval do
    define_method var_name.underscore.to_sym do |*params|
      var(var_name, *params)
    end
  end
  # Note that the constants always point to the {VariableName} string. To make use of sample data,
  # stick to using the methods
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
  META_VARS[type.to_sym][name] = value
  haml_tag :meta, :/, :name => [type,name].join(':'), :content => value
end

# Constructs a new {BlahBlah foo="bar"} string with the name and any parameters passed to it. Does
# no checking for the existance of such a variable. It just returns the string formatted properly.
def var(name, params={})
  raise ArgumentError, "var requires a name and, optionally, a hash of parameters", caller unless params.is_a? Hash
  
  name = get_tumblr_variable(name)
  if SAMPLE_DATA
    if VARIABLES[name].is_a? Proc
      return VARIABLES[name].call
    else
      return VARIABLES[name].to_s
    end
  else
    return '{' + [name, params.to_a.collect{|param| [param.first.to_s, %Q'"#{param.last.to_s}"'].join('=')}].flatten.join(' ') + '}'
  end
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
  open_tag = "{block:#{name}}"
  close_tag = "{/block:#{name}}"
  if SAMPLE_DATA
    open_tag = "<!-- #{open_tag} -->"
    close_tag = "<!-- #{close_tag} -->"
  end
  
  if block_given?
    haml_concat open_tag
    tab_up
    block.call
    tab_down
    haml_concat close_tag
  else
    raise Error.now("The block method isn't very useful without a block...")
  end
end

end
end
