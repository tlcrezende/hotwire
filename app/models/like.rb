class Like < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :fish_catch, counter_cache: true

  after_create_commit -> {
    broadcast_update_later_to 'activity', target: "#{dom_id(self.fish_catch)}_likes_count", html: self.fish_catch.likes_count
  }

  after_destroy_commit -> {
    broadcast_update_later_to 'activity', target: "#{dom_id(self.fish_catch)}_likes_count", html: self.fish_catch.likes_count, locals: { like: nil }
  }
end
