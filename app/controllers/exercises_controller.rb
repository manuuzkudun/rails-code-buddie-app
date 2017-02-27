class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
    @value = "def scoring(array)\n# update_score of every user in the array unless the user is admin\nend"
  end
end
