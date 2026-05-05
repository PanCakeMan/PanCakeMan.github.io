# generate_publications.rb
require 'yaml'
require 'fileutils'

publications = [
  {
    title: "Generating Skyline Datasets for Data Science Models",
    authors: "Mengying Wang, Hanchao Ma, Yudian Bian, Yifan Fan, and Yinghui Wu",
    date: "2025-01-01",
    venue: "EDBT",
    category: "conferences"
  },
  {
    title: "ModsNet: Performance-Aware Top-k Model Search Using Exemplar Datasets",
    authors: "Mengying Wang, Hanchao Ma, Shiyu Guan, Yudian Bian, Haoran Che, Ankit Daundkar, Arda Sehirlioglu, and Yinghui Wu",
    date: "2024-08-01",
    venue: "VLDB",
    category: "conferences"
  }
  # ... more publications
]

FileUtils.mkdir_p("_publications")

publications.each do |pub|
  filename = "_publications/#{pub[:date]}-#{pub[:title].downcase.gsub(/[^a-z0-9]+/, '-')}.md"

  content = "---\n"
  content += "title: \"#{pub[:title]}\"\n"
  content += "authors: \"#{pub[:authors]}\"\n"
  content += "collection: publications\n"
  content += "category: #{pub[:category]}\n"
  content += "date: #{pub[:date]}\n"
  content += "venue: '#{pub[:venue]}'\n"
  content += "---\n\n"
  content += "## Abstract\n\n[Your abstract here]\n"

  File.write(filename, content)
  puts "Created: #{filename}"
end