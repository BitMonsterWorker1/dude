class TrumpsController < ApplicationController
before_action :find_post, only: [:show, :edit, :destroy, :update]
before_action :authenticate_user!, only: [:new, :edit, :destroy]
before_action :is_owner, only: [:edit, :destroy]
   def index
     @trumps = Trump.all.order("created_at DESC")
   end

   def show
   end

   def new
     @trump = Trump.new
   end

   def create
    @trump = current_user.trumps.build(post_params)
    if @trump.save
      redirect_to @trump, notice: "Post was successfully created!"
    else
      render "new"
    end
  end

 def edit
  end


 def update
    if @trump.update(post_params)
     redirect_to @trump
   else
     render "edit"
   end
 end


 def destroy
   @trump.destroy
   redirect_to  root_path
  end

   private


def find_post
  @trump = Trump.find(params[:id])
end

   def post_params
     params.require(:trump).permit(:title, :body, :user_id)
   end

   def is_owner
   unless current_user == @trump.user
     flash[:alert] = "That post doesn't belong to you!"
     redirect_to @trump
   end
 end
end
