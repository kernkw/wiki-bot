# Description:
#   Insert Pictures of Magic: The Gathering Cards
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cast <card name> - a picture of the named magic card
#
# Author:
#   djljr

querystring = require 'querystring';


module.exports = (robot) ->
  robot.respond /cast (.+)/i, (msg) ->
    url = "http://gatherer.wizards.com/Handlers/Image.ashx"
    card = msg.match[1] || "Dismal%20Failure"
    card = card.replace(/'/g, "%27")
    query = { type: "card", name: card }
    msg.send "#{url}?#{querystring.stringify(query)}#.jpg"

  robot.respond /price (.+)/i, (msg) ->
    card_name = msg.match[1]
    msg.http("http://blacklotusproject.com/json/")
      .query
        cards : card_name
      .get() (err, res, body) ->
        result = JSON.parse(body)
        if card_name is "ben's mom"
          msg.send "ben's mom is $0.01"
        else if  card_name is "ben's trainer"
          msg.send "ben's trainer is $60.00 too much"
        else if result.cards.length isnt 0
          msg.send card_name + " (" + result.cards[0].set_code + ") average price is $" + result.cards[0].average
        else
          msg.send "Sorry I do not have a price for " + card_name