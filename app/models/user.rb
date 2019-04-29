class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  def add_vote(vote)
    new_vote = Vote.find_by(id: vote.id)
    self.votes << new_vote
  end

  def already_voted?(work)
    return self.works.include?(work)
  end
end
