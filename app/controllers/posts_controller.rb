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
    #以下の記述で画面上にパラメータ内の値を確認することができる
    # render plain: params[:post].inspect

    #ストロングパラメータを通していない為セキュリティー上問題がある
    # @post = Post.new(params[:post])

    #以下のように一行にストロングパラメータをまとめて記述することもできる
    # @post = Post.new(params.require(:post).permit(:title, :body))

    #post_paramsはpriavte内のpost_paramsメソッドを利用している
    @post = Post.new(post_params)

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
