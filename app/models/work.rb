class Work < ApplicationRecord
  def self.top_movies
    top_movies_list = []
    all_movies = Work.where(category: "movie")
    while top_movies_list.length < 5
      movie = all_movies.sample
      if !top_movies_list.include?(movie)
        top_movies_list << movie
      end
    end
    return top_movies_list
  end

  def self.top_books
    top_books_list = []
    all_books = Work.where(category: "book")
    while top_books_list.length < 5
      book = all_books.sample
      if !top_books_list.include?(book)
        top_books_list << book
      end
    end
    return top_books_list
  end

  def self.top_albums
    top_albums_list = []
    all_albums = Work.where(category: "album")
    while top_albums_list.length < 5
      album = all_albums.sample
      if !top_albums_list.include?(album)
        top_albums_list << album
      end
    end
    return top_albums_list
  end

end
