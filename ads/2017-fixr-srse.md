# Position: Student Research Software Engineer

## Job Description

The CUPLV group and Fixr team are looking for a student research software engineer with strong interest and experience with full stack cloud-based web service development. In this role, you will work with faculty and researchers, taking on engineering challenges associated with the development of cloud services that realizes large-scale analysis of open-sourced programs in public repositories like GitHub.

The position is for an undergraduate or graduate student and is part-time (for at least 10 hours per week, preferably at least 15). Pay rate will be competitive and depend on degree and experience.

Please apply, if you possess the following:

  - Strong knowledge in functional and object-oriented programming.
  - Strong knowledge in scripting in Linux based systems.
  - Experience in developing web-services (front-end and/or back-end).
  - Experience in development in public repositories (e.g., GitHub, BitBucket).
  - Highly self-motivated and enjoys working with and communicate well with a diverse team.

If you possess any of the following skills which we highly value, you will have an advantage:

  - Strong experience in Scala, Java, and Python programming.
  - Experience in concurrent/distributed programming, particularly the Actor-based systems like Akka or Elixir.
  - Experience in working with and deploying in cloud infrastructures (e.g., OpenStack, AWS, Docker)
  - Strong Experience in build systems, specifically sbt and gradle.
  - Strong Experience in exploiting and integrating with web API services (e.g., GitHub, BitBucket)
  - Experience in Android development.
  - Experience in big-data compute frameworks (e.g., Spark, Giraph, Hadoop).

To apply, send your resume or CV, your (informal) transcript, and the solution to the following interview exercise to Prof. Bor-Yuh Evan Chang <evan.chang@colorado.edu> and Dr. Edmund Lam <edmund.lam@colorado.edu>.

Submissions received by Friday, January 20, 2017 will receive full consideration, but the position will remain open until filled.

## Interview Exercise

### Introduction

In order to assess your engineering abilities, we ask you to develop a simple web service (described below) to be submitted as part of your application. Note that this exercise is designed to be deliberately underspecified: we are interested in your participation in making design decisions that concretizes various aspects of this web service. While we welcome and appreciate augmentations (extra fancy features) to the specifications, it is more important that you present your ideas well and ensure that you have included concise instructions on how to use your service. If you are selected for an interview, we are excited and want to hear about the design decisions in your implementation! Finally, we value your ability to integrate off-the-shelf solutions into your service as much as your ability to write proprietary code, so don't be shy in going open-source.

### User Story

As a tool developer interested in Android applications, I would like a simple web service that curates meta and build data for open source Android projects on GitHub. A production version of this service is anticipated to be used internally by other sub-routines of a cloud-based program analysis tool-chain. It should minimally comprise of three API calls, specifically:

  - Clone and build: A call to this API requests your service to schedule the cloning and build of a list of GitHub repositories containing Android projects.

  - Meta-data queries: A call to this family of APIs requests meta-data information of the GitHub repositories previous scheduled for cloning and building. The two forms of meta-data query which we expect are (1) query for specific repos and (2) listing of repos based on build status.

  - Build data query: A call to this family of APIs requests for the actual build data of the GitHub repositories previous scheduled for cloning and building. The inputs of these APIs are similar to the meta-data queries (1 and 2), but the responses are archive files containing the actual build data.

### Acceptance Criteria

_Please adhere to the following criteria_:

  - Clone and build: GitHub repositories are identified by the pair, user name and repository name, and the commit hash as an optional parameter (we shall refer to these inputs as GitHub repo ids). If the commit hash is omitted, simply assume the latest commit, otherwise the specific commit of the repository should be scheduled instead. Under the hood, your service should eventually clone and attempt to build each repository and store some meta-data information (the status of the build of the repository, the list of artifacts produced by the build, as the .class and .apk files). Building open repositories in general, is a hard problem. For the assessment, do not worry about handling all cases; you can have your service run a basic build script (e.g., gradle assembleDebug) and otherwise fail. We do not expect your service to have a perfect build rate, but we do like to see that build exceptions are properly logged and curated, to handle the following queries in a manageable manner.

  - Meta-data queries: For (1), given a list of GitHub repo ids, return the build status of each repository (i.e., successfully built, failed, build scheduled, not scheduled, etc). If successfully built, your reply should also contain paths (relative to root of the repository) to the build data (e.g., Android APKs, Java classes). If building failed, your reply should contain a relevant snippet of the build error message. For (2), the input should be symbols (of your choosing) that represents the build states (built, failed or scheduled) and the response should be a list of relative meta-data.

  - Build data query: You may offer build data in whatever form is convenient (e.g., apk). An optional feature is an additional parameter should be included to allow the caller to choose which build data are desired (Android APKs or Java classes, or both).

  - Deployment: You must deploy your service using containerization (e.g., Docker) to support easy, horizontally-scalable deployment in cloud infrastructure. You may deploy to any cloud service you find convenient.

  - Development: Please develop in a public GitHub repository with CI tests (e.g., Travis CI). Your implementation language for your service must be Scala.

  - Documentation: Once again, we value your ability to communicate with other developers. This includes the ability to explain to others how to use your creations. We would like you to describe the means in which you have chosen to present your service.

### Submission

We will evaluate the proposed solution by testing its execution and by inspecting the source code and its documentation. Please submit a write up and links to your GitHub repo and your deployment.

### Guidance

We suggest using GitHub and Travis for development and Docker and AWS for deployment. Most cloud services offer free plans for students.

You may use mock Android app repos as that are as simple as possible as inputs (e.g., a empty buildable app and a non-buildable app).

Don't over-complicate it. Use any supporting frameworks and libraries that help you achieve the exercise. Don’t worry about production-level error reporting. The focus is on evaluating your thought process and documenting any potential future issues.

It is ok to send us an e-mail if you have any questions.
