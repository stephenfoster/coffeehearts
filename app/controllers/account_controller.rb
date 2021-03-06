class AccountController < ApplicationController
  layout "main"

  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_from_cookie
  skip_before_filter :login_required, :only => [:login, :new, :signup]

  # say something nice, you goof!  something sweet.
  def index
    redirect_to(:action => 'signup') and return unless logged_in? || User.count > 0
    redirect_to user_path(current_user.id)
  end

  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => '/account', :action => 'index')
      flash[:notice] = "Logged in successfully"
    end
  end

  def signup
    @recent_users = User.find(:all, :conditions=>["created_at > ?", Date.today - 7.days]).select{|u| !u.profile_picture_file_name.nil?}.first 5
    @recent_relationships = Relationship.find(:all, :conditions=>["created_at > ?", Date.today - 7.days]).select{|r| !r.pictures.blank? }.first 5


    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => '/account', :action => 'index')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    current_user.last_logout = Time.now
    current_user.save
    redirect_back_or_default(:controller => '/account', :action => 'signup')
  end
end
