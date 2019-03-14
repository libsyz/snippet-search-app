class Snippet < ApplicationRecord
    include PgSearch
    pg_search_scope :global_search,
                     against: [:content, :exercise_type, :competency, :content_type],
    using: {
      tsearch: { prefix: true }
    }
end
