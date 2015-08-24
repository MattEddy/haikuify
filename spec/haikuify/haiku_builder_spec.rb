require "spec_helper"

module Haikuify
  describe HaikuBuilder do
    let(:instance) { described_class.new }
    describe "#build" do
      it "returns a complete haiku if called with the correct components" do
        instance.build("I wake reluctant")
        instance.build("Too cold to get out of bed")
        expect(instance.build("But I need to pee").complete?).to be_truthy
      end

      it "returns an incomplete haiku if not called with enough input" do
        instance.build("I wake reluctant")
        expect(instance.build("Too cold to get out of bed").complete?).to be_falsey
      end

      it "returns an incomplete haiku if called with bad input" do
        instance.build("I wake reluctant")
        instance.build("Too cold to get out of bed")
        expect(instance.build("But I need to pee hard").complete?).to be_falsey
      end
    end
  end
end
