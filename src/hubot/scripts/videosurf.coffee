# Messing around with the YouTube API.
#
# youtube me <query> - Searches YouTube for the query and returns the video
#                      embed link.
module.exports = (robot) ->
  robot.respond /(youtube|yt)( me)? (.*)/i, (msg) ->
    query = msg.match[3]
    msg.http("http://apis.videosurf.com/video_search/v1.2/?query=\")
      .query({
        client_id=hubot
		client_key=
		
        alt: 'json'
        q: query
      })
      .get() (err, res, body) ->
        videos = JSON.parse(body)
      

        video.link.forEach (link) ->
          if link.rel is "alternate" and link.type is "text/html"
            msg.send link.href