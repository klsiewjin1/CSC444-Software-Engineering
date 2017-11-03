module ServicesHelper
    
    def get_service_name(service_id)
        service = Service.find_by_id(service_id)
        if service
            return service.name
        else
            return NOT_APPLICABLE
        end
    end
    
end
