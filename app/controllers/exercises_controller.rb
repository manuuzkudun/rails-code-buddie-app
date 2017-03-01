class ExercisesController < ApplicationController
add_breadcrumb "Languages", :languages_path

  def show
    @exercise = Exercise.find(params[:id])
    # @value = "class SimpleNumber\ndef initialize(num)\nraise unless num.is_a?(Numeric)\n@x = num\nend\ndef add(y)\n@x + y\nend\ndef multiply(y)\n@x * y\nend\nend"
    # @test = "require_relative \"code\"\nrequire \"test/unit\"\nclass TestSimpleNumber < Test::Unit::TestCase\ndef test_simple\nassert_equal(4, SimpleNumber.new(2).add(2) )\nassert_equal(4, SimpleNumber.new(2).multiply(2) )\nend\ndef test_typecheck\nassert_raise( RuntimeError ) { SimpleNumber.new(\'a\') }\nend\nend"
    @lang_id = "1"
    # @test = @exercise.exercise_files.where(file_type: "Test File")[0].content
    @test = readFile('db/tests/grains_test.rb')
    # @value = "class SimpleNumber\ndef initialize(num)\nraise unless num.is_a?(Numeric)\n@x = num\nend\ndef add(y)\n@x + y\nend\ndef multiply(y)\n@x * y\nend\nend"
    @value = ""
    add_breadcrumb @exercise.language.name, language_path(@exercise.language.id)
    add_breadcrumb @exercise.title, exercise_path(@exercise.id)
  end

  private
  def readFile(path)
    res = ""
    File.open(path, "r") do |f|
      f.each_line do |line|
        res += line
      end
    end
    return res
  end
end

