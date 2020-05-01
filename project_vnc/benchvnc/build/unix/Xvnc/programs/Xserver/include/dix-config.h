/* dix-config.h.in: not at all generated.                      -*- c -*- */

#ifndef _DIX_CONFIG_H_
#define _DIX_CONFIG_H_

/* Define to 1 if you have the `cbrt' function. */
#define HAVE_CBRT

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H

/* Define to 1 if you have the `ffs' function. */
#define HAVE_FFS

/* Define to 1 if you have the `getdtablesize' function. */
#define HAVE_GETDTABLESIZE

/* Define to 1 if you have the `getifaddrs' function. */
#define HAVE_GETIFADDRS

/* Define to 1 if you have the `getpeereid' function. */
/* #undef HAVE_GETPEEREID */

/* Define to 1 if you have the `getpeerucred' function. */
/* #undef HAVE_GETPEERUCRED */

/* Define to 1 if you have the `getzoneid' function. */
/* #undef HAVE_GETZONEID */

/* Define to 1 if you have the <ieeefp.h> header file. */
/* #undef HAVE_IEEEFP_H */

/* Define to 1 if you have the `reallocarray' function. */
/* #undef HAVE_REALLOCARRAY */

/* Define to 1 if you have the `arc4random_buf' function. */
/* #undef HAVE_ARC4RANDOM_BUF */

/* Define to 1 if you have the `shmctl64' function. */
/* #undef HAVE_SHMCTL64 */

/* Define to 1 if you have the `strcasecmp' function. */
#define HAVE_STRCASECMP

/* Define to 1 if you have the `strcasestr' function. */
#define HAVE_STRCASESTR

/* Define to 1 if you have the `strncasecmp' function. */
#define HAVE_STRNCASECMP

/* Define to 1 if you have the `strlcat' function. */
/* #undef HAVE_STRLCAT */

/* Define to 1 if you have the `strlcpy' function. */
/* #undef HAVE_STRLCPY */

/* Define to 1 if you have the `strndup' function. */
#define HAVE_STRNDUP

/* Define to 1 if you have the `timingsafe_memcmp' function. */
/* #undef HAVE_TIMINGSAFE_MEMCMP */

/* Define to 1 if you have the `asprintf' function. */
#define HAVE_ASPRINTF

/* Define to 1 if you have the `vasprintf' function. */
#define HAVE_VASPRINTF

/* Define to 1 if typeof works with your compiler. */
#define HAVE_TYPEOF

/* Define to __typeof__ if your compiler spells it that way. */
#define typeof typeof

/* Use XTrans FD passing support */
#define XTRANS_SEND_FDS 1

/* Wrap SIGBUS to catch MIT-SHM faults */
#define BUSFAULT 1

/* Listen on Unix socket */
#define LISTEN_UNIX

/* Have setitimer support */
#define HAVE_SETITIMER 1

/* Have poll() */
#define HAVE_POLL 1

/* Have epoll_create1() */
#define HAVE_EPOLL_CREATE1 1

#endif /* _DIX_CONFIG_H_ */
