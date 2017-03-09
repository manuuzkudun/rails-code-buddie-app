class WorkSpaceUsersController < ApplicationController
  def new
    @workspace = ExerciseWorkSpace.find(params[:workspace])
  end

  def create
    workspace = WorkSpace.find(params[:workspace])
    if workspace.respond_to?(:exercise)
      workspace_user = WorkSpaceUser.create(
        work_space: ExerciseWorkSpace.find(params[:workspace]),
        user: User.find_by(email: params[:email]),
      )
      redirect_to exercise_work_space_path(params[:workspace])
    else
      workspace_user = WorkSpaceUser.create(
        work_space: PlaygroundWorkSpace.find(params[:workspace]),
        user: User.find_by(email: params[:email]),
      )
      redirect_to playground_work_space_path(params[:workspace])
    end
  end
end
