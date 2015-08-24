module Haikuify
  class HaikuBuilder
    require "haikuify/haiku"

    attr_reader :haiku

    def initialize
      @syllable_counter = SyllableCounter.new
      @haiku            = Haiku.new
    end

    def build(line)
      @line = line
      return haiku if haiku.complete?

      if (haiku.empty? || haiku.has_two_stanzas?)
        haiku.add_stanza(line) if syllable_count_is?(5)
      else
        haiku.add_stanza(line) if syllable_count_is?(7)
      end

      haiku
    end

    def syllable_count_is?(number)
      count_line == number
    end

    def count_line
      line.split.inject(0) do |sum, word|
        sum + syllable_counter.count(word)
      end
    end

    private

    attr_reader :syllable_counter, :line
  end
end
