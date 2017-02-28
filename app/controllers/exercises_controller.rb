class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
    # @value = "class SimpleNumber\ndef initialize(num)\nraise unless num.is_a?(Numeric)\n@x = num\nend\ndef add(y)\n@x + y\nend\ndef multiply(y)\n@x * y\nend\nend"
    @test = "require_relative \"code\"\nrequire \"test/unit\"\nclass TestSimpleNumber < Test::Unit::TestCase\ndef test_simple\nassert_equal(4, SimpleNumber.new(2).add(2) )\nassert_equal(4, SimpleNumber.new(2).multiply(2) )\nend\ndef test_typecheck\nassert_raise( RuntimeError ) { SimpleNumber.new(\'a\') }\nend\nend"
    @lang_id = "1"
    @value = "class SimpleNumber\ndef initialize(num)\nraise unless num.is_a?(Numeric)\n@x = num\nend\ndef add(y)\n@x + y\nend\ndef multiply(y)\n@x * y\nend\nend"
  end
end
