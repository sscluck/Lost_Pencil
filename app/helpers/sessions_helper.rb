module SessionsHelper
# Code from Ruby on Rails Tutorial

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.password]
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= remembered_user
  end

  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  private
    def remembered_user
      User.verify_for_cookie(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
