class ExerciseWorkSpacesController < ApplicationController
  OPENTOK_API_KEY = '45784152'
  OPENTOK_SECRET_TOKEN = 'b5bb6aa995af42d837ec4d807f566e17d0cf4a63'

  before_action :config_opentok, only: [:create, :show]
  before_action :authenticate_user!

  def show
    @workspace = ExerciseWorkSpace.find(params[:id])
    @tok_token = @opentok.generate_token @workspace.session_id
    @exercise = @workspace.exercise
    @lang_id = "1"
    @test = @workspace.exercise.exercise_files.where(file_type: "test")[0].content
    @value = @workspace.user_code
    @comments = get_exercise_comments(@workspace.exercise)
    @submissions = get_exercise_submissions(@workspace.exercise)
    add_breadcrumb "Home", languages_path
    add_breadcrumb @exercise.language.name, language_path(@exercise.language.id)
    add_breadcrumb @exercise.title, exercise_path(@exercise.id)
  end

  def create
    if ExerciseWorkSpace.where(
      user: current_user,
      name: Exercise.find(params[:exercise]).title
      ).length > 0
      work_space_id = ExerciseWorkSpace.where(
                                    user: current_user,
                                    name: Exercise.find(params[:exercise]).title)[0].id
      redirect_to exercise_work_space_path(work_space_id)
    else
      @work_space = ExerciseWorkSpace.create(work_space_params)
      redirect_to exercise_work_space_path(@work_space.id)
    end
  end

  def update
    @workspace = ExerciseWorkSpace.find(params[:id])
    @workspace.user_code = params[:code]
    @workspace.save
  end

  private

  def get_exercise_comments(exercise)
    ExerciseComment.where(exercise: exercise)
  end

  def get_exercise_submissions(exercise)
    ExerciseSubmission.where(exercise_id: @exercise)
  end

  def generate_session_id
    session = @opentok.create_session
    session.session_id
  end

  def work_space_params
    {
      name: Exercise.find(params[:exercise]).title,
      language: Exercise.find(params[:exercise]).language,
      user_code: Exercise.find(params[:exercise]).exercise_files.where(file_type: "initial_code")[0].content,
      session_id: generate_session_id,
      user: current_user,
      exercise: Exercise.find(params[:exercise])
    }
  end

  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTok.new OPENTOK_API_KEY, OPENTOK_SECRET_TOKEN
    end
  end
end
