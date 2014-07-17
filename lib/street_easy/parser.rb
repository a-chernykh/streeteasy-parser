require 'nokogiri'

module StreetEasy
  class Parser
    def initialize(body)
      @body = body
    end

    def listings
      @listings ||= all_listings.map { |div| build_listing(div) }
    end

    private

    def all_listings
      document.css('div.listings div.listing:not(.featured)')
    end

    def document
      @document ||= Nokogiri::HTML(@body)
    end

    def build_listing(div)
      listing = Listing.new
      listing.address = div.css('.details_title h5').text
      listing.unit    = listing.address.split(' ').last
      listing.url     = 'http://streeteasy.com' + div.css('.details_title h5 a')[0]['href']
      listing.price   = div.css('.price').text.gsub(/[$,]/, '').to_i
      listing
    end
  end
end
