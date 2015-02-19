require 'rails_helper'

RSpec.describe IncomingController, :type => :controller do

  it "#create" do

    params = {
      "sender"=>"tbyrn687@gmail.com",
      "subject"=>"sports",
      "stripped-text"=>"http://mlb.com" }

    expect {
      post :create, params
    }.to change(Bookmark, :count).by(1)
  end
end
