require "spec_helper"

module Haikuify
  describe Haiku do
    let(:instance) { described_class.new }

    describe "#add_stanza" do
      it "adds a stanza to the haiku" do
        instance.add_stanza("cats are great")
        expect(instance.to_s).to eq "cats are great"
      end
    end

    describe "#empty?" do
      it "returns true if the content is empty" do
        expect(instance.empty?).to be_truthy
      end

      it "returns false if the content is not empty" do
        add_one_stanza(instance)
        expect(instance.empty?).to be_falsey
      end
    end

    describe "#has_one_stanza?" do
      it "returns false if content has less than one" do
        expect(instance.has_one_stanza?).to be_falsey
      end

      it "returns true if content has one stanza" do
        add_one_stanza(instance)
        expect(instance.has_one_stanza?).to be_truthy
      end

      it "returns false if content has more than one" do
        add_two_stanzas(instance)
        expect(instance.has_one_stanza?).to be_falsey
      end
    end

    describe "#has_two_stanzas?" do
      it "returns false if content has more less than two" do
        add_one_stanza(instance)
        expect(instance.has_two_stanzas?).to be_falsey
      end

      it "returns true if content has two stanzas" do
        add_two_stanzas(instance)
        expect(instance.has_two_stanzas?).to be_truthy
      end

      it "returns false if content has more than one" do
        add_three_stanzas(instance)
        expect(instance.has_two_stanzas?).to be_falsey
      end
    end

    describe "#complete?" do
      it "returns false if content has less than three stanzas" do
        add_two_stanzas(instance)
        expect(instance.complete?).to be_falsey
      end

      it "returns true if content has three stanzas" do
        add_three_stanzas(instance)
        expect(instance.complete?).to be_truthy
      end
    end

    def add_one_stanza(instance)
      instance.add_stanza("cats are great")
    end

    def add_two_stanzas(instance)
      instance.add_stanza("cats are great")
      instance.add_stanza("cats are real great")
    end

    def add_three_stanzas(instance)
      instance.add_stanza("cats are great")
      instance.add_stanza("cats are real great")
      instance.add_stanza("cats are rad")
    end
  end
end
