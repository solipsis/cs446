#!/usr/bin/ruby

require 'rack'
require 'csv'
require 'ERB'

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
				loadBooks(response, @filename)
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
		#puts ERB.new(File.read("form.html.erb")).result(binding)
		#ERB.new(File.read("form.html.erb")).result(binding)
		#response(ERB.new(File.read("form.html.erb")).result(binding))
		# response.write('<form name="input" action="http://localhost:8080/list" method="get">')
		# response.write('<select name="sort">')
		# response.write('<option value="title">Title</option>')
		# response.write('<option value="author">Author</option>')
		# response.write('<option value="language">Language</option>')
		# response.write('<option value="year">Year</option>')
		# response.write('</select>')
		# response.write('<input type="submit" value="display list">')
		# response.write('</form>')
	end

	# draws the html table with the book info
	def drawTable(response, request)
		response.write(ERB.new(File.read("list.html.erb")).result(binding))
		# sortBy = request.GET["sort"]
		# @books = @books.sort_by { |x| x[:"#{sortBy}"]}

		# response.write("<table>")
		# response.write("<tr>")
		# response.write("<td>Rank</td>")
		# response.write("<td>Title</td>")
		# response.write("<td>Author</td>")
		# response.write("<td>Language</td>")
		# response.write("<td>Year</td>")
		# response.write("<td>Copies</td>")
		# response.write("</tr>")
		# @books.each do |book|
		# 	response.write("<tr>")
		# 	response.write("<td>#{book[:rank]}</td>")
		# 	response.write("<td>#{book[:title]}</td>")
		# 	response.write("<td>#{book[:author]}</td>")
		# 	response.write("<td>#{book[:language]}</td>")
		# 	response.write("<td>#{book[:year]}</td>")
		# 	response.write("<td>#{book[:copies]}</td>")
		# 	response.write("</tr>")
		# end
		# response.write("</table>")
	end


	# reads the list of books from a comma separated file
	def loadBooks(response, filename)
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
