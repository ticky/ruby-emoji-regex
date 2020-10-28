module EmojiRegex
  # Matches emoji which are recommended for general interchange, as defined by the `RGI_Emoji` property in the Unicode standard.
  #
  # "#️⃣" (U+0023,U+FE0F,U+20E3) is matched, but not "#️" (U+0023,U+FE0F) or "#" (U+0023).
  RGIEmoji = /% emojiRegexRGI %/

  # Matches emoji which present as emoji by default, and those which present as emoji when combined with `U+FE0F VARIATION SELECTOR-16`.
  #
  # "#️⃣" (U+0023,U+FE0F,U+20E3) and "#️" (U+0023,U+FE0F) are matched, but not "#" (U+0023).
  #
  # @deprecated Please use {RGIEmoji} instead. RGIEmoji will replace Regex in a future major release.
  Regex = /% emojiRegex %/
  deprecate_constant :Regex

  # Matches emoji which present as text by default (regardless of variation selector), as well as those which present as emoji by default.
  #
  # All of "#" (U+0023), "#️" (U+0023,U+FE0F) and "#️⃣" (U+0023,U+FE0F,U+20E3) are matched.
  Text = /% emojiRegexText %/
end
