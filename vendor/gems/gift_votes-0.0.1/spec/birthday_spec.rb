require 'spec_helper'

describe GiftVotes::Birthday do

  subject { described_class.new }

  context "date attribute" do
    let(:date) { Date.new(2014, 1, 31) }

    before do
      subject.date = date
    end

    it "has a date attribute" do
      expect(subject.date).to eq(date)
    end
  end

end
