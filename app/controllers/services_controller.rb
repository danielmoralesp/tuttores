class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_teacher?

  def new
    @service = Service.new
    @teacher = Teacher.last
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      flash[:notice] = 'El servicio ha sido creado con éxito'
      redirect_to teachers_path
    else
      flash[:alert] = 'Algo fallo, el profesor no ha sido creado con éxito'
      render new_service_path
    end
  end

  def edit
    @service = Service.find(params[:id])
    @teacher = @service.teacher_id
  end

  def update
    @service = Service.find(params[:id])

    if @service.update(service_params)
      flash[:notice] = 'El servicio ha sido actualizado con éxito'
      redirect_to teachers_path
    else
      flash[:alert] = 'Algo fallo, el profesor no ha sido actualizado con éxito'
      render edit_service_path
    end
  end



  private
    def service_params
      params.require(:service).permit(:type_tutoring, :academ_level, :price_per_hour, :min_hours, :time_anticipated, :teacher_id, :topic_id, :subject_id )
    end

    def is_teacher?
      unless current_user.profesor?
       flash[:alert] = 'No tienes permisos para acceder a esta ruta, debes estar registrado como profesor'
       redirect_to edit_user_registration_path
      end
    end
end
