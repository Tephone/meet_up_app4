class Teachers::ApplicationController < ApplicationController
  before_action :authenticate_teacher!
end
