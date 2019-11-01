# frozen_string_literal: true

class Node
  include Mongoid::Document
  field :ext_id, type: Integer
  field :tree_id, type: String

  has_many :childs, class_name: 'Node', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Node', optional: true
end
