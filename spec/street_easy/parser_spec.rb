module StreetEasy
  describe Parser do
    let(:html)   { File.open(File.expand_path('../fixtures/listings.html', File.dirname(__FILE__))).read }
    let(:parser) { described_class.new(html) }

    describe '#listings' do
      it 'has 12 items' do
        expect(parser.listings.count).to eq 12
      end

      describe '1' do
        subject { parser.listings[0] }

        its(:address) { should eq '246 Spring Street PRESIDENTIAL' }
        its(:unit)    { should eq 'PRESIDENTIAL' }
        its(:url)     { should eq 'http://streeteasy.com/building/trump-soho-hotel-condominium/presidential-penthouse' }
        its(:price)   { should eq 50_000_000 }
      end

      describe '2' do
        subject { parser.listings[1] }

        its(:address) { should eq '158 Mercer Street #PHM' }
        its(:unit)    { should eq '#PHM' }
        its(:url)     { should eq 'http://streeteasy.com/sale/1094451-condo-158-mercer-st-soho-new-york' }
        its(:price)   { should eq 37_500_000 }
      end
    end
  end
end
