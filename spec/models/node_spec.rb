# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Node, type: :model do
  describe 'Fields' do
    it { is_expected.to have_field(:tree_id).of_type(String) }
    it { is_expected.to have_field(:ext_id).of_type(Integer) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:parent) }
    it { is_expected.to have_many(:childs) }
  end
end
