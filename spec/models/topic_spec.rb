require 'rails_helper'

RSpec.describe Topic, :type => :model do

  it "is valid with a title" do
    topic = Topic.new(
      title: 'Sports'
      )
    expect(topic).to be_valid
  end

  # it "is invalid without a title" do
  #   topic = Topic.new(title: nil)
  #   topic.valid?
  #   expect(topic.errors[:title]).to include("can't be blank")
  # end
  it "belongs to a user" do
    topic = Topic.new
    user = User.new
    user.topics << topic
    expect(topic.user).to be user
  end

  it "can only be deleted by user who created or admin"
end
