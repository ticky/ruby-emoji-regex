module EmojiRegex
  # Matches emoji which are recommended for general interchange, as defined by the `RGI_Emoji` property in the Unicode standard.
  #
  # "#️⃣" (U+0023,U+FE0F,U+20E3) is matched, but not "#️" (U+0023,U+FE0F) or "#" (U+0023).
  Regex = /% emojiRegex %/
end
