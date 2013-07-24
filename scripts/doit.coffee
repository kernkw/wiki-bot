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
	"http://stream1.gifsoup.com/view5/2129126/ben-stiller-do-it-o.gif"
]

module.exports = (robot) ->
	robot.hear /do it/i, (msg) ->
    	msg.send msg.random doit