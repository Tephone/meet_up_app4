class Admins::LanguagesController < Admins::ApplicationController
  def index
    @languages = Language.all.page(params[:page])
  end
end
