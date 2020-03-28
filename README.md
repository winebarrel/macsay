# MacSay

## Description

Simple Ruby bindings for NSSpeechSynthesizer.

## Example

```ruby
require 'macsay'

voices = MacSay.available_voices
voice = voices.sort_by { rand }.first

# ゆっくりしていってね！！！
MacSay.say('yukkuri shite itte ne!!!', voice)

# ゆっくりしね！！！
MacSay.say('yukkuri shine!!!')
```
