#Kevin Wojcik
#CCS CS 130a
#Spring 2012

require 'rubygems'
require 'nokogiri'
require 'open-uri'

only_california = true
only_ucsb = true
only_cs = true

#URL base for scrapeing
url = "http://www.slugbooks.com"

#Open the web page
doc = Nokogiri::HTML(open(url))

#Get all the URLS at the bottom of the page, each representing a US state
doc.css(".bottomlinks").css('li').each do |state|
	#Print out the name of the State
	#puts state.text.gsub(/\s+/, ' ').strip

	#Build the new URL from the base and the one listed in the <a href="..."/>
	state_url = url + state.css('a')[0]['href']

	#Elimate a lot of the spam
	if only_ucsb and state_url != "http://www.slugbooks.com/California-College-Textbooks.html"
		next
	end

	#Open the page for a particular state
	states_doc = Nokogiri::HTML(open(state_url))
	
	#Go through each school in the state
	states_doc.css(".middlelinks").css('li').each do |school|
		#Print out the name of the school
		#puts school.text.gsub(/\s+/, ' ').strip

		#Build the new URL for the school
		school_url = url + school.css('a')[0]['href']

		#Eliminate spam from non-uscb schools
		if only_ucsb and school_url != "http://www.slugbooks.com/UCSB/UCSB-Textbooks.html"
			next
		end

		#Open the page for a particular school
		school_doc = Nokogiri::HTML(open(school_url))
		
		#Go through each department at a school
		school_doc.css(".bottomlinks").css('li').each do |department|
			
			#Print the name of the department
			#puts department.text.gsub(/\s+/, ' ').strip
			
			#Build the new URL for the department
			department_url = url + department.css('a')[0]['href']
			
			#Eliminate spam from non-cs departments
			if only_cs and department_url != "http://www.slugbooks.com/UCSB/Computer-Science-Class-Textbooks.html"
				next
			end

			#Open the web page for a particular department
			department_doc = Nokogiri::HTML(open(department_url))

			#Go through all courses in that department
			department_doc.css(".middleclasslinks").css('li').each do |course|

				#Print the name of the course
				puts course.text.gsub(/\s+/, ' ').strip

				#Build the new URL for the course
				course_url = url + course.css('a')[0]['href']
				
				#Get the course specific web page
				course_doc = Nokogiri::HTML(open(course_url))

				#Go through each book for the course
				course_doc.css(".first").each do |book|
					#Some non books use the same CSS class so we need to filter those
					if book.at_css(".title") != nil

						#All the attributes for a specific book
						children = book.element_children()
						
						#Parse and print out the URL for the image of the book
						puts url + children[0].css('img')[0]['src']

						#Parse and print out the name of the book
						puts children[1].text.gsub(/\s+/, ' ')[0, children[1].text.index("|") - 1]

						#Parse and print out the author of the book
						puts children[3].text[4, children[3].text.length].gsub(/\s+/, ' ')

						#Parse and print out the ISBN of the book
						puts children[4].text[6, 13].gsub(/\s+/, ' ') + "\n\n"
					end
				end
			end
		end
	end
end

