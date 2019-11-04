# frozen_string_literal: true

class TreesController < ApplicationController
  before_action :set_node, only: %i[parents childs]

  def show
    tree = Node.find(id: params[:tree_id])
    render json: tree.to_h
  end

  def parents
    render json: { parents: @node.parents.pluck(:ext_id) }
  end

  def childs
    render json: { childs: @node.childs.pluck(:ext_id) }
  end

  private

  def set_node
    @node = Node.where(tree_id: params[:tree_id]).find_by(ext_id: params[:id])
  end
end
