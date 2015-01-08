require 'spec_helper'

describe GiftVotes::Plan do

  let(:idea_class) { Struct.new(:product, :price) }

  context "state" do
    it "has initial state :pending" do
      expect(subject.current_state).to eq(:pending)
    end
  end

  context "allows adding of gift ideas" do
    let(:idea) { idea_class.new('iPhone 4S', 160.0) }

    before do
      subject.add_gift_idea(idea)
    end

    it "has state pending" do
      expect(subject.current_state).to eq(:pending)
    end

    context "has enough in the budget" do
      it "is a success" do
        subject.pledge(176.0)
        expect(subject.current_state).to eq(:success)
      end
    end

    context "not enough pledges" do
      it "is pending" do
        subject.pledge(20.0)
        subject.pledge(50.0)
        expect(subject.current_state).to eq(:pending)
      end
    end
  end

end
