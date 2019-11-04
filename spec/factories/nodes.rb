# frozen_string_literal: true

FactoryBot.define do
  # creating a single node without parent and child
  factory :singleton, class: 'Node' do
    sequence(:ext_id) { |n| n }

    # creating a node having one parent and childs_count(default: 1) childs
    factory :node do
      transient do
        childs_count { 1 }
      end

      association :parent, factory: :singleton

      after :create do |node, options|
        create_list :singleton, options.childs_count, parent: node
      end
    end

    # creating a tree with size(default 2) depth
    factory :tree do
      transient do
        size { 2 }
        childs_count { 1 }
      end
      after :create do |node, options|
        create(:tree, parent: node, size: (options.size - 1), childs_count: options.childs_count) if options.size.positive?
        create_list :singleton, options.childs_count - 1, parent: node
      end
    end
  end
end
