class TeachersController < ApplicationController
  before_action :authenticate_user!, except: [ :landing, :index, :show ]
  before_action :is_teacher?, except: [ :landing, :index, :show, :search ]
  before_filter :validate_user, only: [:edit, :update, :destroy]

  def landing
    render :layout => 'landing'
  end

  def index
    @teachers = Teacher.all.order(created_at: :desc)
    render :layout => 'landing'
  end

  def show
    @teacher = Teacher.find(params[:id])
    @tutorings = @teacher.tutorings
    @tutoring = Tutoring.new

  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user

    if @teacher.save
      flash[:notice] = 'El profesor ha sido creado con éxito'
      redirect_to new_experience_path
    else
      flash[:alert] = 'Algo fallo, el profesor no ha sido creado con éxito'
      render :new
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      flash[:notice] = 'El profesor ha sido actualizado con éxito'
      redirect_to teachers_path
    else
      flash[:alert] = 'Algo fallo, el profesor no ha sido actualizado con éxito'
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])

    @teacher.destroy
    flash[:notice] = 'El profesor ha sido eliminado con éxito'
    redirect_to teachers_path
  end

  def search
    if params[:city].blank? && params[:topic].blank?
      @teachers = Teacher.all.order(created_at: :desc)
    else
      @teachers = Teacher.search(params)
    end
  end

  private
    def teacher_params
      params.require(:teacher).permit(:phone, :user_id, :image_url, :verify_bgd_check, :complete_exam, :about_me, :address, :verify_phone, :role, :country_id, :city_id )
    end

    def is_teacher?
      unless current_user.profesor?
       flash[:alert] = 'No tienes permisos para acceder a esta ruta, debes estar registrado como profesor'
       redirect_to edit_user_registration_path
      end
    end

    def validate_user
      @teacher = Teacher.find(params[:id])
      redirect_to root_path unless current_user.id.to_s == @teacher.user_id.to_s
      flash[:alert] = 'No tienes permisos para acceder a esta ruta'
    end
end
