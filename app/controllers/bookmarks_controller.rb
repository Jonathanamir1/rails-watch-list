class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save!
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
