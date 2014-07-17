module StreetEasy
  describe TopListings do
    describe '#sales', :vcr do
      it 'returns top N sales sorted by price descending' do
        listings = subject.sales(20)
        expect(listings.map(&:price)).to eq [
          50000000,
          37500000,
          37500000,
          32000000,
          28500000,
          28000000,
          25000000,
          19750000,
          19750000,
          16900000,
          15000000,
          14900000,
          13500000,
          12995000,
          12995000,
          12350000,
          12000000,
          10995000,
          10595000,
          10500000
        ]
      end

      it 'sets listing_class to Sale' do
        listings = subject.sales(20)
        expect(listings.map(&:listing_class).uniq).to eq %w(Sale)
      end
    end

    describe '#rentals', :vcr do
      it 'returns top N rentals sorted by price descending' do
        listings = subject.rentals(20)
        expect(listings.map(&:price)).to eq [
          60000,
          43500,
          40000,
          40000,
          35000,
          30000,
          29000,
          25000,
          25000,
          24500,
          24000,
          22000,
          21000,
          20000,
          20000,
          20000,
          20000,
          19950,
          19500,
          19000
        ]
      end

      it 'sets listing_class to Rent' do
        listings = subject.rentals(20)
        expect(listings.map(&:listing_class).uniq).to eq %w(Rent)
      end
    end
  end
end
