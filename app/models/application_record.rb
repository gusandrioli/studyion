class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def body_lines
    self.body.split("\n")
  end
end
