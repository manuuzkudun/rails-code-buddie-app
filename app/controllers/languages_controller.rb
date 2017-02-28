class LanguagesController < ApplicationController
  add_breadcrumb "Home", :languages_path

  def index
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
    @exercises = @language.exercises.order('id ASC')
    add_breadcrumb @language.name, language_path(@language.id)
  end
end
