#!/usr/bin/perl

# Convert a truth table to continuous assignments in SystemVerilog.

use strict;
use warnings;

# Initialize table with double quotes for a multi-line string.
my $table = "
i3 i2 i1 i0 | z2 z1 z0
 0  0  0  0 |  0  0  0
 0  0  0  1 |  0  0  1
 0  0  1  0 |  0  0  1
 0  0  1  1 |  0  1  0
 0  1  0  0 |  0  0  1
 0  1  0  1 |  0  1  0
 0  1  1  0 |  0  1  0
 0  1  1  1 |  0  1  1
 1  0  0  0 |  0  0  1
 1  0  0  1 |  0  1  0
 1  0  1  0 |  0  1  0
 1  0  1  1 |  0  1  1
 1  1  0  0 |  0  1  0
 1  1  0  1 |  0  1  1
 1  1  1  0 |  0  1  1
 1  1  1  1 |  1  0  0
";

my @lines = split "\n", $table;
shift @lines; # Remove the header line.

my @expressions = ('', '', '');

foreach my $line (@lines) {
    if ($line =~ /\s*(\d) +(\d) +(\d) +(\d) *\| +(\d) +(\d) +(\d)/) {
        my ($i3, $i2, $i1, $i0, $z2, $z1, $z0) = ($1, $2, $3, $4, $5, $6, $7);

        for my $i (0 .. 2) {
            if (($z2, $z1, $z0)[$i] eq '1') {
                $expressions[$i] .= sprintf(" | (%s%s%s%s)", 
                                            $i3 ? "i3" : "!i3",
                                            $i2 ? " & i2" : " & !i2",
                                            $i1 ? " & i1" : " & !i1",
                                            $i0 ? " & i0" : " & !i0");
            }
        }
    }
}

for my $i (0 .. 2) {
    $expressions[$i] =~ s/^\s*\|\s*//; # Clean up leading operators.
    print "assign z$i = $expressions[$i];\n";
}


#!/usr/bin/perl

use strict;
use warnings;

# Initialize table with double quotes for a multi-line string.
my $table = "
i3 i2 i1 i0 | z2 z1 z0
0  0  0  0 |  0  0  0
0  0  0  1 |  0  0  1
...
1  1  1  1 |  1  0  0
";

# Split the table into lines.
my @lines = split "\n", $table;
shift @lines; # Remove the header line.

print <<"END_HEADER";
// Testbench generated by Perl script
module test_CountingSignals;
    reg i3, i2, i1, i0;
    wire z2, z1, z0;

    // Instantiate the Unit Under Test (UUT)
    CountingSignals UUT (
        .i3(i3),
        .i2(i2),
        .i1(i1),
        .i0(i0),
        .z2(z2),
        .z1(z1),
        .z0(z0)
    );

    initial begin
        // Initialize Inputs
        i3 = 0; i2 = 0; i1 = 0; i0 = 0;

        // Wait for global reset to finish
        #100;
END_HEADER

foreach my $line (@lines) {
    if ($line =~ /\s*(\d) +(\d) +(\d) +(\d) *\| +(\d) +(\d) +(\d)/) {
        my ($i3, $i2, $i1, $i0, $z2, $z1, $z0) = ($1, $2, $3, $4, $5, $6, $7);

        print "        // Test case: Inputs = $i3$i2$i1$i0; Expected Outputs = $z2$z1$z0\n";
        print "        i3 = $i3; i2 = $i2; i1 = $i1; i0 = $i0;\n";
        print "        #10; // Wait 10 time units\n";
        print "        if (!(z2 === $z2 && z1 === $z1 && z0 === $z0)) begin\n";
        print "            \$display(\"Test failed for inputs $i3$i2$i1$i0: Expected $z2$z1$z0, got %b%b%b\", z2, z1, z0);\n";
        print "        end\n";
    }
}

print <<"END_FOOTER";
        // Complete
        \$display("All tests completed successfully.");
        \$finish;
    end
endmodule
END_FOOTER
