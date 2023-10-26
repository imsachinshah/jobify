module JobsHelper

	def truncate(string, max)
  	string.length > max ? "#{string[0...max]} ... more" : string
	end

end
