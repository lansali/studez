class Opportunity < ApplicationRecord
  belongs_to :business
  has_many :submissions, dependent: :destroy

  redi_search schema: {
    name: { text: { phonetic: "dm:en" } },
    category: { text: { phonetic: "dm:en" } },
    location: { text: { phonetic: "dm:en" } }
  }
end
