#!/bin/bash

# Parse command line arguments for version suffix
VERSION_SUFFIX=""
while getopts "v:" opt; do
    case $opt in
        v)
            VERSION_SUFFIX="-v$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $0 [-v VERSION]" >&2
            echo "Example: $0 -v12 (will add -v12 to PDF filenames)" >&2
            exit 1
            ;;
    esac
done

echo "Building PDFs${VERSION_SUFFIX:+ with version suffix: $VERSION_SUFFIX}"

# Summary
echo "Building Summary..."
cd Project_Summary
pdflatex --output-directory=../Submission summary.tex
bibtex                      ../Submission/summary.aux
pdflatex --output-directory=../Submission summary.tex
pdflatex --output-directory=../Submission summary.tex
if [ -n "$VERSION_SUFFIX" ]; then
    mv ../Submission/summary.pdf "../Submission/summary${VERSION_SUFFIX}.pdf"
fi
cd ..

# Description
echo "Building Description..."
cd Project_Description
cp ../references.bib ./
pdflatex description.tex
bibtex   description.aux
pdflatex description.tex
pdflatex description.tex
mv description.bbl ../Submission/
if [ -n "$VERSION_SUFFIX" ]; then
    mv description.pdf "../Submission/description${VERSION_SUFFIX}.pdf"
else
    mv description.pdf ../Submission/
fi
rm -rf *.aux *.blg *.out *.log *.bbl *.bib
cd ..

# References Cited
echo "Building References Cited..."
cd References_Cited
pdflatex --output-directory=../Submission references.tex
bibtex                      ../Submission/references.aux  # Fixed typo: Subsmission -> Submission
pdflatex --output-directory=../Submission references.tex
pdflatex --output-directory=../Submission references.tex
if [ -n "$VERSION_SUFFIX" ]; then
    mv ../Submission/references.pdf "../Submission/references${VERSION_SUFFIX}.pdf"
fi
cd ..

# Facilities Equipment and Other Resources
echo "Building Facilities Equipment and Other Resources..."
cd Facilities_Equipment_and_Other_Resources
pdflatex --output-directory=../Submission resources.tex
bibtex                      ../Submission/resources.aux
pdflatex --output-directory=../Submission resources.tex
pdflatex --output-directory=../Submission resources.tex
if [ -n "$VERSION_SUFFIX" ]; then
    mv ../Submission/resources.pdf "../Submission/resources${VERSION_SUFFIX}.pdf"
fi
cd ..

# Data Management Plan
echo "Building Data Management Plan..."
cd Data_Management_Plan
pdflatex --output-directory=../Submission data.tex
bibtex                      ../Submission/data.aux
pdflatex --output-directory=../Submission data.tex
pdflatex --output-directory=../Submission data.tex
if [ -n "$VERSION_SUFFIX" ]; then
    mv ../Submission/data.pdf "../Submission/data${VERSION_SUFFIX}.pdf"
fi
cd ..

# Postdoc Mentoring Plan
echo "Building Postdoc Mentoring Plan..."
cd Mentoring_Plan
pdflatex --output-directory=../Submission mentoring.tex
bibtex                      ../Submission/mentoring.aux
pdflatex --output-directory=../Submission mentoring.tex
pdflatex --output-directory=../Submission mentoring.tex
if [ -n "$VERSION_SUFFIX" ]; then
    mv ../Submission/mentoring.pdf "../Submission/mentoring${VERSION_SUFFIX}.pdf"
fi
cd ..

# Senior Personnel Documents
echo "Building Senior Personnel Documents..."
cd Senior_Personnel_Documents
pdflatex --output-directory=../Submission synergistic.tex
bibtex                      ../Submission/synergistic.aux
pdflatex --output-directory=../Submission synergistic.tex
pdflatex --output-directory=../Submission synergistic.tex
if [ -n "$VERSION_SUFFIX" ]; then
    mv ../Submission/synergistic.pdf "../Submission/synergistic${VERSION_SUFFIX}.pdf"
fi
cd ..

# Clean up
echo "Cleaning up auxiliary files..."
rm -rf ./Submission/*.aux ./Submission/*.bbl ./Submission/*.blg ./Submission/*.out ./Submission/*.log

echo ""
echo "All files compiled successfully${VERSION_SUFFIX:+ with version suffix: $VERSION_SUFFIX}."
echo "Biosketches and Current and Pending Support should be downloaded from SciENcv: https://www.ncbi.nlm.nih.gov/sciencv/."
