require 'open-uri'

module StreetEasy
  class TopListings
    SALES_URL = 'http://streeteasy.com/for-sale/soho?page=#PAGE#&sort_by=price_desc'.freeze
    RENTALS_URL = 'http://streeteasy.com/for-rent/soho/rental_type:frbo,brokernofee,brokerfee?page=#PAGE#&sort_by=price_desc'.freeze

    def sales(count)
      listings = get(count, SALES_URL)
      listings.each { |l| l.listing_class = 'Sale' }
      listings
    end

    def rentals(count)
      listings = get(count, RENTALS_URL)
      listings.each { |l| l.listing_class = 'Rent' }
      listings
    end

    private

    def get(count, template_url)
      listings = []

      for page in 1..count
        url = template_url.gsub('#PAGE#', page.to_s)
        html = open(url)
        parser = Parser.new(html)
        listings += parser.listings[0...[parser.listings.count, count - listings.count].min]
        break if listings.count == count
      end
      
      listings
    end
  end
end
