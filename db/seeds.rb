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

Snippet.destroy_all

seed_file = Roo::Spreadsheet.open('./Book1.xlsx')

strengths = seed_file.sheet('strengths')
weaknesses = seed_file.sheet('aods')


# Snippet Factory

def snippet_factory(sheet)
  sheet.each(snippet: 'Snippet',
               competency: 'Competency',
               exercise_type: 'Context') do |record|

  Snippet.create(content: record[:snippet],
                 exercise_type: record[:context],
                 competency: record[:competency] )
  end
end


# Create Strengths Snippets
puts "Creating Strengths"

snippet_factory(strengths)

# Create Areas of Development
puts "Creating Strengths"
snippet_factory(weaknesses)


puts "Done - Created #{ Snippet.all.count } snippets"

