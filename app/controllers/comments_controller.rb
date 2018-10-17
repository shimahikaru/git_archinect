class CommentsController < ApplicationController

def create
@comment = Comment.create(create_params)
end

def search
  @user = User.find(params[:id])
  @products = @user.commented_products.distinct
  @photos = WholePhoto.group(:product_id)
end

def destroy
  comment = Comment.find(params[:id])
  comment.destroy if comment.user_id == current_user.id
end

private

def create_params
  params.require(:comment).permit(:text, :product_id, :notice_id).merge(user_id: current_user.id)
end

end
