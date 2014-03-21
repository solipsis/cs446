#!/usr/bin/ruby

require 'rack'
require 'csv'
require 'ERB'
require 'sqlite3'

class BookTable
	
	def initialize()
    	@filename = "bookList.csv"
		@books = []
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
		@books = []

		File.open("header.html", "r") { |head| response.write(head.read) }
		case env["PATH_INFO"]
			when /.*?\.css/
        		# serve up a css file
        		# remove leading /
        		file = env["PATH_INFO"][1..-1]
        		return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
			when /\/list.*/
				drawTable(response, request)
				
			when /\/form.*/
        		# serve up the form
        		render_form(response)	
			else
        		[404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      	end	# end case

      	File.open("footer.html", "r") { |foot| response.write(foot.read)}
      	response.finish

	end


	def render_form(response)
		response.write(ERB.new(File.read("form.html.erb")).result(binding))
		
	end

	# draws the html table with the book info
	def drawTable(response, request)
		response.write(ERB.new(File.read("list.html.erb")).result(binding))
		
	end


end

Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run BookTable.new, :Port => 8080
