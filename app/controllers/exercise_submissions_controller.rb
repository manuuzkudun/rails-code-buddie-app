class ExerciseSubmissionsController < ApplicationController
  before_action :authenticate_user!
  def create
    puts "we are in create"
    p ExerciseSubmission.create(
      answer: params[:code],
      exercise: Exercise.find(params[:exercise]),
      user: current_user,
      completed: true
      )
  end

  def update
    puts "we are in update"
    submission = ExerciseSubmission.where(
      user: current_user,
      exercise: Exercise.find(params[:exercise])
    )[0];
    submission.answer = params[:code]
    p submission.save
  end

end
