/*
 *
 * Copyright (C) 2011 secunet Security Networks AG
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#ifdef __TEST__

/* CMocka function redefinition */
void mock_assert(const int result, const char *const expression, const char *const file,
		 const int line);

#define MOCK_ASSERT(result, expression) mock_assert((result), (expression), __FILE__, __LINE__)
#define assert(statement) MOCK_ASSERT(!!(statement), #statement)

#else

// assert's existence depends on NDEBUG state on _last_ inclusion of assert.h,
// so don't guard this against double-includes.
#ifdef NDEBUG
// Heisenbugs appear if statement has side-effects. This could be worked around but does the standard allow for that?
#define assert(statement)
#else
#define assert(statement)					\
	if ((statement) == 0) {					\
		fprintf(stderr, "assertion failed in file %s, "	\
			"function %s(), line %d\n",		\
			 __FILE__, __func__, __LINE__);	\
		abort();					\
	}
#endif

#endif /* __TEST__ */
