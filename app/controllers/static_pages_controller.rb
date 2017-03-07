class StaticPagesController < ApplicationController
  def home
      @languages = Language.all
  end
end
