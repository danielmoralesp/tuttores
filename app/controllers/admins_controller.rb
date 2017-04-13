class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @tutoring = Tutoring.all
  end

  def is_admin?
    unless current_user.admin?
      flash[:alert] = 'No tienes permisos para acceder  a esta ruta'
      redirect_to root_path
    end
  end
end
