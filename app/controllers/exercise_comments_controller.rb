class ExerciseCommentsController < ApplicationController
  def index
    @exercise_comments = ExerciseComment.all
  end

  def create

  end

  def show
    @exercise_comments = ExerciseComment.find(params[:id])
  end
end
