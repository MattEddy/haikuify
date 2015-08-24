require "spec_helper"

module Haikuify
  describe SyllableCounter do
    describe "#count" do
      it "should use the first strategy that works" do
        strategies = [double(count_syllables: nil), double(count_syllables: 10)]
        stub_const("Haikuify::SyllableCounter::COUNTING_STRATEGIES", strategies)

        expect(described_class.new.count("word")).to eq 10
      end
    end
  end
end
