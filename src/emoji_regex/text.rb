module EmojiRegex
  # Matches emoji which present as text by default (regardless of variation selector), as well as those which present as emoji by default.
  #
  # All of "#" (U+0023), "#️" (U+0023,U+FE0F) and "#️⃣" (U+0023,U+FE0F,U+20E3) are matched.
  Text = /% emojiRegexText %/
end
