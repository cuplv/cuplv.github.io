# Description of the programming task

The programming task consists of a program that automatically suggests improvements to Java source code on GitHub.

The program should be implemented as a GitHub app to conveniently receive pull request events from a GitHub repository.

The program will run on every new pull request on a repository and will analyze the source code changed in the pull request. 

For each file changed in the pull request the analysis will find the following issues.

1. Long identifiers: any identifier longer than 20 characters.

2. Shadowing of fields: a local variable in a method that shadows (has the same name of) a field of the class containing the method.

3. Unused local variable: a local variables that is declared in a method but it is never used.


The program will report all the found issues in a pull request comment specifying for every issue the name of the java file, the line of code containing the issue, and the line number.


## Submission instruction

Share the following information when applying for the position:

- The link to a GitHub repository containing all the source code of your solution (the repository should be public, so we can access it).

- How to access a deployed version of the GitHub app (you can use the free versions of a cloud computing platform, e.g., Amazon Web Services, Google Cloud, Heroku, ..., to host your service).

  
## What do we value

- Properly documented code: here should be enough documentation to understand the architecture of the code and what it does.

- Test cases: have a set of unit tests set up for the various functionalities.

- Code versioning system best practices, such as the GitFlow (https://datasift.github.io/gitflow/IntroducingGitFlow.html)

- Use the Scala programming language (which is already used in several of our projects).

- Reproducible deployment: have a reproducible deployment, for example using Docker.


## How to start

You can use any existing library to create the project. Some useful link to gather more information about GitHub apps and the GitHub APIs are:

- GitHub app: https://developer.github.com/apps/about-apps/

- Tutorial on GitHub app: https://developer.github.com/apps/building-your-first-github-app/

- GitHub APIs: https://developer.github.com/v4/

## Contact
Any additional information about the task can be asked by email to evan.chang@colorado.edu and sergio.mover@polytechnique.edu

