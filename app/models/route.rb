class Route < ActiveRecord::Base
	validates :name, presence: true
	default_scope { where("archived IS false") }

	def archive
		self.archived = true
		self.archived_on = Time.now
		self.save
	end
end
