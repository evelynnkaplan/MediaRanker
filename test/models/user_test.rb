require "test_helper"

describe User do
  let(:user) { User.new }
  let(:gump) { works(:gump) }

  it "must be valid" do
    value(user).must_be :valid?
  end

  describe "already_voted?" do
    it "returns true if the user has already voted for the work" do
      vote = Vote.create!(user: user, work: gump)

      voted = user.already_voted?(gump)

      expect(voted).must_equal true
    end

    it "returns false if the user has not already voted for the work" do
      voted = user.already_voted?(gump)

      expect(voted).must_equal false
    end
  end

  describe "created_date" do
    it "must return a formatted string of the date" do
      user.save

      expect(user.created_date).must_equal "#{user.created_at.strftime("%B %d, %Y")}"
    end
  end

  describe "voted_date" do
    it "must return a formatted string of the date the user made the vote" do
      vote = Vote.create!(user: user, work: gump)

      expect(user.voted_date(gump)).must_equal "#{vote.created_at.strftime("%B %d, %Y")}"
    end

    it "must return nil if the user did not vote for that work" do
      assert_nil(user.voted_date(gump))
    end
  end
end
