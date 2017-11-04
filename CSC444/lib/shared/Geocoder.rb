require 'rest-client'
require 'json'

class Geocoder 
   
   # Returns a LatLong object with the coordinates of the address supplied. Address is just a string
   # which will trigger an external API call each time to find the LatLong of the address
   # Returns nil if error and no LatLong could be resolved to the address.
   def getLatLong(address)
   		result = nil;

   		#do api call
   		begin
   		response = RestClient.get('https://maps.googleapis.com/maps/api/geocode/json', 
   			{params: {address: address, key: 'AIzaSyAP_IzvS1mpKPgcs6meWzc6hu9PB0CVJFs'}});
   		rescue RestClient::ExceptionWithResponse => err
   			puts err.response;
   			return result;
		end

   		#set result of api call in return value
   		jsonResp = JSON.parse(response.body);

   		location = jsonResp['results'][0]['geometry']['location'];
   		result = LatLong.new
   		result.lat = location['lat'];
   		result.long = location['lng'];

   		return result;
   end

end

# the data transfer object which contains a latitude and longitude
class LatLong
	attr_accessor :long
	attr_accessor :lat
end

