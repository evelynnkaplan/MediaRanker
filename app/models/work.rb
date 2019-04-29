class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.categories
    return ["album", "book", "movie"]
  end

  def self.highlight
    works = Work.all
    works.max_by { |work| work.votes.count }
  end

  def self.top_works(category)
    all_works = Work.where(category: category)
    unless all_works == []
      return all_works.max_by(5) { |work| work.votes.count }
    end
  end

  def add_vote(vote)
    new_vote = Vote.find_by(id: vote.id)
    self.votes << new_vote
  end
end
