class TutoringsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_student?

  def new
    @tutoring = Tutoring.new
  end

  def create
    @tutoring = Tutoring.new(tutoring_params)

    if @tutoring.save
      flash[:notice] = 'La solicitud de tutoria ha sido creada con exito'
    else
      flash[:notice] = 'La solicitud no ha sido almacenada'
    end
    redirect_to root_path
  end

  private
    def tutoring_params
      params.require(:tutoring).permit(:topic_id, :place, :calendar_id, :num_hours, :hour, :user_id, :teacher_id, :city_id, :country_id, :subject_id)
    end

    def is_student?
      unless current_user.estudiante?
        flash[:alert] = 'No tienes permisos para acceder a esta ruta'
        redirect_to root_path
      end
    end
end
