# MacSay

[![Gem Version](https://badge.fury.io/rb/macsay.svg)](https://badge.fury.io/rb/macsay)
[![Build Status](https://travis-ci.org/winebarrel/macsay.svg?branch=master)](https://travis-ci.org/winebarrel/macsay)

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
