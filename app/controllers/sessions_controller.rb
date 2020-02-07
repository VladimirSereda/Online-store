class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
      user = User.find_by(name: params[:password])
      if user and user.authenticate(params[:passwrod])
          session[:user_id] = user.id
          redirect_to admin_url
      else
          redirect_to login_url, alert: "Неверная комбинация имени и пароля"
      end
  end

  def destroy
      session[:user_id] = nil
      redirect_to store_url, notice: "Сеанс работы завершен"
  end
end
