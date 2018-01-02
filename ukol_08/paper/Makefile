# Write main filename:
MAIN = main
OUT = DSP08Mlejnecky

.PHONY: clean clean-all clean_all

all: $(OUT).pdf

#compile tex document
$(OUT).pdf: $(MAIN).tex
	pdflatex $(MAIN).tex
	pdflatex $(MAIN).tex
	mv $(MAIN).pdf $(OUT).pdf
	
#delete all unnecessary files including .pdf
clean:
	rm -f *.aux *.log *.out *.toc *.lof tex/*.aux *.pdf
	
see: $(OUT).pdf
	xreader $(MAIN).pdf
	rm -f *.aux *.log *.out *.toc *.lof tex/*.aux *.pdf
