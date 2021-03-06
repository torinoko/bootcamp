# frozen_string_literal: true

class API::GrassesController < API::BaseController
  def show
    user = User.find(params[:id])
    @times = Grass.times(user, Date.current)
  end
end
