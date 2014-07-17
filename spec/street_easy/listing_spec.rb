module StreetEasy
  describe Listing do
    its(:address)       { should be_nil }
    its(:listing_class) { should be_nil }
    its(:unit)          { should be_nil }
    its(:url)           { should be_nil }
    its(:price)         { should be_nil }
  end
end
