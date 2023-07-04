class PrototypesController < ApplicationController
  before_action :set_proto, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  def index
    @proto = Prototype.includes(:user)
  end

  def new
    @proto = Prototype.new
  end

  def create
    @proto = Prototype.new(proto_params)

    if @proto.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @proto.comments.includes(:user)
    
  end

  def edit
  end

  def update
    if @proto.update(proto_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @proto.destroy
    redirect_to root_path
  end

  private

  def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @proto = Prototype.find(params[:id])
    unless current_user.id == @proto.user_id
      redirect_to root_path
    end
  end
 
  def set_proto
    @proto = Prototype.find(params[:id])
  end

end
