# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TreesController, type: :controller do
  let(:tree) { create :tree }

  describe '#show' do
    it 'shows an existing tree' do
      get :show, params: { tree_id: tree.tree_id }
      expect(response).to have_http_status(:ok)
    end

    it 'error on unexisting tree' do
      get :show, params: { tree_id: SecureRandom.uuid }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#parents' do
    it 'parents to root of existing node status' do
      get :parents, params: { tree_id: tree.tree_id, id: tree.childs.first.ext_id }
      expect(response).to have_http_status(:ok)
    end

    it 'parents to root of existing node' do
      get :parents, params: { tree_id: tree.tree_id, id: tree.childs.first.ext_id }
      expect('parents[0]').to match_json(tree.ext_id)
    end

    it 'count parents to root of existing node' do
      get :parents, params: { tree_id: tree.tree_id, id: tree.childs.first.ext_id }
      expect('length(parents)').to match_json(1)
    end

    it 'error on showing parents of unexisting node' do
      get :parents, params: { tree_id: SecureRandom.uuid, id: SecureRandom.uuid }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe '#childs' do
    it 'childs of existing node status' do
      get :childs, params: { tree_id: tree.tree_id, id: tree.ext_id }
      expect(response).to have_http_status(:ok)
    end

    it 'childs of existing node' do
      get :childs, params: { tree_id: tree.tree_id, id: tree.ext_id }
      expect('childs[0]').to match_json(tree.childs.first.ext_id)
    end

    it 'error on showing childs of unexisting node' do
      get :childs, params: { tree_id: SecureRandom.uuid, id: SecureRandom.uuid }
      expect(response).to have_http_status(:not_found)
    end
  end
end
