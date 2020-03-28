#include <unistd.h>
#import <Cocoa/Cocoa.h>

#define WAIT 100000 // µs

void say(char *cmsg, char *cvoice) {
  NSAutoreleasePool *pool;
  NSSpeechSynthesizer* speech;
  NSString *voice, *msg;

  pool = [[NSAutoreleasePool alloc] init];

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

  [pool release];
}

void available_voices(void (*func)(void *, const char *), void *data) {
  NSAutoreleasePool *pool;
  NSArray *voices;
  NSEnumerator *itor;
  NSString *voice;

  pool = [[NSAutoreleasePool alloc] init];

  voices = [NSSpeechSynthesizer availableVoices];
  itor = [voices objectEnumerator];

  while (voice = [itor nextObject]) {
    const char *cvoice = [voice UTF8String];
    func(data, cvoice);
  }

  [pool release];
}

