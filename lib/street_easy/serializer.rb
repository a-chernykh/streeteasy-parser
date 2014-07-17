module StreetEasy
  class Serializer
    def serialize_collection(collection)
      collection.map { |e| serialize_item(e) }
    end

    private

    def serialize_item(item)
      { listing_class: item.listing_class,
        address: item.address,
        unit: item.unit,
        url: item.url,
        price: item.price }
    end
  end
end
