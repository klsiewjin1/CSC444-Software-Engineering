class Geocoder 
   
   # Returns a LatLong object with the coordinates of the address supplied. Address is just a string
   # which will trigger an external API call each time to find the LatLong of the address
   # Returns nil if error and no LatLong could be resolved to the address.
   def getLatLong(address)
   		result = nil;

   		#do api call


   		#set result of api call in return value

   		return result;
   end

end

class LatLong
	attr_accessor :long
	attr_accessor :lat
end

