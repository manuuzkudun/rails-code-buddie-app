class WorkSpaceUsersController < ApplicationController
  def new
    @workspace = ExerciseWorkSpace.find(params[:workspace])
  end

  def create
    workspace = ExerciseWorkSpace.where(name: params[:workspace])[0]
    if workspace.respond_to?(:exercise)
      workspace_user = WorkSpaceUser.create(
        work_space: ExerciseWorkSpace.where(name: params[:workspace])[0],
        user: User.find_by(email: params[:email]),
      )
      redirect_to exercise_work_space_path(workspace.id)
    else
      workspace_user = WorkSpaceUser.create(
        work_space: PlaygroundWorkSpace.where(name: params[:workspace])[0],
        user: User.find_by(email: params[:email]),
      )
      redirect_to playground_work_space_path(workspace.id)
    end
  end
end
