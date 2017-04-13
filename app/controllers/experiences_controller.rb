class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_teacher?

  def new
    @experience = Experience.new
    @teacher = Teacher.last
  end

  def create
    @experience = Experience.new(experience_params)

    if @experience.save
      flash[:notice] = 'La experiencia ha sido creada con éxito'
      redirect_to new_service_path
    else
      flash[:alert] = 'Algo fallo, el profesor no ha sido creado con éxito'
      render new_experience_path
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    @teacher = @experience.teacher_id
  end

  def update
    @experience = Experience.find(params[:id])

    if @experience.update(experience_params)
      flash[:notice] = 'La experiencia ha sido actualizado con éxito'
      redirect_to teachers_path
    else
      flash[:alert] = 'Algo fallo, el profesor no ha sido actualizado con éxito'
      render edit_experience_path
    end
  end

  private
    def experience_params
      params.require(:experience).permit(:cargo, :empresa, :mes_inicio, :dia_inicio, :mes_fin, :dia_fin, :ubicacion, :description, :teacher_id, :ano_inicio, :ano_fin )
    end

    def is_teacher?
      unless current_user.profesor?
       flash[:alert] = 'No tienes permisos para acceder a esta ruta, debes estar registrado como profesor'
       redirect_to edit_user_registration_path
      end
    end
end
