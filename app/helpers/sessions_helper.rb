module SessionsHelper
  
  
   def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  def admin_check(user)
 a = Adid.find(user) || false
if a.role.name == "admin" 
  true || false
end
end
   def gravatar_for1(user, options = {})
   options = { :size => 4 }.merge(options)
 
    gravatar_url = user
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
   def gravatar_for(user, options = {})
   options = { :size => 4 }.merge(options)

    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
 
    gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}?s=80"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
def admin_check?
  if Adid.exists?(current_user.id)

 a = Adid.find(current_user.id)
if a.role.name == "admin" 
  true 
end
else
  false
end
end

def admin_user
  @admin = admin_user(user)
end
def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  

def admin_user(user)
    if Adid.exists?(current_user.id)

 a = Adid.find(current_user.id)
if a.role.name == "admin" 
  user = current_user.id
end
end
end
  def store_location
    session[:return_to] = request.fullpath
  end
 def sign_in(user)
  cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end
    def sign_out
    cookies.delete(:remember_token)
  end
    def signed_in?
    !current_user.nil?
  end
  def current_user=(user)
    @current_user = user
  end
  def current_user
    @current_user ||= user_from_remember_token
  end
  def current_user?(user)
    user == current_user
  end
  private
  
    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end
def clear_return_to
      session.delete(:return_to)
    end
    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end
end