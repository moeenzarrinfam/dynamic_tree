# frozen_string_literal: true

class TreesController < ApplicationController
  def show
    render json: {}, status: '501'
  end

  def parents
    render json: {}, status: '501'
  end

  def childs
    render json: {}, status: '501'
  end
end
