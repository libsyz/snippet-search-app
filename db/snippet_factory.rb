
NAMES_TO_MASK = ['Frederic', 'Tiago', 'Eric', 'Janette', 'Jonas', 'Deborah', 'Manuela', 'Sandra', 'Sammy', 'Praveen', 'Vincenzo', 'Shafik', 'Anneline', 'Vincent', 'Audrey', 'Mario', 'Hatem', 'Aly', 'Nora', 'Joao', 'Simon', 'Paula', 'Christoph', 'Sebastian', 'Attila', 'Laetitia', 'Duncan', 'Charl', 'Tiffany', 'Filipe', 'Patrick', 'Toni', 'Frank', 'Kenon', 'Kenan', 'Ulrich', 'Guido', 'Giorgos']

class SnippetFactory
  def initialize(strengths, aods)
    @strengths = strengths
    @aods = aods
  end

  def create_strengths
    snippet_factory(@strengths, "strength")
  end

  def create_aods
    snippet_factory(@aods, "area of development")
  end

  def clean_header_snippets
    Snippet.where(content: "Snippet").destroy_all
  end

  def clean_snippets
    clean_database
  end

  private

  def snippet_factory(sheet, strength_or_aod)
    puts "creating a #{strength_or_aod} collection"
    sheet.each(snippet: 'Snippet',
             competency: 'Competency',
             exercise_type: 'Context') do |record|
             create_snippet(record, strength_or_aod)
    end
  end

  def create_snippet(record, strength_or_aod)
    snippet_content = mask_snippet(record[:snippet], NAMES_TO_MASK)
    Snippet.create(content: snippet_content,
                   exercise_type: record[:exercise_type],
                   competency: record[:competency],
                   content_type: strength_or_aod )
  end

  def mask_snippet(snippet_text, names_to_mask)
  names_to_mask.each do |name|
    snippet_text = snippet_text.gsub name, "Participant" if snippet_text.include? name
    end
  snippet_text
  end

  def clean_database
    Snippet.destroy_all
  end


end
