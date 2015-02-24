require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

RSpec.describe Post, :type => :model do
  context "trying to make 2 posts within a minute" do
    it "should raise an error" do
      DatabaseCleaner.clean
      # Create a user
      user = User.create!(:email => "foo@bar.com", :password => "foobarfoobar")
      # Create one post
      user.posts.create!(:title => "foobar", :url => "http://foobar.com")
      # Create another post immediately after (which is within 1 minute)
      expect {
        user.posts.create!(:title => "foobar", :url => "http://foobar.com")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "trying to make more than 20 posts" do
    it "should raise an error" do
      DatabaseCleaner.clean
      user = User.create!(:email => "foo2@bar.com", :password => "foobarfoobar")

      range = (1..20).to_a
      time = Time.now

      range.each do |f|
        user.posts.create!(:title => "foobar#{f}", :url => "http://foobar.com", :created_at => Time.now - f * 2.minutes)
      end

      expect{
        user.posts.create!(:title => "foobar", :url => "http://foobar2.com")}.to raise_error(ActiveRecord::RecordInvalid)

    end
  end
end
