class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,:upvote,:downvote]

  # GET /posts
  # GET /posts.json
  def index
    @direction=[
    'Animation',
    'Game Development',
    'Filmmaking',
    'Web Development',
    'Music',
    'Writing',
    'Drawing',
    'Graphic Design',
    '3D Modeling',
    'Programming',
    'Robotics',
    'Motion Graphics',
    'Photography',
    'New Media'
  ]
  @posts = Post.order(votes: :desc)
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment=Comment.new
    @comments=@post.comments.order("created_at DESC")
  end
  def trending
    @direction=[
      'Animation',
      'Game Development',
      'Filmmaking',
      'Web Development',
      'Music',
      'Writing',
      'Drawing',
      'Graphic Design',
      '3D Modeling',
      'Programming',
      'Robotics',
      'Motion Graphics',
      'Photography',
      'New Media'
    ]
    @posts = Post.order(votes: :desc)
  end 
  # GET /posts/new
  def new
    @post = current_user.posts.build
  end
  #POSTS UPVOTE 
  def upvote
    @post = Post.find(params[:id])
    @post.downvote_by(current_user)
    redirect_back(fallback_location: root_path)
  end 
  def downvote
    @post = Post.find(params[:id]) 
    @post.upvote_by(current_user)
    redirect_back(fallback_location: root_path)
  end   
  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {}).permit(:description, :category, :media, :votes)
    end
end
