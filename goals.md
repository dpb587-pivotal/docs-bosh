What problems are we solving?


### Release Engineering

BOSH was purposefully constructed to address the four principles of modern [Release Engineering](http://en.wikipedia.org/wiki/Release_engineering) in the following ways:

> **Identifiability**: Being able to identify all of the source, tools, environment, and other components that make up a particular release.

BOSH has a concept of a software release which packages up all related source code, binary assets, configuration etc. This allows users to easily track contents of a particular release. In addition to releases BOSH provides a way to capture all Operating System dependencies as one image.

> **Reproducibility**: The ability to integrate source, third party components, data, and deployment externals of a software system in order to guarantee operational stability.

BOSH tool chain provides a centralized server that manages software releases, Operating System images, persistent data, and system configuration. It provides a clear and simple way of operating a deployed system.

> **Consistency**: The mission to provide a stable framework for development, deployment, audit, and accountability for software components.

BOSH software releases workflows are used throughout the development of the software and when the system needs to be deployed. BOSH centralized server allows users to see and track changes made to the deployed system.

> **Agility**: The ongoing research into what are the repercussions of modern software engineering practices on the productivity in the software cycle, i.e. continuous integration.

BOSH tool chain integrates well with current best practices of software engineering (including Continuous Delivery) by providing ways to easily create software releases in an automated way and to update complex deployed systems with simple commands.


### Software Deployment

@todo

Multi-IaaS story...
