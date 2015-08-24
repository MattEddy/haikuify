require "spec_helper"

module Haikuify
  describe Dictionary do
    describe "#count_syllables" do
      let(:instance) { described_class.new }

      it "should return the number of syllables when passed a word" do
        expect(instance.count_syllables("aardvark")).to eq 2
      end
    end
  end
end
