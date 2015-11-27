slug = require 'slug'
events = require './events'

events.sort((one, other) =>
    oneDate = if Array.isArray(one.date) then one.date[0] else one.date;
    otherDate = if Array.isArray(other.date) then other.date[0] else other.date;
    return oneDate < otherDate;
  );

# Define the DocPad Configuration
docpadConfig = {
  collections:
    pages: ->
      @getCollection("html").findAllLive({isPage:true}, [{ menuOrder: 1 }])

	templateData:
    # Specify some site properties
    site:
      # The production URL of our website
      url: "http://danguilherme.github.io/hackeventos/"

      # The default title of our website
      title: "HackEventos"

      # The website description (for SEO)
      description: """
        Índice de eventos de tecnologia em todo o Brasil.
        """

      # The website keywords (for SEO) separated by commas
      keywords: """
          eventos, hackathon, desenvolvimento, dev
          """

      scripts: [
        "https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDWl2q2Q07VR9ri1d7QOWtSfnKS9_fj9a8&sensor=TRUE",
        "scripts/map.js"
      ]

    # -----------------------------
    # Helper Functions

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page"s title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site"s title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
      # if our document does not have its own title, then we should just use the site"s title
      else
        @site.title

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site"s description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(", ")

    # ------------------------------
    # Events
    events: events
    slug: (str) ->
      if (!str)
        return slug(str);
      return str;
}

# Export the DocPad Configuration
module.exports = docpadConfig
