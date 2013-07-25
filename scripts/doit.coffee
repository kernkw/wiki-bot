# Description:
#	Do It, Ben Stiller GIF
#
# Dependencies:
#	None
#
# Configuration:
#	None
#
# Commands:
#	listening for "do it"
#
# Author:
#	jacobmovingfwd

doit = [
	"http://24.media.tumblr.com/tumblr_mad6nxFTtd1qb3exko1_400.gif",
	"http://stream1.gifsoup.com/view/164429/ben-stiller-do-it-o.gif",
	"http://stream1.gifsoup.com/view5/2129126/ben-stiller-do-it-o.gif",
	"http://i.gifeye.com/814.gif",
	"http://static.squarespace.com/static/5100710be4b00edb4d56af0e/51007423e4b02e14d27a28bc/51007426e4b02e14d27a29cf/1296172130000/do-it.png",
	"http://24.media.tumblr.com/tumblr_mad6nxFTtd1qb3exko1_400.gif",
	"http://gifs.gifbin.com/1234525508_ben_stiller_-_do_it.gif",
	"http://www.bookcaseangel.com/images/blue-steel-calendar.gif"
]

module.exports = (robot) ->
	robot.hear /do it/i, (msg) ->
    	msg.send msg.random doit