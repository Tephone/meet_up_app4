class Admins::LanguageReservationRatesController < Admins::ApplicationController
  def show
    @language = Language.find(params[:language])
  end
end
