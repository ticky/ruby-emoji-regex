# Ruby Emoji Regex 💎

[![Gem Version](https://badge.fury.io/rb/emoji_regex.svg)](https://badge.fury.io/rb/emoji_regex)

A pair of Ruby regular expressions for matching Unicode Emoji symbols.

## Background

This is based upon the fantastic work from [Mathias Bynens'](https://mathiasbynens.be/) [`emoji-regex`](https://github.com/mathiasbynens/emoji-regex) Javascript package. `emoji-regex` is cleverly assembled based upon data from the Unicode Consortium.

The regular expression provided herein is converted from that pacakge.

## Installation

```shell
gem install emoji_regex
```

## Usage

```ruby
require 'emoji_regex'

text = <<TEXT
\u{231A}: ⌚️ default emoji presentation character (Emoji_Presentation)
\u{2194}\u{FE0F}: ↔️ default text presentation character rendered as emoji
\u{1F469}: 👩 emoji modifier base (Emoji_Modifier_Base)
\u{1F469}\u{1F3FF}: 👩🏿 emoji modifier base followed by a modifier
TEXT

text.scan EmojiRegex::Regex do |emoji|
  puts "Matched sequence #{emoji} — code points: #{emoji.length}"
end
```

Console output:

```
Matched sequence ⌚ — code points: 1
Matched sequence ⌚ — code points: 1
Matched sequence ↔️ — code points: 2
Matched sequence ↔️ — code points: 2
Matched sequence 👩 — code points: 1
Matched sequence 👩 — code points: 1
Matched sequence 👩🏿 — code points: 2
Matched sequence 👩🏿 — code points: 2
```

Emoji symbols which aren't emoji by default can also be matched by the other regex provided:

```ruby
EmojiRegex::Text
```

## Development

Requirements:

* Ruby
* [Node](https://nodejs.org) (v6 or newer)
* [Yarn](https://yarnpkg.com)

Initial setup:

```bash
bin/setup
```

Updating the Ruby source files with the latest `emoji-regex` Node library regexp patterns:

```bash
rake regenerate
```

Running the specs:

```bash
rake spec
```

## Creating a release

1. Update the version in [emoji_regex.gemspec](emoji_regex.gemspec)
1. `rake release`
