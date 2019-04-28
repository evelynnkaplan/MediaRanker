class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.categories
    return ["album", "book", "movie"]
  end

  def self.highlight
    works = Work.all
    return works.sample
  end

  def self.top_movies
    top_movies_list = []
    all_movies = Work.where(category: "movie")
    unless all_movies == []
      5.times do
        movie = all_movies.sample
        if !top_movies_list.include?(movie)
          top_movies_list << movie
        end
      end
    end
    return top_movies_list
  end

  def self.top_books
    top_books_list = []
    all_books = Work.where(category: "book")
    unless all_books == []
      5.times do
        book = all_books.sample
        if !top_books_list.include?(book)
          top_books_list << book
        end
      end
    end
    return top_books_list
  end

  def self.top_albums
    top_albums_list = []
    all_albums = Work.where(category: "album")
    unless all_albums == []
      5.times do
        album = all_albums.sample
        if !top_albums_list.include?(album)
          top_albums_list << album
        end
      end
    end
    return top_albums_list
  end

  def add_vote(vote)
    new_vote = Vote.find_by(id: vote.id)
    self.votes << new_vote
  end
end
