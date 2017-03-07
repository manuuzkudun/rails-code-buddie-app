class WorkSpaceUsersController < ApplicationController
  def new
    @workspace = ExerciseWorkSpace.find(params[:workspace])
  end

  def create
    p WorkSpaceUser.create(
      work_space: ExerciseWorkSpace.find(params[:workspace]),
      user: User.find_by(email: params[:email]),
    )
    redirect_to exercise_work_space_path(params[:workspace])
  end
end
