class Todo < ApplicationRecord
  enum status: {pending: 0, done: 1}

  validates :title, presence: true,
    length: {
      maximum: 45,
      minimum: 1
    }
  validates :created_by, presence: true,
    length: {
      maximum: 45,
      minimum: 1
    }
end
