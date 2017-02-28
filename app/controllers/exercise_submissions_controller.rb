class ExerciseSubmissionsController < ApplicationController
  before_action :authenticate_user!
  def create
    p ExerciseSubmission.create(
      answer: params[:code],
      exercise: Exercise.find(params[:exercise_id]),
      user: current_user,
      completed: true
      )
  end

  private

  def submission_params
    # to add
  end
end
