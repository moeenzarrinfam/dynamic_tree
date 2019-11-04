# frozen_string_literal: true

class Node
  include Mongoid::Document
  field :ext_id, type: Integer
  field :tree_id, type: String

  after_create :set_tree_id

  has_many :childs, class_name: 'Node', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Node', optional: true

  def parents(prev_parents = [])
    parent.present? ? parent.parents(prev_parents.push(parent)) : prev_parents
  end

  def to_h
    { id: ext_id, child: childs.map(&:to_h) }
  end

  def set_tree_id
    update_attributes tree_id: (parent_id.present? ? parent.tree_id : _id) unless tree_id.present?
  end
end
