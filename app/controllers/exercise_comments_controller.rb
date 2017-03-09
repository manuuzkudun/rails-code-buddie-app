class ExerciseCommentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @exercise_comments = ExerciseComment.all
  end

  def create
    p params

    ExerciseComment.create(
      content: params[:content],
      user: current_user,
      exercise: Exercise.find(params[:exercise])
    )
  end

  def show
    @exercise_comments = ExerciseComment.find(params[:id])
  end
end
