class Api::TodosController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :index}
      format.json {render json: Todo.all }
    end
  end

  def create
    newTodo = Todo.new(todo_params)
    render(json: newTodo) if newTodo.save!
  end

  def update
    todo = Todo.find(params[:id])
    render(json: todo) if todo.update!(todo_params)

  end

  def destroy
    todo = Todo.destroy(params[:id])
    render json: todo
  end

  def todo_params
    params.require(:todo).permit(:body, :title, :done, :id)
  end

end
