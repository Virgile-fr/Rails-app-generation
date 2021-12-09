class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @names = []
    @movies.each { |m|
    @names << m.title
  }
  @names_list = []
  @lists = List.all
  @lists.each { |l|
  @names_list << l.name
  }
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie_id = Movie.find_by(title: bookmark_params[:movie_id])
    @bookmark.list_id = List.find_by(name: bookmark_params[:list_id])
    @bookmark.save
    if @bookmark.save
    redirect_to lists_path
    else
      render 'new'
    end
  end


private

  def bookmark_params
  params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
