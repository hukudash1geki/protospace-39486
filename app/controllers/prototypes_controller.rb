class PrototypesController < ApplicationController

  def index
  end

  def new
  end

  private

  def message_params
    params.require(:prototype).permit(:content, :image).merge(user_id: current_user.id)
  end

end
