class AccountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
  
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      
      # Mark the user as activated and record the activation time
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      
      # Log the user in
      login user
<<<<<<< HEAD
=======
      flash.clear()
>>>>>>> ce9aca4fbc0cda8bb86008418366d7c98dc4c248
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash.clear()
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
