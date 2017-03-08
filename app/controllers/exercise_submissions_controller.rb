class ExerciseSubmissionsController < ApplicationController
  before_action :authenticate_user!
  def create
    ExerciseSubmission.create(
      answer: params[:code],
      exercise: Exercise.find(params[:exercise]),
      user: current_user,
      completed: true
      )
  end

  def update
    submission = ExerciseSubmission.where(
      user: current_user,
      exercise: Exercise.find(params[:exercise])
    )[0];
    submission.answer = params[:code]
    submission.save
  end

end
