class Students::ApplicationController < ApplicationController
  before_action :authenticate_student!
end
