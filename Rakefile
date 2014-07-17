lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'street_easy'
require 'json'

$top = StreetEasy::TopListings.new
$serializer = StreetEasy::Serializer.new

task :sales do
  puts JSON.pretty_generate($serializer.serialize_collection($top.sales(20)))
end

task :rentals do
  puts JSON.pretty_generate($serializer.serialize_collection($top.rentals(20)))
end
