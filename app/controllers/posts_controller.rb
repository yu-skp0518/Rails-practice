class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #inspectメソッドは対象の型に沿った文字列を返す
    # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params) #post_paramsはpriavte内の定数(post_params)を利用している

    if @post.save
      # redirect
      redirect_to post_path(@post)
    else
      # render plain: @post.errors.inspect
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
