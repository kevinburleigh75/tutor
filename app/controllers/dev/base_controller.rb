module Dev
  class BaseController < ApplicationController

    skip_before_filter :authenticate_user!

    before_filter Proc.new{ 
      raise SecurityTransgression unless !Rails.env.production? || 
                                         current_user.is_administrator? 
    }

    
  end
end
