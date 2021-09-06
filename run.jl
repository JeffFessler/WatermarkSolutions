# run.jl
# Julia script for producing "watermarked" pdf solutions for students

using Pkg
Pkg.activate(".") # be sure to use local Manifest

using FileIO
using ColorTypes, ColorVectorSpace
using ColorVectorSpace: ⊙ # hadamard

# convert black&white watermark to rainbow colors
function torainbow(black::AbstractArray)
    dims = size(black)
    # random RGB raised to the 4th power (cf gamma "correction") so fainter:
    r = rand(dims...) .^4
    b = rand(dims...) .^4
    g = rand(dims...) .^4
    mask = RGB.(r, b, g) # random RGB colors
    white = RGB(1,1,1)
    return white .- ((white .- black) .⊙ mask)
end

# extract "name" from "name@place.edu"
function email2name(email)
    at = findfirst('@', email)
    return email[1:(at-1)]
end

# read list of emails from file
emailfile = "emails.txt"
emails = read(emailfile, String)
emails = split(emails)

for email in emails
    name = email2name(email)
    @show email, name

#   file = email
    file = name

    # run pdflatex to create initial "watermark.pdf" with email in it
    cm = Cmd(`pdflatex "\\def\\email{$email} \\input{watermark}"`)
#   @show cm
    run(cm)

    # convert pdf to png for processing
    # uses 'convert' from ImageMagick
    # todo: size is ignored!?
    cm = Cmd(`convert -size 2001x2590 watermark.pdf tmp/watermark-black.png`)

    black = load("tmp/watermark-black.png")
    rainbow = torainbow(black) # convert to rainbow
    save("tmp/watermark-rainbow.pdf", rainbow)

    cm = Cmd(`merger.py`) # merge solution.pdf with watermark
    run(cm)

    mv("tmp/tmp.pdf", "output/$file.pdf", force=true)
end


# At this point in the script, director output/ has pdf files for each solution.
# The rest of this script is for emailing those solutions to the students.
for email in emails
    name = email2name(email)
# todo
end
