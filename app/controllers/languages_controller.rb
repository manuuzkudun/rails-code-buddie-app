class LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
    exercises = @language.exercises.order("id ASC")
    @submission_array = []
    exercises.each do |exercise|
      submission = ExerciseSubmission.where(
        user: current_user,
        completed:true,
        exercise: exercise).first
      completed = submission.nil? ? false : submission.completed
      @submission_array << {exercise: exercise, completed: completed}
    end
  end


end
