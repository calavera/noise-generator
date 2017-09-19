require "fileutils"

FileUtils.mkdir_p "dist"

def generate_files
  base = [
    "/index.html",
    "/contact.html",
    "/complexity-of-a-cell.htm",
    "/about/index.html",
    "/css/vendor/lib.css",
    "/css/main.css",
    "/docs/learn.html",
    "/docs.html",
    "/blog/index.htm",
    "/_redirects",
    "/blogging/industry.html",
    "/blogging/industry/something.html"
  ]

  index = File.open("dist/index.html", "w+")
  1000.times do |i|
    root = (1..10).to_a.sample(10).join("/")
    FileUtils.mkdir_p("dist/#{root}")

    base.each do |k|
      path = "/#{root}#{k}"
      data = k*i

      dir = "dist/#{File.dirname(path)}"

      FileUtils.mkdir_p(dir)
      File.open("dist#{path}", "w+") {|f| f.puts data}
      index.puts %Q{<a href="#{path}">#{path}</a>}
    end
  end
  index.close
end

generate_files
