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



Snippet.destroy_all

seed_file1 = Roo::Spreadsheet.open('./Book1.xlsx')
seed_file2 = Roo::Spreadsheet.open('./Book1.xlsx')

strengths = seed_file1.sheet('strengths')
weaknesses = seed_file2.sheet('aods')
NAMES_TO_MASK = ['Frederic', 'Tiago', 'Eric', 'Janette', 'Jonas', 'Deborah', 'Manuela', 'Sandra', 'Sammy', 'Praveen', 'Vincenzo', 'Shafik', 'Anneline', 'Vincent', 'Audrey', 'Mario', 'Hatem', 'Aly', 'Nora', 'Joao', 'Simon', 'Paula', 'Christoph', 'Sebastian', 'Attila', 'Laetitia', 'Duncan', 'Charl', 'Tiffay', 'Filipe', 'Patrick', 'Toni', 'Frank', 'Kenon', 'Kenan', 'Ulrich', 'Guido', 'Giorgos']

# Snippet Factory

def mask_snippet(snippet_text, names_to_mask)
  names_to_mask.each do |name|
    snippet_text = snippet_text.gsub name, "Participant" if snippet_text.include? name
end
  snippet_text
end



def snippet_factory(sheet, strength_or_aod)
  sheet.each(snippet: 'Snippet',
             competency: 'Competency',
             exercise_type: 'Context') do |record|
    snippet_content = mask_snippet(record[:snippet], NAMES_TO_MASK)
    Snippet.create(content: snippet_content,
                   exercise_type: record[:exercise_type],
                   competency: record[:competency],
                   content_type: strength_or_aod )
  end
end

puts "Creating Strengths"

snippet_factory(strengths, "strength")

puts "Creating Areas of Development"
snippet_factory(weaknesses, "area of development")

puts "Done - Created #{ Snippet.all.count } snippets"

