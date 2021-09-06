#!/opt/local/bin/python
# This python script merges each page of a solution pdf file
# with a colorful watermark pdf file to make a watermarked solution.
# The user may want to edit some of the file paths below!
# https://www.codespeedy.com/how-to-add-watermark-to-a-pdf-file-using-python/
# https://github.com/mstamy2/PyPDF2
# needs macports py-pypdf2

import PyPDF2
import copy

file1 = "example/solution.pdf"
filew = "tmp/watermark-rainbow.pdf"
fileo = "tmp/tmp.pdf"

template = PyPDF2.PdfFileReader(open(file1, 'rb'))
watermark = PyPDF2.PdfFileReader(open(filew, 'rb'))
output = PyPDF2.PdfFileWriter()

#for i in range(template.getNumPages()):
#    page = template.getPage(i)
#    page.mergePage(watermark.getPage(0))
#    output.addPage(page)

for i in range(template.getNumPages()):
    page = template.getPage(i)
    mark = watermark.getPage(0)
    mark = copy.copy(mark)
    mark.mergePage(page)
    output.addPage(mark)

file = open(fileo, 'wb')
output.write(file)
