# latex-boilerplate

Repository for my LaTeX boilerplate.

### Starting

    git clone https://github.com/hos/latex-boilerplate
    sh bootstrap

### Compiling

The makefile utilizes a standard and robust dependency chain such as TEX-> DVI-> PS-> PDF.
This is the most robust method I know, from past experience. You cannot, however, use raster formats
such as JPEG or PNG like you would when running `pdflatex`. Refer to online documentation
for more information on available build processes for LaTeX documents.

For creating a pdf file, just typing `make` is enough.

**Protip:** Don't forget to use it with the `-B` option for forced remake, since
the makefile cannot see the changes in all your dependencies without you adding
them.

    make -B

Look at the recipes inside the makefile. You can use `make dvi` or `make ps` to only
create those files.
