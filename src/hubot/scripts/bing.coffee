# Returns the URL of the first bing hit for a query
#
# bing me <query>   - Bings <query> & returns 1st result's URL

module.exports = (robot) ->
  robot.respond /(google)( me)? (.*)/i, (msg) ->
    bingMe msg, msg.match[3], (url) ->
      msg.send url

bingMe = (msg, query, cb) ->
  msg.http('http://www.bing.com/search')
    .query(q: query)
    .get() (err, res, body) ->
      cb body.match(/<div class="sb_tlst"><h3><a href="([^"]*)"/)?[1] || "Sorry, Google had zero results for '#{query}'"

