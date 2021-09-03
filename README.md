# WatermarkSolutions

### Scripts for adding watermarks to homework / exam solutions

There is a growing problem
of students acting unethically
by uploading homework and exam solutions
to exploitative websites like chegg and coursehero.

Those reprehensible websites have procedures
for requesting removal of copyrighted material,
but the interfaces appear to be designed
to be deliberately inconvenient to use.

Multiple strategies are needed to address this problem.
* Every syllabus should advise students
that sharing or uploading solutions is dishonorable.
* Solutions should include a copyright statement
and should state that using solutions from previous terms
is dishonorable and an honor code violation.

* This repo provides another tool:
custom watermarking of solutions
with each student's email address.
This watermark hopefully will further discourage students
from uploading or sharing solutions,
and may make it possible to identify students who do.


### Requirements

This repo is for users comfortable with terminal scripts and Makefiles.
It requires functional installations of
* The `pdflatex` binary from a `LaTeX` suite.
* A recent release of the [Julia](julialang.org) language
with its executable `julia` in the shell path.
