require "spec_helper"

RSpec.describe EmojiRegex do
  describe "::Regex" do
    it "matches ⌚️ watch (default emoji presentation character (Emoji_Presentation))" do
      expect("\u{231A}".scan(EmojiRegex::Regex)).to eql(["\u{231A}"])
    end

    it "matches ↔️ left-right arrow (default text presentation character rendered as emoji)" do
      expect("\u{2194}\u{FE0F}".scan(EmojiRegex::Regex)).to eql(["\u{2194}\u{FE0F}"])
    end

    it "matches 👩 woman (emoji modifier base (Emoji_Modifier_Base))" do
      expect("\u{1F469}".scan(EmojiRegex::Regex)).to eql(["\u{1F469}"])
    end

    it "matches 👩🏿 woman: dark skin tone (emoji modifier base followed by a modifier)" do
      expect("\u{1F469}\u{1F3FF}".scan(EmojiRegex::Regex)).to eql(["\u{1F469}\u{1F3FF}"])
    end

    it "matches 👩🏾‍✈️🏿 woman pilot: medium-dark skin tone (emoji modifier base followed by a modifier, with ZWJ sequence and default text representation character)" do
      expect("\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}".scan(EmojiRegex::Regex)).to eql(["\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}"])
    end

    it "matches 🧏🏻‍♀️ deaf woman: light skin tone (emoji modifier bae followed by a modifier and gender ZWJ sequence)" do
      expect("\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}".scan(EmojiRegex::Regex)).to eql(["\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}"])
    end

    it "matches 🪴 potted plant" do
      expect("\u{1FAB4}".scan(EmojiRegex::Regex)).to eql(["\u{1FAB4}"])
    end

    it "matches 🤌🏼 pinched fingers: medium-light skin tone (emoji modifier base followed by a modifier)" do
      expect("\u{1F90C}\u{1F3FC}".scan(EmojiRegex::Text)).to eql(["\u{1F90C}\u{1F3FC}"])
    end

    it "doesn't match non-emojis" do
      expect("abc".scan(EmojiRegex::Regex)).to eql([])
    end
  end

  describe '::Text' do
    it "matches ⌚️ watch (default emoji presentation character (Emoji_Presentation))" do
      expect("\u{231A}".scan(EmojiRegex::Text)).to eql(["\u{231A}"])
    end

    it "matches ↔ left-right arrow (default text representation character)" do
      expect("\u{2194}".scan(EmojiRegex::Text)).to eql(["\u{2194}"])
    end

    it "matches ↔️ left-right arrow (default text presentation character rendered as emoji)" do
      expect("\u{2194}\u{FE0F}".scan(EmojiRegex::Text)).to eql(["\u{2194}\u{FE0F}"])
    end

    it "matches 👩 woman (emoji modifier base (Emoji_Modifier_Base))" do
      expect("\u{1F469}".scan(EmojiRegex::Text)).to eql(["\u{1F469}"])
    end

    it "matches 👩🏿 woman: dark skin tone (emoji modifier base followed by a modifier)" do
      expect("\u{1F469}\u{1F3FF}".scan(EmojiRegex::Text)).to eql(["\u{1F469}\u{1F3FF}"])
    end

    it "matches 👩🏾‍✈️🏿 woman pilot: medium-dark skin tone (emoji modifier base followed by a modifier, with ZWJ sequence and default text representation character)" do
      expect("\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}".scan(EmojiRegex::Text)).to eql(["\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}"])
    end

    it "matches 🧏🏻‍♀️ deaf woman: light skin tone (emoji modifier bae followed by a modifier and gender ZWJ sequence)" do
      expect("\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}".scan(EmojiRegex::Text)).to eql(["\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}"])
    end

    it "matches 🪴 potted plant" do
      expect("\u{1FAB4}".scan(EmojiRegex::Text)).to eql(["\u{1FAB4}"])
    end

    it "matches 🤌🏼 pinched fingers: medium-light skin tone (emoji modifier base followed by a modifier)" do
      expect("\u{1F90C}\u{1F3FC}".scan(EmojiRegex::Text)).to eql(["\u{1F90C}\u{1F3FC}"])
    end

    it "doesn't match non-emojis" do
      expect("abc".scan(EmojiRegex::Text)).to eql([])
    end
  end
end
