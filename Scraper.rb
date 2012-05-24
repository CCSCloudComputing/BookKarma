#Kevin Wojcik
#CCS CS 130a
#Spring 2012

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'seed-fu'

URL = "http://www.slugbooks.com"


#Scrape a course from a relative URL
def scrape_course(course_url, writer, course)
	begin
        	#Get the course specific web page
        	course_doc = Nokogiri::HTML(open(URL + course_url))
	rescue Exception => e
		puts "Error in scrape_course(" + URL + course_url + ")"
		puts e
		return nil
	end

        #Go through each book for the course
        course_doc.css(".first").each do |book|
                #Some non books use the same CSS class so we need to filter those
                if book.at_css(".title") != nil

                        #All the attributes for a specific book
                        children = book.element_children()

                        #Parse and print out the URL for the image of the book
                        url = children[0].css('img')[0]['src']

                        #Parse and print out the name of the book
                        title = children[1].text.gsub(/\s+/, ' ')[0, children[1].text.index("|") - 1]

                        #Parse and print out the author of the book
                        author =  children[3].text[4, children[3].text.length].gsub(/\s+/, ' ')

                        #Parse and print out the ISBN of the book
                        isbn = children[4].text[6, 13].gsub(/\s+/, ' ') + "\n\n"

			#Prints the info
			puts url
			puts title
			puts author
			puts isbn
		
			writer.add( :course => course, :title =>title, :author => author, :isbn => isbn, :url => url)
                end
        end
end

#Scrapte a department from a relative URL
def scrape_department(department_url, writer)
 	begin
        	#Open the web page for a particular department
        	department_doc = Nokogiri::HTML(open(URL + department_url))
	rescue Exception => e
		puts "Error in scrape_department(" + URL + department_url + ")"
		puts e
		return nil
	end
	        #Go through all courses in that department
        	department_doc.css(".middleclasslinks").css('li').each do |course|

              		#Print the name of the course
               		coursename = course.text.gsub(/\s+/, ' ').strip

                	#Build the new URL for the course
                	course_url = course.css('a')[0]['href']

                	#Scrape the course
                	scrape_course(course_url, writer, coursename)
        	end

end

#Scrape a school from a relative URL
def scrape_school(school_url)
	begin
        	#Open the page for a particular school
        	school_doc = Nokogiri::HTML(open(URL + school_url))
	rescue Exception => e
		puts "Error in scrape_school(" + URL + school_url + ")"
		puts e
		return nil
	end
	

	SeedFu::Writer.write('db/fixtures/seed_script_' + school_url.gsub('/', '...') + '.rb', :class_name => 'Book') do |writer|
        	#Go through each department at a school
        	school_doc.css(".bottomlinks").css('li').each do |department|

    	        	#Print the name of the department
       	        	#puts department.text.gsub(/\s+/, ' ').strip

                	#Build the new URL for the department
               		department_url = department.css('a')[0]['href']

                	#Scrape the Department
                	scrape_department(department_url, writer)
		end
        end
end

#Scrapte a state from a relative URL
def scrape_state(state_url)
	begin
        	#Open the page for a particular state
        	states_doc = Nokogiri::HTML(open(URL + state_url))
	rescue Exception => e
		puts "Error in scrape_state(" + URL + state_url + ")"
		puts e
		return nil
	end

        #Go through each school in the state
        states_doc.css(".middlelinks").css('li').each do |school|
                #Print out the name of the school
                #puts school.text.gsub(/\s+/, ' ').strip

                #Build the new URL for the school
                school_url = school.css('a')[0]['href']

                #Scrape the school
                scrape_school(school_url)
        end
end

#Scrape all of slugbooks
def scrape_all(url)
        begin	
		#Open the web page
        	doc = Nokogiri::HTML(open(url))
	rescue Exception => e
		puts "Error in scrape_all(" + url + ")"
		puts e.text
	end
	
        #Get all the URLS at the bottom of the page, each representing a US state
        doc.css(".bottomlinks").css('li').each do |state|
                #Print out the name of the State
                #puts state.text.gsub(/\s+/, ' ').strip

                #Build the new URL from the base and the one listed in the <a href="..."/>
                state_url = state.css('a')[0]['href']

                #Scrape the state
                scrape_state(state_url)
        end
end

#Help message for the command line
HELP = "[-state url_for_state] Parses only data for that specific state
[-school url_for_school] Parses only data for the school. Takes precedence over state
[-department url_for_department] Parses only data for the department. Takes precedence over school
[-course url_for_course] Parses only data for the course. Takes precedence over department\n"

#Stores the URLs for the specific request if used
command_line_state = nil
command_line_school = nil
command_line_department = nil
command_line_course = nil

#Check for the -h argument
if ARGV.length == 1 and ARGV[0] == "-h"
	puts HELP
	exit
end

#Check to make sure that we have pairs of arguments
if ARGV.length % 2 != 0
	puts "Bad parameters"
	exit
end

#Parse command line arguments
ARGV.each_index do |i|
	if i % 2 == 1
		next
	end

	if ARGV[i] == "-state"
		command_line_state = ARGV[i+1]
	elsif ARGV[i] == "-school"
		command_line_school = ARGV[i+1]
	elsif ARGV[i] == "-department"
		command_line_department = ARGV[i+1]
	elsif ARGV[i] == "-course"
		command_line_course = ARGV[i+1]
	else
		puts "Unknown parameter " + ARGV[i]
		exit
	end
	
end

#Do the requested scrape
	if command_line_course != nil
		scrape_course(command_line_course, writer, course)
	elsif command_line_department != nil
		scrape_department(command_line_department, writer)
	elsif command_line_school != nil
		scrape_school(command_line_school)
	elsif command_line_state != nil
		scrape_state(command_line_state)
	else
		scrape_all(URL)


end
