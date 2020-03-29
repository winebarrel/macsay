#include <unistd.h>
#import <AppKit/AppKit.h>

#define WAIT 100000 // µs

void say(char *cmsg, char *cvoice) {
  @autoreleasepool {
    NSSpeechSynthesizer* speech;
    NSString *voice, *msg;

    msg = [NSString stringWithCString: cmsg encoding:NSUTF8StringEncoding];

    if (cvoice) {
      voice = [NSString stringWithCString: cvoice encoding:NSUTF8StringEncoding];
    } else {
      voice = [NSSpeechSynthesizer defaultVoice];
    }

    speech = [[NSSpeechSynthesizer alloc] initWithVoice:voice];

    [speech startSpeakingString: msg];

    while ([speech isSpeaking]) {
      usleep(WAIT);
    }
  }
}

void available_voices(void (*func)(void *, const char *), void *data) {
  @autoreleasepool {
    NSArray *voices;
    NSEnumerator *itor;
    NSString *voice;

    voices = [NSSpeechSynthesizer availableVoices];
    itor = [voices objectEnumerator];

    while (voice = [itor nextObject]) {
      const char *cvoice = [voice UTF8String];
      func(data, cvoice);
    }
  }
}

