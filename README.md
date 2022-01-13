# Ruby Emoji Regex 💎

[![Gem Version](https://badge.fury.io/rb/emoji_regex.svg)](https://rubygems.org/gems/emoji_regex) [![Node & Ruby CI](https://github.com/ticky/ruby-emoji-regex/workflows/Node%20&%20Ruby%20CI/badge.svg)](https://github.com/ticky/ruby-emoji-regex/actions?query=workflow%3A%22Node+%26+Ruby+CI%22)

A Ruby regular expression for matching Unicode Emoji symbols.

## Background

This is based upon the fantastic work from [Mathias Bynens'](https://mathiasbynens.be/) [`emoji-test-regex-pattern`](https://github.com/mathiasbynens/emoji-test-regex-pattern) package. `emoji-test-regex-pattern` is cleverly assembled based upon data from the Unicode Consortium.

The regular expressions provided herein are derived from that package.

## Installation

```shell
gem install emoji_regex
```

## Usage

`emoji_regex` provides the `EmojiRegex::Regex` regular expression, which matches emoji, as defined by [the Unicode standard's `emoji-test` data file](https://unicode.org/Public/emoji/14.0/emoji-test.txt).

### Example

```ruby
require 'emoji_regex'

text = <<TEXT
\u{231A}: ⌚ default Emoji presentation character (Emoji_Presentation)
\u{2194}\u{FE0F}: ↔️ default text presentation character with Emoji variation selector
\u{1F469}: 👩 Emoji modifier base (Emoji_Modifier_Base)
\u{1F469}\u{1F3FF}: 👩🏿 Emoji modifier base followed by a modifier
TEXT

text.scan EmojiRegex::Regex do |emoji|
  puts "Matched sequence #{emoji} — code points: #{emoji.length}"
end

```

Console output:

```text
Matched sequence ⌚ — code points: 1
Matched sequence ⌚ — code points: 1
Matched sequence ↔️ — code points: 2
Matched sequence ↔️ — code points: 2
Matched sequence 👩 — code points: 1
Matched sequence 👩 — code points: 1
Matched sequence 👩🏿 — code points: 2
Matched sequence 👩🏿 — code points: 2
```

_**Note**: The above code and output are verified as part of the spec suite._

## Development

### Requirements

* Ruby
* [Node](https://nodejs.org) (v6 or newer)
* [Yarn](https://yarnpkg.com)

### Initial setup

To install all the Ruby and Javascript dependencies, you can run:

```bash
bin/setup
```

To update the Ruby source files based on the `emoji-regex` library:

```bash
bundle exec rake regenerate
```

### Specs

A spec suite is provided, which can be run as:

```bash
bundle exec rake spec
```

### Versioning Policy

Since [Version 14.0.0](https://github.com/ticky/ruby-emoji-regex/releases/tag/v14.0.0), Ruby Emoji Regex's versions have followed that of the Unicode standard itself.

Ruby Emoji Regex is based upon the [`emoji-test-regex-pattern`](https://github.com/mathiasbynens/emoji-test-regex-pattern) package.

- If a patch revision of `emoji-test-regex-pattern` is released, and if its changes affect the Ruby port meaningfully, a version will be released with the same or greater patch version.
- If a change is required to correct a bug specific to the Ruby port, the patch number will be incremented.

### Ruby Compatibility Policy

While Ruby Emoji Regex uses features which should function on any Ruby version, it is explicitly intended to work on [MRI Ruby versions which are currently within normal maintenance according to the Ruby team](https://www.ruby-lang.org/en/downloads/branches/).

### Creating a release

1. Update the version in [emoji_regex.gemspec](emoji_regex.gemspec)
1. `rake release`
