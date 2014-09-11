class UpvotesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@post.upvotes.create
		raise @post
	end

end
