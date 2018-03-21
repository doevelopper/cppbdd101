<--
http://www.star.bnl.gov/public/comp/sofi/doxygen/docblocks.html   
-->
____________________________________________________________________________________________________
/*!
 * @file   example_action.h
 * @Author Me (me@example.com)
 * @date   September, 1970
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

/*!
 * @name    Example API Actions
 * @brief   Example actions available.
 * @ingroup example
 *
 * This API provides certain actions as an example.
 *
 * @param [in] repeat  Number of times to do nothing.
 *
 * @retval TRUE   Successfully did nothing.
 * @retval FALSE  Oops, did something.
 *
 * Example Usage:
 * @code
 *    example_nada(3); // Do nothing 3 times.
 * @endcode
 */
____________________________________________________________________________________________________
or complex projects it may be useful to have a separate file for module management, which controls the groups and subgroups. The whole hierarchy can be in one place and then each file can simply stuff to the child groups. e.g.:

/**
 * @defgroup example Top Level Example Group
 * @brief    The Example module.
 *
 * @{
 */

/**
 * @defgroup example_child1 First Child of Example
 * @brief    1st of 2 example children.
 */

/**
 * @defgroup example_child2 Second Child of Example
 * @brief    2nd of 2 example children.
 */

// @}

Simply including the definition of a group within the { } of another group makes it a child of that group. Then in the code and header files functions can just be tagged as part of whatever group they are in and it all just works in the finished documentation. It makes refactoring the documentation to match the refactor code much easier.
____________________________________________________________________________________________________
   DOXYGEN USAGE RULES 2.0

===============================================================================
===============================================================================
1) Doxygen comments

===============================================================================
1.1) Format

  Doxygen comments are started by a /** and terminated by a */, the following
style is recommended.

/**
 * Tags and text.
 */

===============================================================================
1.2) Tags

  Within a Doxygen comments the text is divided into several tagged sections,
each tag gives the text a specific meaning.
  Not all the available Doxygen tags should be used, the following tags are
specified for our documentation:

- @brief        A brief text description. A single sentence terminated by a
                dot that describes in a synthetic way the code object being
                described. The text should not exceed a single line. Brief
                descriptions must not contain formatting tags, pure text only.
- @details      A detailed text description of the code object being described,
                it can span more lines and contain formatting tags (both
                Doxygen and HTML).
- @pre          Preconditions as text description.
- @post         Postconditions as text description.
- @note         A text note, much like @details but the text appears in a
                "note box" in the final document.
- @param[in]    Describes a parameter that is input to the function or macro.
- @param[out]   Describes a parameter that is output of the function or macro.
- @param[in,out]Describes a parameter that is both input and output of the
                function or macro.
/**
 * \param[in]  val      Value calculations are based off.
 * \param[out] variable Function output is written to this variable.
 *
 * \return  True if the object was created, false if not
 *         (i.e., we're out of memory)
 */
bool modify_value(int val, int *variable)
{
    int working;
    working = (val * 5) % 44;
    *variable = working;
}
                
- @return       Describes the function return in a descriptive way. It should
                be omitted if the function returns void.
- @retval       Describes a specific return value and its meaning. There can
                be more than one @retval tags for each function. It can be
                omitted if the function does not return any specific value.
, if you have a function that
returns an error code, \retval can be used to list the error code values
that could be returned by the function and their meaning.
    \retval EACCES Required permissions are not available.
    \retval ENOENT File not found.                
- @p            Formatting tag, should be inserted in the text description
                before words that represent code objects like function names,
                constants, structure names etc. The tag makes the word appear
                with a typewriter font in the final document.
- - .           Used to generate dotted lists, example:
                - Item a text.
                - Item b text.
                .
- -# .          Used to generate dotted numbered lists, example:
                -# Item 1 text.
                -# Item 2 text.
                .
- <br>          This HTML tag enforces a line break in the text.
- <b></b>       Bold font.
- Any HTML      Almost any common HTML tag can be inserted in the detailed text
                descriptions.

===============================================================================
1.3) Examples

1.3.1) Function and macro declarations example

/**
 * @brief   Memory allocation.
 * @details This function allocates the specified amount of memory and
 *          returns a pointer to the allocated block.
 * @pre     The allocator subsystem <b>must be enabled</b> and initialized
 *          using @p mem_init() in order to use this function.
 * @post    The allocated block must be explicitly freed using @p mem_free().
 * @note    The allocated block is aligned to the most restrictive system
 *          type.
 *<note this is an empty line>
 * @param[in] size          The size of the memory block to be allocated.
 * @return                  A pointer to the allocated memory block.
 * @retval NULL             If the allocator could not provide the requested
 *                          memory block.
 */
