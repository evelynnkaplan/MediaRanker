require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "must be valid" do
    value(work).must_be :valid?
  end

  describe "categories" do
    it "must return a list of categories" do
      categories = Work.categories

      expect(categories).must_include("album")
      expect(categories).must_include("book")
      expect(categories).must_include("movie")
    end
  end
end
