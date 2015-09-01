module Haikuify
  class HaikuBuilder
    require "haikuify/haiku"

    attr_reader :haiku

    def initialize(iterable)
      @iterable         = iterable
      @syllable_counter = SyllableCounter.new
    end

    def next_haiku
      @haiku = Haiku.new

      iterable.each_with_index do |line, i|
        @line = line
        attempt_to_add_line

        if haiku.complete?
          @iterable = iterable.drop(i)
          return haiku
        end
      end

      false
    end

    private

    attr_reader :syllable_counter, :line, :iterable

    def attempt_to_add_line
      if (haiku.empty? || haiku.has_two_stanzas?)
        haiku.add_stanza(line) if syllable_count_is?(5)
      else
        haiku.add_stanza(line) if syllable_count_is?(7)
      end
    end

    def syllable_count_is?(number)
      count_line == number
    end

    def count_line
      line.split.inject(0) do |sum, word|
        sum + syllable_counter.count(word)
      end
    end
  end
end
