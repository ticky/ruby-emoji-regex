module EmojiRegex
  # Matches characters which are emoji, as defined by the Unicode standard's `emoji-test` data file, https://unicode.org/Public/emoji/14.0/emoji-test.txt
  #
  # "#️⃣" (U+0023,U+FE0F,U+20E3) is matched, but not "#️" (U+0023,U+FE0F) or "#" (U+0023).
  Regex = /% emojiRegex %/
end
