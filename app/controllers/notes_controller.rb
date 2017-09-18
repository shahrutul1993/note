class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
	before_action :authenticate_user!

	def index
		@notes = Note.all
	end

	def show
	end

	def new
		@note = current_user.notes.build
	end

	def publish
		@note = Note.find(params[:id])
		@note.update(published: true)
		redirect_to notes_path
	end

	def unpublish
		@note = Note.find(params[:id])
		@note.update(published: false)
		redirect_to notes_path
	end

	def create
		@note = current_user.notes.build(note_params)

		if @note.save
			redirect_to notes_path
		else
			render 'new'
		end
	end

	def edit
	end


	def update
		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	private

	def find_note
		@note = Note.find(params[:id])
	end

	def note_params
		params.require(:note).permit(:title, :content)
	end
end
