NAME
====

actions - Introduce "actions" keyword

SYNOPSIS
========

```raku
use actions;

grammar A { token TOP { <.print>+ } }
actions B { }

say A.parse("foo", :actions(B));  # ｢foo｣
```

DESCRIPTION
===========

The actions distribution adds an `actions` keyword that is **almost** identical to the `class` keyword, except that it **limits** the execution of methods to methods that only exist within the <actions> itself.

This is important when a class is used to have associated methods executed whenever a regex / token / rule in the grammar matches. The above example would fail if it were an `class B`, because it would try to execute the `Mu::print` method, which doesn't accept any arguments, resulting in:

    Cannot resolve caller print(B:U: A:D); none of these signatures matches:
    (Mu: *%_)

Inspired by [a discussion](https://github.com/Raku/problem-solving/issues/401) in the Raku Problem Solving repository.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/actions . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2023 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

