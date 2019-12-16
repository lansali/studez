require 'elasticsearch/model'

class Opportunity < ApplicationRecord
  belongs_to :business
  has_many :submissions, dependent: :destroy

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
