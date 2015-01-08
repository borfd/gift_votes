require 'spec_helper'

describe GiftVotes::Election do

  let(:contender_1) { double.as_null_object }
  let(:contender_2) { double.as_null_object }
  let(:choices) { [contender_1, contender_2] }

  subject { described_class.new(choices: choices) }

  context "1 vote for 1 contender" do
    before { subject.vote(contender_1) }

    it "should save votes for items" do
      expect(subject.winner).to eq(contender_1)
    end
  end

  context "2 votes vs 1 vote" do
    before do
      subject.vote(contender_2)
      subject.vote(contender_2)
      subject.vote(contender_1)
    end

    it "should save votes for items" do
      expect(subject.winner).to eq(contender_2)
    end
  end

  context "1 contender no votes" do
    let(:choices) { [contender_1] }

    it "should be winner" do
      expect(subject.winner).to eq(contender_1)
    end

  end

  context "#add_choice" do
    let(:contender_3) { double.as_null_object }
    before do
      subject.add_choice(contender_3)
    end

    it "has choice in choices" do
      expect(subject.choices).to include(contender_3)
    end

    it "has choice in results" do
      expect(subject.results.last).to eq([contender_3, 0])
    end
  end

  context "price" do
    subject { described_class.new }
    it "has a price" do
      expect(subject.price).to eq(Float::INFINITY)
    end

    context "choice without a price" do
      it "does not crash" do
        subject.add_choice(double(price: nil))
        expect(subject.price).to eq(Float::INFINITY)
      end
    end
  end
end
