Just a little code to solve a programming challenge given as
an example interview question. The question:

  "We are looking for a solution that is compact and runs quickly. What quickly means to us depends on the language you use, but it should take no longer than 500 milliseconds to run. Please use what language you are most comfortable with. However, please know that we do not have Visual Studio so C++ solutions should have the ability to compile with the standard G++.
  Problem:

  Consider a word as any sequence of capital letters A-Z, not limited to just dictionary words. For any word with at least two different letters there are other words composed of the same letters but in a different order. For instance, stationarily and antiroyalist, which happen to both be dictionary words. For our purpose alianrostily is also a word composed of the same letters as these two. We can then assign a number to every word based on where it falls within an alphabetically sorted list of all words made up of the same set of letters.

  One way to do this would be to generate the entire list of words and then find the desired ones, but this would be slow if the word is long. Write a program that takes a word as a command line argument and prints to standard output its number. Do not use the method above of generating the entire list. Your program should be able to accept any word 25 letters or less in length possibly with some letters repeated. It should use no more than 1 gig of memory and take no more than 500 milliseconds to run."

Note that I am using Ruby, not C++ or any of the presumably expected languages for this solution.