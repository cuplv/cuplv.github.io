![CUPLV Logo](../pics/logo/cuplv-logo-72ppi_rectangle-gold-text.png)

# Position: Research Software Engineer

## Job Description

The Programming Languages and Verification Group at the University of Colorado Boulder (CUPLV) is looking for candidates for a full-time research software engineer position. This position presents a unique opportunity for bridging academic research with industrial application in collaboration with GitHub.

The research software engineer will work on a technology transfer task collaborating with professors [Bor-Yuh Evan Chang], [Sriram Sankaranarayanan], and [Sergio Mover], as well as engineers from GitHub.

The project consists of re-engineering and extending the research prototype of [BigGroum] to be available to real developers in GitHub. BigGroum is a platform that mines software repositories to learn how to use API libraries and then use the learned artifacts to help software developers by, for example, automatically suggesting code fixes. The final deliverable of the project is a new prototype of the tool that can be made available to open source developers, that scale on large software repositories, is robust and extensible, and has new functionalities (e.g., supports the mining of software repositories containing multiple programming languages).

We are looking for a motivated software engineer that is excited to learn and understand new algorithms and techniques, and further extend them be usable in a real, industrial setting. The engineer will mainly work under the supervision of the CUPLV team at the University of Colorado Boulder.

The position is available immediately, will last at least until June 30, 2018, and eligible for the [employee tuition assistance benefit]. Compensation is competitive and commensurate with experience.

### Responsibilities

- Design the architecture of the new prototype, considering the new features and non-functional requirements (scalability, extensibility, robustness).
- Implement the prototype following best practices in software engineering (e.g., unit and integration testing, collaborative software development).
- Plan the design and development activities, respect the planned deadlines, and periodically update on the current progress.

### Qualifications

Please apply, if you possess the following:

- B.Sc. in computer science or equivalent
- Knowledge of at least one programming languages among Java, Scala, Python
- Experience in designing and implementing medium to large-scale software systems
- Can work independently to achieve a task
- Motivated and committed to achieve the project's goals

If you possess any of the following skills which we highly value, you will have an advantage:

- Knowledge of other programming languages (e.g., C++, JavaScript)
- Knowledge of tools to software deployment tools (e.g., Docker)
- Experience in working in an academic environment
- Knowledge (theoretical or practical) in programming language tools, such as analyzers or compiler
- Knowledge in machine learning and/or data mining

### How to Apply

To apply, please send your resume or CV, the contact information for two or three references, a link to your GitHub profile, and the solution to the following interview exercise to Bor-Yuh Evan Chang [evan.chang@colorado.edu](mailto:evan.chang@colorado.edu) and Sergio Mover [sergio.mover@polytechnique.edu](mailto:sergio.mover@polytechnique.edu). You may pre-apply before completing the interview exercise by first submitting the other items.

Submissions received by Friday, January 4, 2019 will receive full consideration, but the position will remain open until filled.

### About Boulder

Boulder, located at the base of the Rocky Mountains, is consistently awarded top-rankings for health, education, and quality of life. It is also home to a concentration of high-tech industry and to a vibrant start-up community. It is located 30 miles from downtown Denver.

## Interview Exercise

### Introduction

In order to assess your engineering abilities, we ask you to develop a simple GitHub app (described below) to be submitted as part of your application. Note that this exercise is designed to be deliberately underspecified: we are interested in your participation in making design decisions that concretizes various aspects of this app. While we welcome and appreciate augmentations (extra fancy features) to the specifications, it is more important that you present your ideas well and ensure that you have included concise instructions on how to use your app. If you are selected for an interview, we are excited and want to hear about the design decisions in your implementation! Finally, we value your ability to integrate off-the-shelf solutions into your service as much as your ability to write project code, so don't be shy in going open-source.

### User Story

The programming task consists of an app that automatically suggests improvements to Java source code on GitHub.

The program should be implemented as a GitHub app to conveniently receive pull request events from a GitHub repository.

The program should run on every new pull request on a repository and will analyze the source code changed in the pull request.

For each file changed in the pull request, the analysis should find the following issues:

1. Long identifiers: any identifier longer than 20 characters.

2. Shadowing of fields: a local variable in a method that shadows (has the same name of) a field of the class containing the method.

3. Unused local variable: a local variables that is declared in a method but it is never used.

The program will report all the found issues in a pull request comment specifying for every issue the name of the Java file, the line of code containing the issue, and the line number.

### Submission

Share the following information when applying for the position:

- The link to a GitHub repository containing all the source code of your solution. The repository should be public, so we can access it.

- How to access a deployed version of the GitHub app. You can use the free versions of a cloud computing platform (e.g., Amazon Web Services, Google Cloud, Heroku) to host your service.

## Acceptance Criteria

We highly value the following:

- Deployment: You must deploy your service using containerization (e.g., Docker) to support easy, horizontally-scalable deployment in cloud infrastructure. You may deploy to any cloud service you find convenient.

- Development: Please develop in a public GitHub repository with CI tests (e.g., Travis CI). You should use Scala in your backend service. Please use code versioning following best practices, such as [GitFlow].

- Documentation: Once again, we value your ability to communicate with other developers. This includes the ability to explain to others how to use your creations. We would like you to describe the means in which you have chosen to present your service.

### Guidance

You can use any existing library to create the project. Some useful link to gather more information about GitHub apps and the GitHub APIs are:

- GitHub app: <https://developer.github.com/apps/about-apps/>

- Tutorial on GitHub app: <https://developer.github.com/apps/building-your-first-github-app/>

- GitHub APIs: <https://developer.github.com/v4/>

We suggest using GitHub and Travis for development and Docker and AWS for deployment.

Don't over-complicate it. Use any supporting frameworks and libraries that help you achieve the exercise. Don't worry about production-level error reporting. The focus is on evaluating your thought process and documenting any potential future issues.

It is all right to send us an email with any questions along the way.

[biggroum]: https://muse-portal.net/tools/biggroum/info
[bor-yuh evan chang]: https://www.cs.colorado.edu/~bec/
[employee tuition assistance benefit]: https://www.colorado.edu/bursar-campus-resources/employee-tuition-assistance-benefit
[gitflow]: https://nvie.com/posts/a-successful-git-branching-model/
[sergio mover]: http://www.lix.polytechnique.fr/Labo/Sergio.Mover/
[sriram sankaranarayanan]: https://www.cs.colorado.edu/~srirams/
