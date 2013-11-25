class Project
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :x_name, type: String
  field :y_name, type: String
  field :data, type: Array
  belongs_to :user
end
