# frozen_string_literal: true

RSpec.describe MacSay do
  specify do
    expect(MacSay.available_voices).not_to be_empty
  end

  specify do
    expect(MacSay.say('yukkuri shine!!!')).to be_nil
  end
end
