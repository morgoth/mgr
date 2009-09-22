require "rake/clean"

task :default => [:evince]

SH_OUTPUT_FILE = "environment_setup.sh"
SRC = "mgr.tex"
RUBY_SRC = FileList["listing/*.rb"]
ERB_SRC = FileList["listing/*.rhtml"]
HTML_SRC = FileList["listing/*.html"]
SVG_IMG =  FileList["**/*.svg"]
HAML_SRC = FileList["listing/*.haml"]
SASS_SRC = FileList["listing/*.sass"]
SH_SRC = FileList["listing/*.sh"]
CUC_SRC = FileList["listing/*.feature"]

CLEAN.include(%w(*.toc *.aux *.log *.lof *.bbl *.blg *.out *.snm *.vrb *.nav),
              RUBY_SRC.ext("tex"),
              ERB_SRC.ext("tex"),
              HTML_SRC.ext("tex"),
              SVG_IMG.ext("png"),
              HAML_SRC.ext("tex"),
              SASS_SRC.ext("tex"),
              SH_SRC.ext("tex"),
              CUC_SRC.ext("tex"))

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

rule ".tex" => ".sass" do |t|
  sh "pygmentize -f latex -o #{t.name} #{t.source}"
end

rule ".tex" => ".feature" do |t|
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

file SRC.ext("pdf") => [SRC] + RUBY_SRC.ext("tex") + ERB_SRC.ext("tex") + SASS_SRC.ext("tex") + HAML_SRC.ext("tex") + HTML_SRC.ext("tex") + SH_SRC.ext("tex") + CUC_SRC.ext("tex") + SVG_IMG.ext("png")

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

desc "Create sh script from pieces"
task :sh do
  generate_sh_script
  puts "Finished generating file #{SH_OUTPUT_FILE}"
end

def generate_sh_script
  File.open("#{SH_OUTPUT_FILE}", "w") do |f|
    f.puts "#!/bin/sh\n"
    SH_SRC.sort.each do |script|
      f.puts File.open(script, "r") { |ff| ff.read }
    end
  end
end