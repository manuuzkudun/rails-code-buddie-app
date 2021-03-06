class LanguagesController < ApplicationController
  add_breadcrumb "Home", :languages_path

  def index
    @languages = Language.all
    @work_spaces = PlaygroundWorkSpace.where(
      user: current_user,
      exercise_id: nil
    ).order("created_at DESC")
    @work_space = PlaygroundWorkSpace.new
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

    add_breadcrumb @language.name, language_path(@language.id)
  end


end
