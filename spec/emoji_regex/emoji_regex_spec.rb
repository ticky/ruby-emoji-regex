require "spec_helper"

RSpec.describe EmojiRegex do
  describe "::Regex" do
    it "matches ⌚️ default emoji presentation character (Emoji_Presentation)" do
      expect("\u{231A}".scan(EmojiRegex::Regex)).to eql(["\u{231A}"])
    end

    it "matches ↔️ default text presentation character rendered as emoji" do
      expect("\u{2194}\u{FE0F}".scan(EmojiRegex::Regex)).to eql(["\u{2194}\u{FE0F}"])
    end

    it "matches 👩 emoji modifier base (Emoji_Modifier_Base)" do
      expect("\u{1F469}".scan(EmojiRegex::Regex)).to eql(["\u{1F469}"])
    end

    it "matches 👩🏿 emoji modifier base followed by a modifier" do
      expect("\u{1F469}\u{1F3FF}".scan(EmojiRegex::Regex)).to eql(["\u{1F469}\u{1F3FF}"])
    end

    it "doesn't match non-emojis" do
      expect("abc".scan(EmojiRegex::Regex)).to eql([])
    end
  end

  describe '::Text' do
    it "matches ⌚️ default emoji presentation character (Emoji_Presentation)" do
      expect("\u{231A}".scan(EmojiRegex::Text)).to eql(["\u{231A}"])
    end

    it "matches ↔ default text representation character" do
      expect("\u{2194}".scan(EmojiRegex::Text)).to eql(["\u{2194}"])
    end

    it "matches ↔️ default text presentation character rendered as emoji" do
      expect("\u{2194}\u{FE0F}".scan(EmojiRegex::Text)).to eql(["\u{2194}\u{FE0F}"])
    end

    it "matches 👩 emoji modifier base (Emoji_Modifier_Base)" do
      expect("\u{1F469}".scan(EmojiRegex::Text)).to eql(["\u{1F469}"])
    end

    it "matches 👩🏿 emoji modifier base followed by a modifier" do
      expect("\u{1F469}\u{1F3FF}".scan(EmojiRegex::Text)).to eql(["\u{1F469}\u{1F3FF}"])
    end

    it "doesn't match non-emojis" do
      expect("abc".scan(EmojiRegex::Text)).to eql([])
    end
  end
end
