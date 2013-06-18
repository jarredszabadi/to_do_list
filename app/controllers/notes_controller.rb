class NotesController < ApplicationController
	def create
		if current_user
			current_user.create_note!((params[:note][:text]), (params[:note][:assigned]))
			redirect_to :back
		end
	end
end
