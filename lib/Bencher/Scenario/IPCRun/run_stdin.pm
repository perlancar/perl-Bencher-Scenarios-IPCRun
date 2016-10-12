package Bencher::Scenario::IPCRun::run_stdin;

# DATE
# VERSION

use strict;
use warnings;

our $scenario = {
    summary => "Benchmark run()'s stdin vs opening a pipe",
    modules => {
    },
    participants => [
        {
            module => 'IPC::Run',
            function => 'run',
            code_template => 'state $in = "a" x <input_size>; IPC::Run::run(["true"], \$in) or die',
        },
        {
            name => 'system',
            code_template => 'state $in = "a" x <input_size>; open my($fh), "|true" or die; print $fh $in',
        },
    ],
    datasets => [
        {args=>{input_size=>0}},
        {args=>{input_size=>1024}},
        {args=>{input_size=>50*1024}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
