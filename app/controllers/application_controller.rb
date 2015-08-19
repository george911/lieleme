class ApplicationController < ActionController::Base
:q

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_action :prepare_for_mobile
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! #devise认证user
  # layout :determine_layout # 如果controller内部有determine_layout会覆盖这个
  #翻译
  before_action :set_i18n_locale_from_params
  rescue_from "CanCan::AccessDenied", with: :access_denied


  protected
  def determine_layout
    if current_user.present?
      case current_user.user_type
      when "猎头"
        "application_hunter"
      when "人事"
        "application_hr"
      else  
        "application"
      end
    end
  end

    def deny_empty
       flash[:error] = "对不起,您必须选一项"
       render 'errors/deny_empty' 
    end

    def access_denied
       flash[:error] = "对不起,您没有权限"
       render 'errors/access_denied' 
    end

	def set_i18n_locale_from_params
	  if params[:locale]
	    if I18n.available_locales.map(&:to_s).include?(params[:locale]) # map(&:to_s)作用是把available_locales变成枚举列表["en","cn"]，available_locales系统后台设置，也可以通过在I18n.rb里I18n.available_locales=设置,
	      I18n.locale = params[:locale]
	    else
	      flash.now[:notice] = 
	        "#{params[:locale]} translation not available"
	      logger.error flash.now[:notice]
	    end
	  end
	end

	def default_url_options    
	  { locale: I18n.locale } #在I18n.rb里I18n.default_locale = :cn设置了I18n.locale
	end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:mobile,:email,:password, :password_confirmation,:user_name,:true_name,:user_type,:city,:avatar,:birthday) }
  end

  private
  def mobile_device?
    request.user_agent =~ /Mobile|Windows Phone/
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    request.format = :mobile if mobile_device?
    session[:mobile_param] = params[:mobile] if params[:mobile]
  end

end
