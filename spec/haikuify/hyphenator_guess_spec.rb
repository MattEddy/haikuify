require "spec_helper"

module Haikuify
  describe HyphenatorGuess do
    describe "#count_syllables" do
      let(:instance) { described_class.new }

      it "guesses the number of syllables for a given word" do
        expect(instance.count_syllables('aardvark')).to eq 2
      end

      it "can guess 1 syllable words" do
        expect(instance.count_syllables('the')).to eq 1
      end
    end
  end
end
