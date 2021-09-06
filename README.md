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
* The `convert` utility from [ImageMagick](https://imagemagick.org).
* Python


### Steps

* Write your homework/exam solution using your favorite text processor
(such as LaTeX) and save it as pdf file `solution.pdf`.
There is an example in the `examples` directory.

* Put the email addresses of each student into a file `emails.txt`
with one email per line.

* Create `tmp/` and `output/` directories for files.

* Run the Julia script `run.jl` via `julia -- run.jl`

That script will create a pdf file for each student in the `output/` directory.

For an example of such output, see
[`example/student.pdf`](https://github.com/JeffFessler/WatermarkSolutions/tree/main/example/student.pdf)

* It is quite likely you will need to edit some of the scripts
to set up the paths for your system to get it all to work.
For example, the python path in `merger.py` may need edited.
These scripts are intended for "power users"
who are comfortable with working at the command line.
