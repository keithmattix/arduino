class DataValue
  include Mongoid::Document
  include Mongoid::Timestamps
  field :value, type: Integer
  belongs_to :project
end
