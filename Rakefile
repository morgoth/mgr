require "rake/clean"

task :default => [:evince]

SRC = "mgr.tex"
RUBY_SRC = FileList["**/*.rb"]
ERB_SRC = FileList["**/*.rhtml"]
HTML_SRC = FileList["**/*.html"]
SVG_IMG =  FileList["**/*.svg"]
HAML_SRC = FileList["**/*.haml"]
SH_SRC = FileList["**/*.sh"]

CLEAN.include(%w(*.toc *.aux *.log *.lof *.bbl *.blg *.out *.snm *.vrb *.nav),
              RUBY_SRC.ext("tex"),
              ERB_SRC.ext("tex"),
              HTML_SRC.ext("tex"),
              SVG_IMG.ext("png"),
              HAML_SRC.ext("tex"),
              SH_SRC.ext("tex"))

CLOBBER.include(%w(pdf dvi ps).collect { |e| SRC.ext(e) })

def pdflatex(source)
  sh "pdflatex -interaction=nonstopmode #{source}"
end

def bibtex(source)
  sh "bibtex #{source.ext("")}"
end

rule ".png" => ".svg" do |t|
  sh "inkscape -e #{t.name} #{t.source}"
end

rule ".tex" => ".rb" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".rhtml" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".haml" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".sh" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".html" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".pdf" => ".tex" do |t|
  pdflatex(t.source)
  bibtex(t.source)
  pdflatex(t.source)
  pdflatex(t.source)
end

file SRC.ext("pdf") => [SRC] + RUBY_SRC.ext("tex") + ERB_SRC.ext("tex") + HAML_SRC.ext("tex") + HTML_SRC.ext("tex") + SH_SRC.ext("tex") + SVG_IMG.ext("png")

desc "Compile PDF"
task :pdf => SRC.ext("pdf")

desc "Show compiled PDF in Evince."
task :evince => :pdf do
  sh "evince #{SRC.ext("pdf")}"
end

desc "Debug compilation"
task :debug => [RUBY_SRC.ext("tex")] do |t|
  latex SRC
end
