require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all) { User.delete_all }
    describe User do
        let(:keith) { User.create!(username: "keith", email: "keith@example.com", password: "123456", age: 27, bio: "I LOVE ANDY'S BACKEND!") }

        context "valid" do
            it "should successfully create a user" do
                expect{ User.create!(
                    username: "Andy",
                    email: "andy@example.com",
                    password: "123456",
                    age: 24,
                    bio: "I LOVE MY BACKEND!"
                ) }.to change{ User.count }.by(1)
            end
        end

        context "invalid" do
            it "should not create a user with a empty username" do
                expect{ User.create!(
                    email: "andy@example.com",
                    password: "123456",
                    age: 24,
                    bio: "I LOVE MY BACKEND!"
                ) }.to raise_error(ActiveRecord::RecordInvalid)
            end
            
            it "should not create a user with a empty password" do
                expect{ User.create!(
                    username: "Andy",
                    email: "andy@example.com",
                    age: 24,
                    bio: "I LOVE MY BACKEND!"
                ) }.to raise_error(ActiveRecord::RecordInvalid)
            end

            it "should not create a user if the password is too short" do
                expect{ User.create!(
                    username: "Andy",
                    email: "andy@example.com",
                    password: "12345",
                    age: 24,
                    bio: "I LOVE MY BACKEND"
                ) }.to raise_error(ActiveRecord::RecordInvalid)
            end

            it "should not create a user with a empty age" do
                expect{ User.create!(
                    username: "Andy",
                    email: "andy@example.com",
                    password: "123456",
                    bio: "I LOVE MY BACKEND!"
                ) }.to raise_error(ActiveRecord::RecordInvalid)
            end

            it "should not create a user with a duplicate username" do
                 expect{ User.create!(
                    username: "keith",
                    email: "abcd@example.com",
                    password: "123456",
                    bio: "I LOVE ANDY'S BACKEND!"
                ) }.to raise_error(ActiveRecord::RecordInvalid)
            end

            it "should not create a user with a duplicate email" do
                 expect{ User.create!(
                    username: "keith2",
                    email: "keith@example.com",
                    password: "123456",
                    bio: "I LOVE ANDY'S BACKEND!"
                ) }.to raise_error(ActiveRecord::RecordInvalid)
            end

        end
    end

end