char *mem_alloc(unsigned long size) {
}

  Note that Doxygen tags are forbidden within the function body, in order to
document internal details normal comments must be used.
  It is recommended to align the text as shown in the example, column 13 for
the description tags and column 29 for the other tags.

1.3.2) Structure and union declarations example

  Note that the following style applies to both structures and unions, with
or without a typedef.

/**
 * @brief   Memory block header.
 * @details This structure precedes each allocated memory block and is used
 *          by the allocator to maintain lists of blocks.
 * @note    This structure should not be used by the application code, it is
 *          just something the allocator subsystem uses internally.
 *<note this is an empty line>
 */
typedef struct {
  /**
   * @brief   Memory block magic number.
   * @details This field contains a magic number used by the allocator as an
   *          extra integrity check.
   */
  unsigned long         magic;
  /**
   * @brief   Size of the memory block prefixed by this header.
   * @note    The size is a memory-aligned value.
   */
  unsigned long         size;
  /**
   * @brief   Attribute flags of the memory block.
   */
  unsigned long         flags;
  /**
   * @brief   Next block in the list.
   */
  void                  *next;
} memblock_t;

1.3.3) Variable and constant declarations example

/**
 * @brief   Number of free blocks in list.
 * @details This global variable holds the number of free memory fragments
 *          in the free list.
 * @note    This variable should only be accessed by the allocator subsystem
 *          but it is not declared static for ease of debugging.
 */
unsigned long mem_free_blocks;

/**
 * @brief   Free block flag.
 * @details This flag marks blocks inserted in the free memory fragments list.
 * @note    This flag is ORed in the @p flags field of the @p memblock_t
 *          structure.
 */
#define MEM_FLAGS_FREE_BLOCK 0x00000400

Alternative forms where complex descriptions are not required, note that
the comment start is a bit different, comments can wrap to the following line
in order to not go past column 80:

unsigned long mem_free_blocks;          /**< @brief Number of free blocks
                                             in list.*/
#define MEM_FLAGS_FREE_BLOCK 0x00000400 /**< @brief Free block flag.*/

  This alternate style is only recommended when you have to document long lists
of definitions that only require a very brief description.

===============================================================================
1.4) Conditional sections

Doxygen implements a preprocessor and would skip sections of source code
enclosed into #if or #ifdef directives. In order to make Doxygen parse the
code and comments inside a conditional directive you must add this condition
to the directive: " || defined(__DOXYGEN__)".
Note that this is only required if the conditional block contains code
commented using doxygen tags. It is never required for #if or #ifdef contained
within functions or structures.

1.4.1) Example with #if

If you have, as example, the following situation:

#if MYCOND == 4
...
#endif

You must transform it this way:

#if (MYCOND == 4) || defined(__DOXYGEN__)
...
#endif

1.4.1) Example with #ifdef

If you have, as example, the following situation:

#ifdef MYSWITCH
...
#endif

You must transform it this way:

#if defined(MYSWITCH) || defined(__DOXYGEN__)
...
#endif

===============================================================================
===============================================================================
2) General structure for source and header files.

  As a general rule source files should not exceed column 80 unless there are
very specific reasons to do so, as example expressions with very long
identifiers that can't be split in a logic or readable way. This also applies
to comments, text descriptions must be wrapped before column 80, it would be
a good thing to wrap immediately after column 72 in order to leave some space
for small edits.

/*
 * Copyright (C) 2013, GENIVI Alliance, Inc.
 * Copyright (C) 2013, Intecs S.p.A.
 *
 * This file is part of DLT-T.
 *
 * Contributions are licensed to the GENIVI Alliance under one or more
 * Contributor License Agreements.
 *
 * This Source Code Form is subject to the terms of the
 * Mozilla Public License (MPL), v. 2.0.
 * If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * For further information see http://www.genivi.org/.
 *
 * List of changes:
 * <Date>, <Author>, <Description>
 *
 */

/**
 * @file    <File name>
 *
 * @brief   <Brief description>
 *
 * @addtogroup <Group Name>
 * @{
 */

/*===========================================================================*/
/* Include files.                                                            */
/*===========================================================================*/

/*===========================================================================*/
/* Defines and macros.                                                       */
/*===========================================================================*/

/*===========================================================================*/
/* Types definitions.                                                        */
/*===========================================================================*/

/*===========================================================================*/
/* Variables.                                                                */
/*===========================================================================*/

/*===========================================================================*/
/* Local functions.                                                          */
/*===========================================================================*/

/*===========================================================================*/
/* Exported functions.                                                       */
/*===========================================================================*/

/** @} */

