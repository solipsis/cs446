#!/usr/bin/ruby

require 'rack'
require 'csv'

class BookTable
	
	def initialize()
    	@filename = "bookList.csv"
		@books = []
		#loadBooks(filename)	
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new

		File.open("header.html", "r") { |head| response.write(head.read) }
		case env["PATH_INFO"]
			when /\/table.*/
				loadBooks(response, @filename)
				drawTable(response)
				response.write("tahoeunatuhinta \n \n")
				response.write(@books.at(0))
				#printBooks(response)
				response.write("hello")
			when /\/crazy.*/
        		# serve up the form
        		render_crazy(request, response)	
			else
        		[404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      	end	# end case

      	response.finish

	end

	# draws the html table with the book info
	def drawTable(response)
		response.write("<table>")
		response.write("<tr>")
		response.write("<td>Rank</td>")
		response.write("<td>Title</td>")
		response.write("<td>Author</td>")
		response.write("<td>Language</td>")
		response.write("<td>Year</td>")
		response.write("<td>Copies</td>")
		response.write("</tr>")
		@books.each do |book|
			response.write("<tr>")
			response.write("<td>#{book[:rank]}</td>")
			response.write("<td>#{book[:title]}</td>")
			response.write("<td>#{book[:author]}</td>")
			response.write("<td>#{book[:language]}</td>")
			response.write("<td>#{book[:year]}</td>")
			response.write("<td>#{book[:copies]}</td>")
			response.write("</tr>")
		end
		response.write("</table>")
	end


	# reads the list of books from a comma separated file
	def loadBooks(response, filename)
		response.write("in load")
		CSV.foreach(File.path(filename)) do |col|
			book = {}
			book[:title] = col[0]
			book[:author] = col[1]
			book[:language] = col[2]
			book[:year] = col[3]
			book[:copies] = col[4]
			@books.push(book)
		end
		@books = @books.sort_by { |x| x[:copies].to_i }.reverse
		x = 1
		@books.each do |book|
			book[:rank] = x
			x = x + 1
		end

	end

	

end

Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run BookTable.new, :Port => 8080
