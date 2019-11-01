# frozen_string_literal: true

Rails.application.routes.draw do
  get ':tree_id/parent/:id', to: 'trees#parents'
  get ':tree_id/child/:id', to: 'trees#childs'
  get ':tree_id', to: 'trees#show'
end
