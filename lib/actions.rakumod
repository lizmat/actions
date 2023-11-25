class MetamodelX::ActionsHOW is Metamodel::ClassHOW {
    # Just return the class itself in its MRO
    method mro(|) { use nqp; nqp::list(callsame()[0]) }
}

my package EXPORTHOW {
    # Export the "actions" keyword
    package DECLARE {
        constant actions = MetamodelX::ActionsHOW;
    }
}

=begin pod

=head1 NAME

actions - Introduce "actions" keyword

=head1 SYNOPSIS

=begin code :lang<raku>

use actions;

grammar A { token TOP { <.print>+ } }
actions B { }

say A.parse("foo", :actions(B));  # ｢foo｣

=end code

=head1 DESCRIPTION

The actions distribution adds an C<actions> keyword that is B<almost>
identical to the C<class> keyword, except that it B<limits> the execution
of methods to methods that only exist within the C<actions> itself.

This is important when a class is used to have associated methods executed
whenever a regex / token / rule in the grammar matches.  The above
example would fail if it were a C<class B>, because it would try to
execute the C<Mu::print> method, which doesn't accept any arguments,
resulting in:

    Cannot resolve caller print(B:U: A:D); none of these signatures matches:
    (Mu: *%_)

Inspired by L<a discussion|https://github.com/Raku/problem-solving/issues/401>
in the Raku Problem Solving repository.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/actions . Comments and
Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2023 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
