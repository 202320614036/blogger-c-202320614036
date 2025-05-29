module Admin
  class PostsController < ApplicationController
    layout "admin"
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @posts = Post.all
    end

    private

    def authorize_admin
      redirect_to root_path, alert: "Permissions denied" unless current_user.admin?
    end
  end
end