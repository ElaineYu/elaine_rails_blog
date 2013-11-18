class PostsController < ApplicationController
	
	#http://localhost:3000/posts/new 
	def new
		# create a new instance variable called @post
		@post = Post.new
	end

	# POST   /posts(.:format)          posts#create
	def create
		# render text: params[:post].inspect
		# {"title"=>"First post!", "text"=>"This is my first post."}

		#@post = Post.new(params[:post])
		@post = Post.new(post_params)
		# @post = Post.new(params[:post].permit(:title, :text))

		#@post.save returns a boolean indicating whether the model was saved or not.
		if @post.save
			redirect_to @post
		else 
			render 'new'
		end
	end

	# post GET    /posts/:id(.:format)      posts#show
	def show
 	 	@post = Post.find(params[:id])
	end

	# posts GET    /posts(.:format)          posts#index
	def index
		@posts = Post.all
	end

	# edit_post GET    /posts/:id/edit(.:format) posts#edit
	def edit 
		@post = Post.find(params[:id])
	end

	# PATCH  /posts/:id(.:format)      posts#update
    # PUT    /posts/:id(.:format)      posts#update
	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	# DELETE /posts/:id(.:format)      posts#destroy
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	#t def post_params is private. This new approach prevents an attacker from setting the model's attributes by manipulating the hash passed to the model.
	private
	 def post_params
	   params.require(:post).permit(:title, :text)
	 end

end
