$pdflatex = 'pdflatex -shell-escape';
$latex = 'latex -shell-escape';

add_cus_dep('lagda','tex',1,'lagda2tex');

sub lagda2tex {
    my $base = shift @_;
    return system('agda', '--latex', '--latex-dir=../', "$base.lagda");
}
