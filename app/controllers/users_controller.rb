# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    json_file_path = Rails.root.join('users.json')
    json_data = File.read(json_file_path)
    render json: json_data
  end

  def create
    # 创建新的内容（暂时省略）
    render json: { message: 'Post created successfully' }, status: :created
  end

  def show
    # 查找并显示内容（暂时省略）
    render json: { message: "Showing content for ID #{params[:id]}" }
  end

  def destroy
    # 删除内容（暂时省略）
    render json: { message: "Content with ID #{params[:id]} deleted successfully" }
  end
end
