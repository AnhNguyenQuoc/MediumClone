require 'rails_helper'

RSpec.describe User do
  describe "following and unfollowing other user" do
      let(:luke) { create(:user, username: "Luke Skywalker")}
      let(:solo) { create(:user, username: "Han Solo")}

    it "add relationships between the two users" do
      luke.follow(solo)
      expect(luke.following?(solo)).to be_truthy
      expect(solo.followers).to include(luke)


      luke.unfollow(solo)
      expect(solo.followers).not_to include(luke)
    end
  end
end
