const fs = require('fs');
const path = require('path');

const replaceEscapes = (regexFactory) => (
  // request the regex
  regexFactory()
    // convert regex to string so we can replace things
    .toString()
    // replace incompatible single-byte escapes
    .replace(/\\x([a-zA-Z0-9]{2})/g, '\\u00$1')
    // remove incompatible flags
    .slice(0, -2)
);

const emojiRegex = replaceEscapes(require('emoji-regex/unicode'));
const emojiRegexText = replaceEscapes(require('emoji-regex/unicode/text'));

const input = fs.readFileSync(path.join(__dirname, '../src/emoji-regex.rb'), 'utf8');

const output = input
  .replace('/% emojiRegex %/', emojiRegex)
  .replace('/% emojiRegexText %/', emojiRegexText);

fs.writeFileSync(path.join(__dirname, '../lib/emoji-regex.rb'), output);
