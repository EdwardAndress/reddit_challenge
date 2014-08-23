class LinksController < ApplicationController

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(link_params)

		if @link.save
			redirect_to '/posts'
		else
			render 'new'
		end
	end

	private

	def link_params
		params.require(:link).permit(:title, :url)
	end

end
