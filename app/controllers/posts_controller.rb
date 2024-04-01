# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def create
    # 创建新的内容（暂时省略）
    json_data=load_json_data

    #創建新的內容
    new_post ={
      "id":json_data.empty? ? 1 : json_data.last['id'] + 1, # 生成新的ID
      "name": "MOMO Tsai",
      "email": "MOMO@example.com",
      "age": 21

      
    }
    json_data << new_post

    save_json_data(json_data)
    render json: { message: 'Post created successfully' }, status: :created
  end

  def show
    json_data = load_json_data
    post = json_data.find { |post| post['id'] == params[:id].to_i }
    if post
      render json: post
    else
      render json: { error: 'Post not found' }, status: :not_found
    end
  end

  def destroy
    json_data = load_json_data
    post_index = json_data.find_index { |post| post['id'] == params[:id].to_i }
    if post_index
      deleted_post = json_data.delete_at(post_index)
      save_json_data(json_data)
      render json: deleted_post
    else
      render json: { error: 'Post not found' }, status: :not_found
    end
  end

  def index
    json_file_path = Rails.root.join('users.json')
    json_data = File.read(json_file_path)
    render json: json_data
  end

  def hello
    render 'hello/index'
  end

  private

  def load_json_data
    json_file_path = Rails.root.join("D:\\my_api\\users.json")
    json_data = JSON.parse(File.read(json_file_path))
  end

  def save_json_data(data)
    json_file_path = Rails.root.join("D:\\my_api\\users.json")
    File.open(json_file_path, 'w') { |file| file.write(JSON.pretty_generate(data)) }
  end
end