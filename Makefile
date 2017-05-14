HAML = html2haml
TEX = latex -recorder #para anotar que archivos lee en book_mobi.fls
PDFLATEX = pdflatex 
TEX4HT = tex4ht
T4HT = t4ht
BIBTEX = bibtex
PERL = 	perl
RUBY =  ruby
ERB = erb
KINDLEGEN = ~/kindlegen -verbose #tamaño maximao 650MB, limpiar /tmp
CONVERT = convert
AVCONVERT = avconvert

HTML_FILES = $(wildcard app/views/components/*/index.html) $(wildcard app/views/devise/*/*)
OTHERFILES = $(wildcard ch_*/figs/*) $(wildcard ch_*/tables/*) $(wildcard ch_*/code/*) $(wildcard ch_*/mov/*)
TEXFILES = $(shell find . -name \*.tex)
BIBFILES = book.bib
HTML_CONFIGS = book_html.cfg book_html.4ht
MOBI_CONFIGS = book_mobi.cfg book_mobi.4ht
PDF_CONFIGS = macros.tex 
SRCS = $(TEXFILES) $(BIBFILES) $(OTHERFILES)
CODEFILES = $(shell find ch_*/code/* -regex '.*/[^\#].*\..*[^~]$$')

TAGSRCS = $(SRCS) $(HTML_CONFIGS) $(MOBI_CONFIGS) $(PDF_CONFIGS)# $(CODEFILES)

PDF_FIGURES     = $(wildcard ch_*/figs/*.pdf) $(wildcard arte/*.pdf)
EPS_FIGURES     = $(wildcard ch_*/figs/*.eps) $(wildcard css/images/*.eps)
EPS_SP_FIGURES  = $(shell find $(wildcard ch_*/figs) -name '*_sp.eps' )
EPS_ENG_FIGURES = $(shell find $(wildcard ch_*/figs) -name '*.eps' -not -name '*_sp.eps')
PDF_SP_FIGURES  = $(shell find $(wildcard ch_*/figs) -name '*_sp.pdf' )
ECUACION_PNG_FIGURES  = $(wildcard *.png)

IDXS  = $(wildcard *.idx)

PDF_GIF_CONVERT    = $(patsubst %.pdf,%.gif,$(PDF_SP_FIGURES))

EPS_PDF_CONVERT    = $(patsubst %.eps,%.pdf,$(EPS_ENG_FIGURES))
EPS_PS_PDF_CONVERT = $(patsubst %.eps,%.pdf,$(EPS_SP_FIGURES))

EPS_ENG_GIF_CONVERT= $(patsubst %.eps,%.gif,$(EPS_ENG_FIGURES))
EPS_SP_GIF_CONVERT = $(patsubst %.eps,%.gif,$(EPS_SP_FIGURES))
EPS_GIF_CONVERT    = $(patsubst %.eps,%.gif,$(EPS_FIGURES))

HTML_HAML_CONVERT  = $(patsubst %.html.erb,%.html.haml,$(HTML_FILES))



EPS_JPG_CONVERT = $(patsubst %.eps,%.jpg,$(EPS_ENG_FIGURES))
EPS_PNG_CONVERT = $(patsubst %.eps,%.png,$(EPS_FIGURES))


IDX_IND_CONVERT = $(patsubst %.idx,%.ind,$(IDXS))


ECUACION_PNG_GIF_CONVERT = $(patsubst %.png,%.gif,$(ECUACION_PNG_FIGURES))

PDF_ICONS = $(wildcard icons/*.pdf)
JPG_FIGURES = $(shell find *.jpg -not -name '*_SB*')
SCALED_SIDEBAR_FIGURES = $(patsubst %.jpg,%.png,$(JPG_FIGURES))



haml: $(HTML_HAML_CONVERT)




%.html.haml: %.html.erb
	$(HAML) $<  >  $@
	rm -f $<


all: help

.PHONY: outline html mobi css pdf clean cleanup help newchapter only 

eqn: $(ECUACION_PNG_GIF_CONVERT)


help:
	@echo "'make html' creates www/ directory containing HTML5 version"
	@echo "'make mobi' creates book.mobi (for Kindle)"
	@echo "'make ibook' creates .rtfd files for importing into iWork Pages and then into iBooks Author"
	@echo "'make pdf' creates book.pdf"
	@echo "'make only CHAPTER=big_ideas' creates a draft PDF of just chapter 'big_ideas.tex'"
	@echo "      (NOTE: you must do 'make clean && make pdf' first)"
	@echo "'make update_pastebin' uploads all new code/ examples to Pastebin and updates LaTeX files in place (SAVE ALL YOUR FILES AND RUN git commit BEFORE DOING THIS)"
	@echo "'make outline' prints out TOC without chapter numbers"

outline: $(SRCS)
	@perl -ne 'print "$$1.tex " if /[^%][ *]\\include{(ch_.*\/.*)}/' common.tex | xargs $(PERL) script/outl.pl -n

only: $(SRCS)
	@echo '\\def\\onechap{TRUE} \\includeonly{ch_$(CHAPTER)/$(CHAPTER)}' > only.tex
	make pdf
	rm -f only.tex

onlyquick: $(SRCS)
	@echo '\\def\\onechap{TRUE} \\includeonly{ch_$(CHAPTER)/$(CHAPTER)}' > only.tex
	make 'QUICK=#' pdf
	rm -f only.tex

#$(EPS_JPG_CONVERT)
mobi: book_mobi.html css/mobi.css book_mobi.ncx book_mobi.opf $(EPS_SP_GIF_CONVERT) $(EPS_ENG_GIF_CONVERT) $(SCALED_SIDEBAR_FIGURES)  $(EPS_GIF_CONVERT)
	$(RUBY) script/mobi_postprocess.rb $<.bak > $<
	cat css/mobi.css >> mobi.css
	-$(KINDLEGEN) book_mobi.opf 
	mv book_mobi.mobi book.mobi

blue: 
	rsync ~/one_commit_gestion2728 /run/user/1000/gvfs/smb-share:server=bigblue,share=publisher/ -r --progress --outbuf=N  -T=/tmp


pen: 
	rsync ~/maker/* /media/alex/PENDRIVE -avcrt --progress 

eject: 
	umount /dev/sdb1


mobi_sin_chapter: book_mobi.html css/mobi.css book_mobi.ncx book_mobi.opf $(SCALED_SIDEBAR_FIGURES) $(PDF_GIF_FIGURES)
	$(RUBY) script/mobi_sin_chapter_postprocess.rb $<.bak > $<
	cat css/mobi.css >> mobi.css
	-$(KINDLEGEN) book_mobi.opf 
	mv book_mobi.mobi book.mobi

%.ncx: %.ncx.erb
	$(ERB) $<  >  $@

book_mobi.html: book_mobi.tex book_mobi.dvi $(MOBI_CONFIGS) 
	$(TEX4HT) $<
	$(T4HT) $<
	cp $@ $@.bak

book_html.html: book_html.tex book_html.dvi $(HTML_CONFIGS) 	
	$(TEX4HT) $<
	$(T4HT) $<
	cp $@ $@.bak

.PHONY: html
html: book_html.html html_preamble.html footer.tex
	rm -f book_html.css
	$(RUBY) script/html_postprocess.rb book_htmlch*.html

html_postprocess: book_html.html book_htmlli*.html book_htmlch*.html book_htmlap*.html
	$(RUBY) script/html_postprocess.rb $^

find_undefined: book.pdf
	$(PDFLATEX) book_pdf | grep -i defined | grep -v 'Font shape' 2>&1

  #$(EPS_JPG_CONVERT)
  #$(EPS_PS_PDF_CONVERT)
  # $(EPS_PDF_CONVERT)
 #         #(EPS_PDF_CONVERT)

pdf: book_pdf.tex $(SRCS) $(PDF_CONFIGS) $(EPS_PS_PDF_CONVERT) $(EPS_PDF_CONVERT) 
	$(PDFLATEX) $(basename $<)
	makeindex book_pdf
	$(QUICK) -for i in bu?*.aux ; do bibtex `basename $$i .aux` ; done
	$(QUICK) $(PDFLATEX) $(basename $<)
	$(QUICK) $(PDFLATEX) $(basename $<)
	mv $(basename $<).pdf book.pdf


%.dvi:  $(HTML_CONFIGS) $(MOBI_CONFIGS)
	$(TEX) $(basename $@)
	-for i in bu?*.aux ; do bibtex `basename $$i .aux` ; done
	$(TEX) $(basename $@)
	makeindex book_mobi.idx  #Tal vez necesite generalizacion, pero hasta ahroa solo se llega aqui usando make mobi 
	$(TEX) $(basename $@)
	rm -f only.tex

%.pdf: %.eps
	$(CONVERT) -density 300x300 -resize 1024x $^ $@  2>/dev/null
	#para libro de tamaño 9x6" tiene 3.5 pulgadas de texto

#.jpg: %.eps
#$(CONVERT) -density 300x300 -resize 2048x $^ $@  2>/dev/null

#%.pdf: %.eps
#	$(CONVERT) $^ $@  2>/dev/null


# convert fullsize PDF images to GIF (for Kindle)
#%.gif: %.eps
#	$(CONVERT) -border 300 -frame 50 -mattecolor '#002233' -background '#333333' -transparent-color '#ffffff' -resize 800x -density 300x300 $^ $@  2>/dev/null


#%.gif: %.png 
#	 $(CONVERT) -density 300x300 -resize 1024x -opaque '#00ffff' -transparent '#000000' $^ $@  2>/dev/null

#borde verde fluorescente
#.gif: %.eps 
#$(CONVERT) -transparent '#ffffff' -border 2 -bordercolor '#000000' -frame 5 -mattecolor '#00ff00' -background '#00ffff' $^ $@  2>/dev/null

#borde para que no esté pegao el texto y evitar el efecto de kindle dx, cinta roja para destacar y background azul.

#Transparent es color 0 para indicar que donde no haya color en el gif se considere como una hoja de transparencia con calados para los colores opacos.
#El borde se agrega al tamaño normal de la imagen y el color se extiende a la transparencia. No se usa background color para eso, porque se supone que esta es una imagen de las muchas que podria haber sobre una extension llamada background
#La cinta que rodea a todo es llamada frama y puede tener un color y tamao que no se mezcla o fusiona co la transparencia. 
#El mecanismo de fusion de transparaencia involucra un color que se supone transparente, un color mate para interpretar los bits que estan en la frontera de cada color y la transparencia. Esos pixeles deben tomar un color o ser transparentes
#Fondo azulado y borde rojo.
#.gif: %.eps 
#$(CONVERT) -transparent '#000000' -border 30 -bordercolor '#0fffff' -frame 5 -mattecolor '#110000' -opaque '#ffffff' $^ $@ 2>/dev/null 

#Fondo transparente con cartel de fondo amarillo
#%.gif: %.eps

#	$(CONVERT) -annotate 0,20,140,20 "instrumentación industrial 6.0" -stroke '#ffffff' -strokewidth 2  -style normal -undercolor '#0000ff' -bordercolor '#00ff00'  -background '#0fffff' -fill '#19FFFF' -matte  -mattecolor '#ffff00' -opaque '#00ffff' -transparent '#000000' $^ $@  2>/dev/null


#Fondo transparente
#.gif: %.eps
#$(CONVERT) -transparent '#000000' $^ $@  2>/dev/null

#Marco transparente para los gráficos. Usa gamma 20 para comprimir el espectro de colores y lograr mayor enfasis en las letras. En contra, cambia los colores. Cambiar las fotos donde aparece el epectro, quitarle _sp para que sea procesada por el siguiente hook. Decidi no usarlo, pues oscurece mucho con fondo negro de kidndle device.
#.gif: %.eps
#	$(CONVERT) -frame 20 -border 100 -transparent '#000000' -density 300x300 -resize 800x  $^ $@  2>/dev/null


#Marco exquisito gris con biselado gris oscuro para las fotos
%.jpg: %.eps
	$(CONVERT) -frame 20 -border 100 -transparent '#000000' -density 300x300 -resize 800x  $^ $@  2>/dev/null

book_mobi.ind:
	makeindex book_mobi

book_pdf.ind:
	makeindex book_pdf

%.ind: %.idx
	akeindex $@

%.gif: %.eps
	$(CONVERT) -flatten -background '#ffffff' -transparent-color '#ffffff' -density 300x300 -resize 800x $^ $@  2>/dev/null

#
#gif: %.eps 
#$(CONVERT) -flatten -background '#ffffff' -transparent-color '#ffffff' -density 72x72 $^ $@  2>/dev/null

#.gif: %.eps
#$(CONVERT) -flatten -background '#ffffff' -transparent-color '#ffffff'  $^ $@  2>/dev/null

# resize fullsize images to sidebar images (for Kindle)
#%.png: %.eps
#	$(CONVERT) -flatten -background '#ffffff'  -transparent-color '#ffffff' -density 300x300 $^ $@ 2>/dev/null



# resize fullsize images to sidebar images (for Kindle)
%.png: %.jpg
	$(CONVERT) -flatten -background '#ffffff'  -transparent-color '#ffffff' -density 72x72 -quality 90 -resize 800x $^ $@ 2>/dev/null

.PHONY: update_pastebin clear_pastebin diff_pastebin
clear_pastebin:
	-$(RUBY) script/update_pastebin delete_all
	-$(RUBY) script/update_pastebin truncate_pastie_file

update_pastebin:
	@echo Uploading files to pastebin, this may take a couple of minutes...
	-$(RUBY) script/update_pastebin update $(CODEFILES)
	@echo Updating LaTeX files with Pastebin URIs, be sure to reload them in your editor....
	$(RUBY) -p -i.bak script/update_tex_with_pasties $(SRCS) && find . -name '*.tex.bak' -exec rm '{}' ';'

diff_pastebin:
	-$(RUBY) script/update_pastebin diff $(CODEFILES)

update_vimeo:
	@echo Updating LaTeX files with Vimeo URIs
	$(RUBY) -p -i.bak script/update_tex_with_screencasts $(SRCS) && find . -name '*.tex.bak' -exec rm '{}' ';'

TAGS: $(TAGSRCS)
	etags $^

.PHONY: check_blank_lines
check_blank_lines:
	@echo The following code files may have spurious blank lines at end:
	-@pcregrep -l -M '(^\s*$$){2,}\Z' $(CODEFILES)

# remove changebars
.PHONY: remove_changebars
remove_changebars:
	$(PERL) -p -i.bak -e 's/\\\\cb(start|end)\{\}//g' $(TEXFILES)

.PHONY: fulltags
fulltags:
	find . -name '.#*' -prune -o -name '*.tex' -o -name '*.bib' -o -name '*.rb' -type f | xargs etags 

veryclean: clean clean_figs 

clean_docs:
	rm -f book_pdf.pdf  book_html.html  book_mobi.html

#clean_figs:
#	rm -f ch_*/figs/*_SB.* ch_*/figs/*.pdf.gif ch_*/figs/*.jpg.gif icons/*_SB.*

clean_figs:
	rm -f ch_*/figs/*_SB.* ch_*/figs/*.pdf ch_*/figs/*.jpg ch_*/figs/*.gif icons/*_SB.*

clean_gifs:
	rm -f ch_*/figs/*.gif

clean_pngs:
	rm -f ch_*/figs/*.png


clean_pdfs:
	rm -f ch_*/figs/*.pdf

clean: clean_docs
	rm -f \
/tmp/* \
mbt* \
only.tex \
*.aux \
*.gif *.bbl *.dvi *.idx *.ilg *.ind *.out *.ist *.bak \
*.cb *.cb2 *.glo *.glg *.gls *.mtc* bu*.blg \
*.xref *.ps *.ent *.blg *.toc *.4ct *.4tc *.idv *.lg *.tmp *.css *.log *.lof *.lot *.ncx *.maf book_html*.gif zzbook* book_mobi*x.png book_htmlch*.html book_htmlap*.html book_htmlli*.html \
book_*.{ps,ent,blg,toc,4ct,4tc,xref,idv,lg,tmp,css,lof,lot,lg,xref,ncx,maf} \
book_html*.gif zzbook* book_mobi*x.png \
book_html{ch,ap,li}*.html
	find . -name '*.bak' -or -name '*~' -or -name '*.log' -or -name '*.aux' | xargs rm -f

