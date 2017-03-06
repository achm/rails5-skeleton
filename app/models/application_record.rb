class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  use_switch_point :base
end
