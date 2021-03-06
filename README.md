# student-records

## Requirements
* jruby
* make, javac, and jar
* rspec

## Running tests
1. make
2. jruby -S gem install bundler
3. bundler install
4. rpsec

## How to run
1. Build the java archive by running make
2. Run students.rb
  * The program expects 3 data files named and formatted as follows
        * comma.txt
            * Delimiter: `,`
            * Order: `last_name`, `first_name`, `campus`, `favorite_color`, `date_of_birth`

        * dollar.txt
            * Delimiter: `$`
            * Order: `last_name`, `first_name`, `middle_initial`, `campus`, `date_of_birth`, `favorite_color`

        * pipe.txt
            * Delimiter: `|`
            * Order: `last_name`, `first_name`, `middle_initial`, `campus`, `favorite_color`, `date_of_birth`

## Design considerations
There are 3 main things to do in this problem, read in the records, sort
them, and then print them back out. So, I made 3 classes to handle those
3 things as well as a Student class to hold the data for each record.

Sorting and printing are fairly
straight forward.  There's a rub with the reading because of the
different file formats and column orderings.  To map the different
formats together I made some constants that defined where the fields
were ordered in each file, and then rearranged them before putting them
into the Student class.  The different date formats get handled in the
Student class by coercing strings into a date format and then back to a
string.

## Trouble spots
1. When creating the java student class, getting that imported to be
used by the rest of the program took quite a while.  Then, after reading
a few stackoverflow articles it dawned on me that I needed to compile
the .java file into a jar and then I could require it into the rest of
the ruby program.

2. Getting RSpec installed.  Turns out that jruby I have installed via
   rvm (jruby-9.0.5) really does not like to use IPv6 with its gem
installer.  I kept getting ssl session timeouts.  That required a bit of configuring my home network and laptop to try and get rid my IPv6 nameservers in resolv.conf.  Finally figured out that it was service called rdnssd which likes to find all the IPv6 nameservers it can and put them in your resolv.conf.  Once that
got disabled and IPv4 nameservers back in resolv.conf, installing the
bundler gem and then the rspec bundle worked.

## Next steps
1. refactor the student_record_reader class.  I'd probably make a parser
   class for each delimeter types and let them get dynamically chosen as
the data files are being parsed.
2. Add some optparsing to students.rb so it is not only able to parse
   those 3 filenames.
3. Flesh out the unit tests for the student_record_reader

## Conclusion
This was a reasonable little project.  Had a good time going through all
the ruby docs figuring out the Date class worked and how to call a sort
function on an Array type.  The java incorporation is pretty slick and
makes me want to do some refreshment of my java knowledge.

