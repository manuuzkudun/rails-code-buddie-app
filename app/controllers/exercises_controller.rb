class ExercisesController < ApplicationController
add_breadcrumb "Languages", :languages_path

  def show
    @exercise = Exercise.find(params[:id])
    @lang_id = "1"
    @test = @exercise.exercise_files.where(file_type: "test")[0].content
    # @value = "class SimpleNumber\ndef initialize(num)\nraise unless num.is_a?(Numeric)\n@x = num\nend\ndef add(y)\n@x + y\nend\ndef multiply(y)\n@x * y\nend\nend"
    @value = @exercise.exercise_files.where(file_type: "initial_code")[0].content
    add_breadcrumb @exercise.language.name, language_path(@exercise.language.id)
    add_breadcrumb @exercise.title, exercise_path(@exercise.id)
  end
end

