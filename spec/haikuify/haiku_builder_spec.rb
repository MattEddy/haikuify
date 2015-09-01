require "spec_helper"

module Haikuify
  describe HaikuBuilder do
    describe "#build" do
      it "returns a complete haiku if called with the correct components" do
        instance = described_class.new([
          "I wake reluctant",
          "Too cold to get out of bed",
          "But I need to pee"
        ])
        expect(instance.next_haiku.complete?).to be_truthy
      end

      it "returns false if not called with enough input potential input" do
        instance = described_class.new([
          "I wake reluctant",
          "Too cold to get out of bed"
        ])
        expect(instance.next_haiku).to be_falsey
      end

      it "will not build a haiku without proper data" do
        instance = described_class.new([
          "I wake reluctant",
          "Too cold to get out of bed",
          "But I need to pee pee"
        ])
        expect(instance.next_haiku).to be_falsey
      end

      it "will build multiple haikus if called more than once" do
        instance = described_class.new([
          "I wake reluctant",
          "Too cold to get out of bed",
          "But I need to pee",
          "I wake reluctant",
          "Too cold to get out of bed",
          "But I need to bee"
        ])
        instance.next_haiku
        expect(instance.next_haiku.content[2]).to eq "But I need to bee"
      end
    end
  end
end
