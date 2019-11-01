# frozen_string_literal: true

class Node
  include Mongoid::Document
  field :ext_id, type: Integer

  has_many :childs, class_name: 'Node', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Node', optional: true
end
