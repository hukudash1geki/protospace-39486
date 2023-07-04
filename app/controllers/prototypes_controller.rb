class PrototypesController < ApplicationController
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
    @proto = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @proto.comments.includes(:user)
    
  end

  def edit
    @proto = Prototype.find(params[:id])
  end

  def update
    @proto = Prototype.find(params[:id])

    if @proto.update(proto_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    proto = Prototype.find(params[:id])
    proto.destroy
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
 


end
