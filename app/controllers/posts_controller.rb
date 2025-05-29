class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /users/:user_id/posts
  def index
    @posts = Post.includes(:user, :categories).order(created_at: :desc)
  end

  # GET /users/:user_id/posts/:id
  def show
  end
  def new
 @post = @user.posts.build
   end
  # GET /users/:user_id/posts/new
  def new
    @post = @user.posts.new
  end

  # GET /users/:user_id/posts/:id/edit
  def edit
  end

  # POST /users/:user_id/posts
  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@user), notice: "Post başarıyla oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id/posts/:id
  def update
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post), notice: "Post başarıyla güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/posts/:id
  def destroy
    @post.destroy
    redirect_to user_posts_path(@user), notice: "Post başarıyla silindi.", status: :see_other
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :article, :status, :image, category_ids: [])
  end

  def authorize_user!
    redirect_to root_path, alert: "Yetkisiz işlem!" unless @user == current_user
  end
end
