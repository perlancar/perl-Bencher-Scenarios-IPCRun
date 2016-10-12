package Bencher::Scenario::IPCRun::run_overhead;

# DATE
# VERSION

use strict;
use warnings;

our $scenario = {
    summary => "Benchmark overhead of run() vs core's system()",
    modules => {
    },
    participants => [
        {
            fcall_template => 'IPC::Run::run(["true"]) or die',
        },
        {
            name => 'system',
            code_template => 'system("true"); $? and die',
        },
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
