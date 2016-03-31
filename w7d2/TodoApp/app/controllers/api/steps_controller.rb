class Api::StepsController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :index}
      format.json {render json: Step.all }
    end
  end

  def create
    newStep = Step.new(step_params)
    render(json: newStep) if newStep.save!
  end

  def update
    step = Step.find(params[:id])
    render(json: step) if Step.update!(Step_params)

  end

  def destroy
    step = Step.destroy(params[:id])
    render json: step
  end

  def step_params
    params.require(:Step).permit(:text, :todo_id, :done, :id)
  end
end
