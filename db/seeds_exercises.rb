ruby = Language.find_by_name("Ruby")
ruby.exercises.create(title: "Hello World", description: "The classical introductory exercise. Just say \"Hello, World!\"", instruction: "The classical introductory exercise. Just say \"Hello, World!\"

\"Hello, World!\" is the traditional first program for beginning programming in a new language or environment.

The objectives are simple:

Write a function that says \"Hello, World!\".
Run the test suite and make sure that it succeeds.
Submit your solution and check it at the website.
If everything goes well, you will be ready to fetch your first real exercise.

For installation and learning resources, refer to the exercism help page.

For running the tests provided, you will need the Minitest gem. Open a terminal window and run the following command to install minitest:

1
gem install minitest
If you would like color output, you can require 'minitest/pride' in the test file, or note the alternative instruction, below, for running the test file.

In order to run the test, you can run the test file from the exercise directory. For example, if the test suite is called hello_world_test.rb, you can run the following command:

1
ruby hello_world_test.rb
To include color from the command line:

1
ruby -r minitest/pride hello_world_test.rb
The test files may have the execution bit set so you may also be able to run it like this:

1
./hello_world_test.rb
Source

This is an exercise to introduce users to using Exercism http://en.wikipedia.org/wiki/%22Hello,world!%22program

Submitting Incomplete Problems

It's possible to submit an incomplete solution so you can see how others have completed the exercise.")



