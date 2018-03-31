This is an experiment for some things around updating BOSH documentation. There are many possible changes, so to be able to try a few things, I've been keeping most of the existing content except in cases where I'd like to test a change in a small section.

Some of the experiments and goals where feedback would be particularly appreciated...

 * Information navigation - with the goal of segmenting content with a balance between personas, larger concepts, readable/self-sufficient pages...
    * Old Sample - single table of contents on the docs [home page](http://bosh.io/docs/index)
    * Proposed Sample
       * the top, primary navigation represents those personas and larger topics
       * the left, secondary navigation represents a content breakdown of topics within the section
       * the right, page navigation is the table of contents from page headers
 * Breadth vs depth content - I'd like to see shorter, targeted pages rather than lengthy reference manual type pages
    * Old Sample - lengthy CPI reference for [AWS CPI](http://bosh.io/docs/aws-cpi.html)
    * Old Sample - [new layout](http://localhost:8000/aws-cpi/)
    * Proposed Sample - [configuration-specific page](http://localhost:8000/clouds/aws/config/)
    * Proposed Sample - [resource-specific pages](http://localhost:8000/clouds/aws/resources/azs/)
    * Proposed Sample - [separate errors page](http://localhost:8000/clouds/aws/common-errors/)
 * Property schemas - we have many pages which try to document properties or manifest configuration which are in lengthy bullet point lists. I'd like an easier to read, more linkable solution. New samples are just a prototype; better CSS styling could make significant further improvements to them.
    * Old Sample - lengthy CPI reference for [AWS CPI](http://bosh.io/docs/aws-cpi.html)
    * Old Sample - [new layout](http://localhost:8000/aws-cpi/)
    * New Sample - listed, but new-line descriptions [link](http://localhost:8000/clouds/aws/resources/vms/)
    * New Sample - header-based [link](http://localhost:8000/clouds/aws/resources/disks/)
    * New Sample - more verbose, header-based [link](http://localhost:8000/deployments/manifest/releases/)
    * New Sample - more verbose, header-based, indentation for hierarchy (http://localhost:8000/deployments/manifest/instance-groups/#cpu)
 * Content ordering - within topics, the goal is to present an overview of information, and provide the user a choice on going deeper into a topic, or moving on to a different, related topic.
 * Guide vs Reference - guides are for showing people specific examples of how to apply a concept; reference is for describing and defining functionality. They should cross-reference each other. Guides should have annotations for "learn more about cloud-configs here" and references should have annotations for "try using multiple azs here"
    * There are a few existing guides, but need more
    * BOSH 101 content should become guides here
 * Examples - using more tangible examples in content, and, preferably, linking to other releases, deployment manifests in the open source world for people to learn from, if interested
    * Old Sample - release spec files [link](http://bosh.io/docs/jobs.html)
    * New Sample - [link](http://localhost:8000/release/authoring/jobs/spec/)
    * New Sample - [link](http://localhost:8000/release/authoring/config/s3-blobstore/#examples)
