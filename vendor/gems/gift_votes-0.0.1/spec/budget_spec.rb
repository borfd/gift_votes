require 'spec_helper'

describe GiftVotes::Budget do

  subject(:subject) { described_class.new }

  context "pledge count" do
    let(:pledges) { [15.0, 23.0, 1.2]}
    before { pledges.map {|amount| subject.pledge(amount)} }

    it "counts amount" do
      expect(subject.amount).to eq(pledges.reduce(:+))
    end
  end

  context "no pledges" do
    it "has amount of 0" do
      expect(subject.amount).to eq(0)
    end
  end

end
