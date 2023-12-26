#include "util.h"

static int                topbar                = 1;
static const unsigned int bgalpha               = 0xe0;
static const unsigned int fgalpha               = OPAQUE;
static const char        *prompt                = NULL;
static const char        *fonts[]               = {"Hack Nerd Font Mono:pixelsize=14:antialias=true:autohint=true"};
static const char        *colors[SchemeLast][2] = {
  /*               fg         bg      */
    [SchemeNorm] = {"#bbbbbb", "#222222"},
    [SchemeSel]  = {"#eeeeee", "#005577"},
    [SchemeOut]  = {"#000000", "#00ffff"},
};
static const unsigned int alphas[SchemeLast][2] = {
    [SchemeNorm] = {fgalpha, bgalpha},
    [SchemeSel]  = {fgalpha, bgalpha},
    [SchemeOut]  = {fgalpha, bgalpha},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines            = 0;
/* Characters not considered part of a word while deleting words for example: " /?\"&[]" */
static const char   worddelimiters[] = " ";
