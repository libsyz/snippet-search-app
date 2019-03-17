
require 'roo'
require_relative 'snippet_factory'

# Instantiated in different variables to avoid weird behavior
seed_file1 = Roo::Spreadsheet.open('./Book1.xlsx')
seed_file2 = Roo::Spreadsheet.open('./Book1.xlsx')

strengths = seed_file1.sheet('strengths')
weaknesses = seed_file2.sheet('aods')

snippet_factory = SnippetFactory.new(strengths = seed_file1, aods = seed_file2)

snippet_factory.clean_snippets
snippet_factory.create_strengths
snippet_factory.create_aods
snippet_factory.clean_header_snippets

puts "Done - Created #{ Snippet.all.count } snippets"
