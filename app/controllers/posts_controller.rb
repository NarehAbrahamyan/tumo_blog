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
  @posts = Post.order(created_at: :desc)
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment=Comment.new
    @comments=@post.comments.order("created_at DESC")
  end

  def yposts
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
    @posts = User.find(current_user.id).posts  
  end
 
  # trending
  def trend
    @posts = Post.all
    @ordered_posts = []

    @posts.each do |post|
      @ordered_posts[post] = post.get_downvotes.size-post.get_upvotes.size
  end

    @ordered_posts.sort_by{|a| a[] }
    
    @posts=Post.order(votes: :desc)
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
  end
  def category0
    @posts=Post.where(category: 'Animation')
  end
  def category1
    @posts=Post.where(category: 'Game Development')
  end
  def category2
    @posts=Post.where(category: 'Filmmaking')
  end
  def category3
    @posts=Post.where(category: 'Web Development')
  end
  def category4
    @posts=Post.where(category: 'Music')
  end
  def category5
    @posts=Post.where(category: 'Writing')
  end
  def category6
    @posts=Post.where(category: 'Drawing')
  end
  def category7
    @posts=Post.where(category: 'Graphic Design')
  end
  def category8
    @posts=Post.where(category: '3D Modeling')
  end
  def category9
    @posts=Post.where(category: 'Programming')
  end
  def category10
    @posts=Post.where(category: 'Robotics')
  end
  def category11
    @posts=Post.where(category: 'Motion Graphics')
  end
  def category12
    @posts=Post.where(category: 'Photography')
  end
  def category13
    @posts=Post.where(category: 'New Media')
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
