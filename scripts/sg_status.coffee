# Description:
#   Email from hubot to all_support
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot status <message> - Sends email with the <subject> <message> to address <user@email.com>
#
# Author:
#   jacobmovingfwd
#
# Additional Requirements
#   unix mail client installed on the system

util = require 'util'
http = require 'http'

url_options =
  hostname: "http://mandrillapp.com"
  port: 80
  path: "/api/1.0/messages/send.json"
  method: "POST"
  #agent: "Mandrill-Curl/1.0"
  #headers: "Content-Type: application/json"

module.exports = (robot) ->
  emailTime = null
  sendEmail = (msg, from) ->
    req = http.request(options, (res) ->
      console.log "STATUS: " + res.statusCode
      console.log "HEADERS: " + JSON.stringify(res.headers)
      res.setEncoding "utf8"
      res.on "data", (chunk) ->
        console.log "BODY: " + chunk
    )
    req.on "error", (e) ->
      console.log "problem with request: " + e.message

    # write data to request body
    req.write "{\"key\":\"uSaFDOmI1B8aSSoVTCaVRQ\",\"message\":{\"html\":\"<p><b>A Status Alert has been generated:</b></p><p>#{msg}</p><p>For details, please go to the HipChat Support room.</p>\",\"text\":\"A Status Alert has been generated:\n#{msg}\nFor details, please go to the HipChat Support room.\",\"subject\":\"Support Status Alert\",\"from_email\":\"alert@sendgrid.com\",\"from_name\":\"#{from}\",\"to\":[{\"email\":\"jacob@sendgrid.com\",\"name\":\"All_Support\"}],\"headers\":{\"Reply-To\":\"alert@sink.sendgrid.net\"}}\n"
    req.end()

  robot.respond /status (.*)/i, (msg) ->
    console.log msg.message
    sendEmail msg.match[1], msg.message.user.name
    msg.send "Status emailed. (fuckyeah)"
