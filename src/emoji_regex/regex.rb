module EmojiRegex
  # Matches emoji which present as emoji by default, and those which present as emoji when combined with `U+FE0F VARIATION SELECTOR-16`.
  #
  # "#️⃣" (U+0023,U+FE0F,U+20E3) and "#️" (U+0023,U+FE0F) are matched, but not "#" (U+0023).
  #
  # @deprecated Please use {RGIEmoji} instead. RGIEmoji will replace Regex in a future major release.
  Regex = /% emojiRegex %/
  deprecate_constant :Regex
end
