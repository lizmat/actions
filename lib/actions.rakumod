class MetamodelX::ActionsHOW is Metamodel::ClassHOW {
    # Just return the class itself in its MRO
    method mro(|) {
        use nqp;
        my $mro := nqp::clone(callsame);
        nqp::pop($mro);  # Any
        $mro
    }
}

my package EXPORTHOW {
    # Export the "actions" keyword
    package DECLARE {
        constant actions = MetamodelX::ActionsHOW;
    }
}

# vim: expandtab shiftwidth=4
