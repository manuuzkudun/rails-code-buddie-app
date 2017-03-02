class ExercisesController < ApplicationController
add_breadcrumb "Languages", :languages_path

  def show
    @exercise = Exercise.find(params[:id])
    @lang_id = "1"
    @test = @exercise.exercise_files.where(file_type: "test")[0].content
    @value = @exercise.exercise_files.where(file_type: "initial_code")[0].content
    @comments = get_exercise_comments(params[:id])
    @submissions = get_exercise_submissions
    add_breadcrumb @exercise.language.name, language_path(@exercise.language.id)
    add_breadcrumb @exercise.title, exercise_path(@exercise.id)
  end

private

def get_exercise_comments(id)
  exercise = Exercise.find(id)
  ExerciseComment.where(exercise: exercise)
end

def get_exercise_submissions
  submissions = ExerciseSubmission.where(exercise_id: @exercise)
end

end

