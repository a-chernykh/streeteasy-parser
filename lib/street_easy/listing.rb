module StreetEasy
  class Listing
    attr_accessor :address, :listing_class, :unit, :url, :price

    def to_s
      "StreetEasy::Listing(address: #{address}, price: #{price})"
    end
  end
end
