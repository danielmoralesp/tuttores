class TestsController < ApplicationController
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      flash[:notice] = 'El test ha sido enviado con éxito'
      redirect_to teachers_landing_path
    else
      flash[:alert] = 'Algo fallo, el test no ha sido enviado con éxito'
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def test_params
      params.require(:test).permit(:questions, :answers, :topic_id, :result, :teacher_id, :subject_id )
    end
end
