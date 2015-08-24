module Haikuify
  class Haiku
    def initialize
      @content = []
    end

    def add_stanza(stanza)
      content.push(stanza)
    end

    def empty?
      content.empty?
    end

    def has_one_stanza?
      content.length == 1
    end

    def has_two_stanzas?
      content.length == 2
    end

    def complete?
      if content.length == 3
        true
      end
    end

    def to_s
      content.join("\n")
    end

    private

    attr_reader :content
  end
end
