class Recipe < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_ingredients,
                  against: { ingredients: 'A' },
                  using: {
                    tsearch: {
                      dictionary: 'english', tsvector_column: 'searchable'
                    }
                  }

  validates :title, presence: true

  def as_json(options = {})
    super(options.merge({ except: [:searchable] }))
  end
end
