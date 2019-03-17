# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    # t.text "content"
    # t.string "type"
    # t.string "client"
    # t.string "competency"

require 'roo'
require 'yaml'
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
