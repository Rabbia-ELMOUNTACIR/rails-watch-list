class BookmarksController < ApplicationController

# def index
#   @bookmarks = bookmark.all
# end

# def show; end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = bookmark.new(bookmark_params)
    if @bookmark.save!
      redirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit; end

  # def update
  #   @bookmark.update
  #   redirect_to bookmark_path(@bookmarkt)
  # end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_bookmark
    @bookmark = bookmark.find(params[:id])
  end
end
end
