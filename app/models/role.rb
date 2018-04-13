class Role < ApplicationRecord
  scopify

  TYPE_UNDEFINED = 'undefined'
  TYPE_EXTERNALS = %w(consumer producer)

  has_and_belongs_to_many :users,
                          join_table: :users_roles
  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: {in: Rolify.resource_types},
            allow_nil: true
end
