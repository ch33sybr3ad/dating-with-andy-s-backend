require 'rails_helper'

RSpec.describe Interest, type: :model do
    describe Interest do
        it "should create a interest with appropriate attributes" do
            expect{ Interest.create(name: "hiking") }.to change{ Interest.count }.by(1)
        end

        it "should raise an error when created without a name" do
            expect{ Interest.create! }.to raise_error(ActiveRecord::RecordInvalid)
        end
    end
end
