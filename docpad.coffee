slug = require 'slug'

# Define the DocPad Configuration
docpadConfig = {
  collections:
    pages: ->
      @getCollection("html").findAllLive({isPage:true}, [{ menuOrder: 1 }])

	templateData:
    # Specify some site properties
    site:
      # The production URL of our website
      url: "http:#danguilherme.github.io/hackeventos/"

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
    events: [
      {
        type: "meetup"
        name: "5º Meetup CSS"
        url: "http://www.meetup.com/CSS-SP/events/220119108/"
        thumbnail: "/services/events/media/2015/meetupcss-sp.jpg"
        price: "R$ 0"

        organizer:
          name: "Luiz Felipe Tartarotti Fialho"
          url: ""

        date: "2015-02-05",
        address:
          city: "São Paulo"
          state: "São Paulo"
      }

      {
        type: "event"
        name: "RuPy Campinas"
        url: "http://campinas.rupy.com.br/"
        thumbnail: "/services/events/media/2015/rupy-campinas.jpg"

        address: "Avenida Albert Einstein, 400 - Campinas, São Paulo"

        location: "Campinas, SP"
        date: "2015-06-20"
        price: "R$ 60"
      },
      {
        type: "event"
        name: "BrazilJS"
        url: "http://braziljs.com.br"
        edition: 5
        price: "R$ 180"

        organizer:
          name: "BrazilJS"
          url: "http://braziljs.org"

        date: ["2015-08-22", "2015-08-23"]
        address:
          venue: "Coco Bongo",
          address: "Boulevard Kukulcan, 30",
          city: "Cancún",
          state: "Quintana"
      }
      {
        type: "hackathon"
        name: "CI&T - HackDay"
        url: "http://ciandt.com/hackday"

        organizer:
          name: "CI&T"
          url: "http://ciandt.com"

        edition: 1
        date: ["2015-10-22"]
        address:
          venue: "Somewhere"
          address: ""
          city: ""
          state: ""
      }
    ]
    slug: slug
}

# Export the DocPad Configuration
module.exports = docpadConfig
