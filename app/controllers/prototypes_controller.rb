class PrototypesController < ApplicationController

  def index
  end

  def new
    @proto = Prototype.new
  end

  def create
    @proto = Prototype.new(proto_params)
    @proto.save
    if @proto.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
