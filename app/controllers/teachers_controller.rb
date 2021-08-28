class TeachersController < ApplicationController
  def show
    @teacher = current_teacher
  end
end
