#include <stddef.h>
#include "ruby.h"

void say(char *cmsg, char *voice);
void available_voices(void (*func)(void *, char *), void *data);

static VALUE rb_macsay_say(int argc, VALUE *argv, VALUE self) {
  VALUE msg, voice;
  char *cmsg, *cvoice;

  rb_scan_args(argc, argv, "11", &msg, &voice);

  Check_Type(msg, T_STRING);
  cmsg = StringValuePtr(msg);

  if (NIL_P(voice)) {
    cvoice = NULL;
  } else {
    Check_Type(voice, T_STRING);
    cvoice = StringValuePtr(voice);
  }

  if (RSTRING_LEN(msg) < 1) {
    return Qnil;
  }

  say(cmsg, cvoice);

  return Qnil;
}

void rb_macsay_available_voices0(void *data, char *cvoice) {
  VALUE voices, voice;

  voices = (VALUE) data;
  voice = rb_str_new2(cvoice);
  rb_ary_push(voices, voice);
}

static VALUE rb_macsay_available_voices(VALUE self) {
  VALUE voices;

  voices = rb_ary_new();

  available_voices(rb_macsay_available_voices0, (void *) voices);

  return voices;
}

void Init_macsay() {
  VALUE rb_mMacSay;

  rb_mMacSay = rb_define_module("MacSay");

  rb_define_module_function(rb_mMacSay, "say", rb_macsay_say, -1);
  rb_define_module_function(rb_mMacSay, "available_voices", rb_macsay_available_voices, 0);
}
