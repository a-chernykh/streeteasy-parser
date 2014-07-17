module StreetEasy
  describe Serializer do
    describe '#serialize_collection' do
      it 'returns array of hashes' do
        l1 = Listing.new
        l1.listing_class = 'Sale'
        l1.address = '1st Street'
        l1.unit = '#1FL'
        l1.url = 'http://example1.com'
        l1.price = 100

        l2 = Listing.new
        l2.listing_class = 'Rent'
        l2.address = '2nd Street'
        l2.unit = '#2FL'
        l2.url = 'http://example2.com'
        l2.price = 200

        expect(subject.serialize_collection([l1, l2])).to eq [
          { :listing_class=>"Sale", 
            :address=>"1st Street", 
            :unit=>"#1FL", 
            :url=>"http://example1.com", 
            :price=>100 }, 
          { :listing_class=>"Rent", 
            :address=>"2nd Street", 
            :unit=>"#2FL", 
            :url=>"http://example2.com", 
            :price=>200 } 
        ]
      end
    end
  end
end
