from Markdown2docx import Markdown2docx
import sys

filename = sys.argv[1]
filename = filename[:-3]
project = Markdown2docx(filename)
project.eat_soup()
project.save()
