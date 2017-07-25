module EmojiRegex
  # Matches emoji which present as emoji by default, and those which present as emoji when combined with `U+FE0F VARIATION SELECTOR-16`.
  #
  # "↔️" (U+2194,U+FE0F) is matched, but not "↔" (U+2194).
  Regex = /% emojiRegex %/

  # Matches emoji which present as text by default (regardless of variation selector), as well as those which present as emoji by default.
  #
  # Both "↔" (U+2194) and "↔️" (U+2194,U+FE0F) are matched.
  Text = /% emojiRegexText %/
end
