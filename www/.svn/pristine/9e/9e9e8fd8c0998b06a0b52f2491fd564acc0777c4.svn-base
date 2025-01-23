# convert mixed romanized Japanese to Hepburn romanization
# only fixes cases actually occurring in data
while (<>) {
    ($japanese, $english) = split " ", $_, 2;
    $japanese =~ s/si/shi/g;
    $japanese =~ s/jy/j/g;
    $japanese =~ s/zy/j/g;
    $japanese =~ s/sy/sh/g;
    $japanese =~ s/tu/tsu/g;
    $japanese =~ s/ti/chi/g;
    $japanese =~ s/hu/fu/g;
    $japanese =~ s/du/zu/g;
    print "$japanese $english";
}
