require "spec_helper"

RSpec.describe EmojiRegex do
  describe "README.md doctest" do
    let(:readme_file) { File.open(File.expand_path('../../README.md', File.dirname(__FILE__))) }
    let(:readme_file_path) { readme_file.path }
    let(:readme_file_text) { readme_file.read }

    let(:ruby_source_match) { /^\`\`\`ruby\n(?<ruby_source>[^\`]+)\`\`\`$/.match readme_file_text }
    let(:ruby_source_lineno) { readme_file_text.slice(0, ruby_source_match.offset(:ruby_source).first).lines.count + 1 }
    let(:ruby_source) { ruby_source_match[:ruby_source] }

    let(:expected_output_match) { /^\`\`\`text\n(?<expected_output>[^\`]+)\`\`\`$/.match readme_file_text }
    let(:expected_output) { expected_output_match[:expected_output] }
    let(:expected_output_lines) { expected_output.strip.lines.count }

    it "outputs the expected text to stdout" do
      expect{ eval(ruby_source, nil, readme_file_path, ruby_source_lineno) }.to output(expected_output).to_stdout
    end
  end

  describe '::Regex' do
    let(:subject) { EmojiRegex::Regex }

    it "matches ⌚️ watch (default emoji presentation character (Emoji_Presentation))" do
      expect("\u{231A}".scan(subject)).to eql(["\u{231A}"])
    end

    it "matches ↔️ left-right arrow (default text presentation character rendered as emoji)" do
      expect("\u{2194}\u{FE0F}".scan(subject)).to eql(["\u{2194}\u{FE0F}"])
    end

    it "matches 👩 woman (emoji modifier base (Emoji_Modifier_Base))" do
      expect("\u{1F469}".scan(subject)).to eql(["\u{1F469}"])
    end

    it "matches 👩🏿 woman: dark skin tone (emoji modifier base followed by a modifier)" do
      expect("\u{1F469}\u{1F3FF}".scan(subject)).to eql(["\u{1F469}\u{1F3FF}"])
    end

    it "matches 👩🏾‍✈️🏿 woman pilot: medium-dark skin tone (emoji modifier base followed by a modifier, with ZWJ sequence and default text representation character)" do
      expect("\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}".scan(subject)).to eql(["\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}"])
    end

    it "matches 🧏🏻‍♀️ deaf woman: light skin tone (emoji modifier bae followed by a modifier and gender ZWJ sequence)" do
      expect("\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}".scan(subject)).to eql(["\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}"])
    end

    it "matches 🪴 potted plant" do
      expect("\u{1FAB4}".scan(subject)).to eql(["\u{1FAB4}"])
    end

    it "matches 🤌🏼 pinched fingers: medium-light skin tone (emoji modifier base followed by a modifier)" do
      expect("\u{1F90C}\u{1F3FC}".scan(subject)).to eql(["\u{1F90C}\u{1F3FC}"])
    end

    it "matches 💏🏿 couple kissing: dark skin tone (emoji 13.1 sequence)" do
      expect("\u{1F48F}\u{1F3FF}".scan(subject)).to eql(["\u{1F48F}\u{1F3FF}"])
    end

    it "doesn't match # (default text presentation character)" do
      expect("#".scan(subject)).to eql([])
    end

    it "doesn't match #️ (default text presentation character with emoji variation selector)" do
      expect("#\u{FE0F}".scan(subject)).to eql([])
    end

    it "matches #️⃣ (default text presentation character with emoji variation selector and combining enclosing keycap)" do
      expect("#\u{FE0F}\u{20E3}".scan(subject)).to eql(["#\u{FE0F}\u{20E3}"])
    end

    it "doesn't match non-emojis" do
      expect("abc".scan(subject)).to eql([])
    end
  end
end
