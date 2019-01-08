class Search < ApplicationRecord
  belongs_to :user

  def params_of_filtr
    attributes.except("id", "user_id", "created_at", "updated_at" ).map {|key, object| {"#{key}": object.to_s}}.reduce(:merge)
  end


end
