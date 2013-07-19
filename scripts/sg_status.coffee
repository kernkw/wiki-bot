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
#   earlonrails
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
  agent: "Mandrill-Curl/1.0"


module.exports = (robot) ->
  emailTime = null
  sendEmail = (msg, from) ->
    req = http.request(url_options, (res) ->
      console.log res.body('status')
      res.setEncoding "utf8"
      res.on "data", (chunk) ->
        console.log chunk
    )
    req.on "error", (e) ->
      answer = e.message

    # write data to request body
    req.write "{\"key\":\"uSaFDOmI1B8aSSoVTCaVRQ\",\"message\":{\"html\":\"<p><b>A Status Alert has been generated:</b></p><p>#{msg}</p><p>For details, please go to the HipChat Support room.</p>\",\"text\":\"A Status Alert has been generated: #{msg} \n For details, please go to the HipChat SUpport room.\",\"subject\":\"Support Status Alert\",\"from_email\":\"alert@sendgrid.com\",\"from_name\":\"#{from}\",\"to\":[{\"email\":\"jacob@sendgrid.com\",\"name\":\"All_Support\"}],\"headers\":{\"Reply-To\":\"alert@sink.sendgrid.net\"},\"track_opens\":true,\"track_clicks\":true,\"auto_text\":null,\"auto_html\":null}\n"
    req.end()

  robot.respond /status (.*)/i, (msg) ->
    sendEmail msg.match[1], msg.message.user.name
    msg.reply "Status emailed: #{answer} (fuckyeah)"
