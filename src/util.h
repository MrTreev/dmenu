#include <stddef.h>

/* macros */
#define MAX(A, B)                ((A) > (B) ? (A) : (B))
#define MIN(A, B)                ((A) < (B) ? (A) : (B))
#define BETWEEN(X, A, B)         ((A) <= (X) && (X) <= (B))
#define INTERSECT(x, y, w, h, r) (MAX(0, MIN((x) + (w), (r).x_org + (r).width) - MAX((x), (r).x_org)) && MAX(0, MIN((y) + (h), (r).y_org + (r).height) - MAX((y), (r).y_org)))
#define LENGTH(X)                (sizeof X / sizeof X[0])
#define TEXTW(X)                 (drw_fontset_getwidth(drw, (X)) + lrpad)

/* Define Opaqueness */
#define OPAQUE                   0xFFU

/* enums */
enum { SchemeNorm, SchemeSel, SchemeOut, SchemeLast }; /* color schemes */

void  die(const char *fmt, ...);
void *ecalloc(size_t nmemb, size_t size);
