class TodosController < ApplicationController
  before_action :load_todo, except: [:index, :create]

  def index
    @todos = Todo.all
  	json_response(@todos)
  end

  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  def update
    if @todo.update(todo_params)
      json_response(@todo)
    else
      # do something
    end
  end

  def update_status
    if @todo.update status: 'done'
      json_response(@todo)
    else
      # do something
    end
  end

  def destroy
    if @todo.destroy
      json_response(@todo)
    else
      # do something
    end
  end

  private
  def todo_params
    params.permit(:title, :created_by)
  end

  def load_todo
    @todo = Todo.find(params[:id])
  end
end
