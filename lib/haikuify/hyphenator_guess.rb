require 'text/hyphen'

module Haikuify
  class HyphenatorGuess
    def initialize
      @hyphenator = Text::Hyphen.new(:language => "en_us", :left => 0, :right => 0)
    end

    def count_syllables(word)
      if one_syllable_word?(word)
        1
      else
        syllables = hyphenator.visualize(word).split("-")
        syllables.last == "s" ? syllables.count - 1 : syllables.count
      end
    end

    private

    def one_syllable_word? (word)
      hyphenator.hyphenate(word).length == 0
    end

    attr_reader :hyphenator
  end
end
