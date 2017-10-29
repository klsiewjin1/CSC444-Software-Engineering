module ServicesHelper
    def isclient
        return true if @current_user.user_type == "client" 
        return false
    end
end
