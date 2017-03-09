class PlaygroundWorkSpacesController < ApplicationController

  OPENTOK_API_KEY = '45784152'
  OPENTOK_SECRET_TOKEN = 'b5bb6aa995af42d837ec4d807f566e17d0cf4a63'

  before_action :config_opentok, only: [:create, :show]
  before_action :authenticate_user!

  def index
    @work_spaces = PlaygroundWorkSpace.where(
      user: current_user,
    ).order("created_at DESC")
  end

  def new
    @work_space = PlaygroundWorkSpace.new
  end

  def create
    @work_space = PlaygroundWorkSpace.new(work_space_params)
    respond_to do |format|
      if @work_space.save
        format.html {
          redirect_to("/playgrounds/#{@work_space.id}")
        }
      else
        format.html {
          render :controller => 'playground_work_spaces',
          :action => 'index'
        }
      end
    end
  end

  def show
    @workspace = PlaygroundWorkSpace.find(params[:id])
    @tok_token = @opentok.generate_token @workspace.session_id
    @collaborators = []
    if @workspace.work_space_users.length > 0
      @workspace.work_space_users.each do |user|
        @collaborators.push(user.user)
      end
    end
  end

  def destroy
    @workspace = PlaygroundWorkSpace.find(params[:id])
    @workspace.destroy
    redirect_to :action => 'index'
  end

  private

  def generate_session_id
    session = @opentok.create_session
    session.session_id
  end

  def work_space_params
    {
      name: params[:playground_work_space][:name],
      language: Language.find(params[:playground_work_space][:language]),
      user_code: '',
      session_id: generate_session_id,
      user: current_user
    }
  end

  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTok.new OPENTOK_API_KEY, OPENTOK_SECRET_TOKEN
    end
  end

end
