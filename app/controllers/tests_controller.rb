class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    service = StartTestService.new(current_user, Test.find(params[:id]))
    redirect_to service.call
  end
end
