### SwiftGraph  

#### Download

Most likely you're reading this from a download of the project already so you should have it on your machine already. To satisfy one of my rubric data points, it is also available on Github at [https://github.com/jamesmillerio/SwiftGraph](https://github.com/jamesmillerio/SwiftGraph). It can be cloned using git with the following command:

> git clone git@github.com:jamesmillerio/SwiftGraph.git

#### Install

SwiftGraph can be used by simply opening the SwiftGraphTerminal.xcodeproj in the latest version of XCode. It is a terminal project and once opened should be able to be built and run without issue. There are no external dependencies so it should be as simple as building and running.

In addition to that, I did build the application into an executable that should be able to be run from the terminal from the root of the project (assuming you're on the same architecture, which you should be on a modern Mac). The executable is simply named SwiftGraph. Running it will run all of the tests in the testing harness.

#### Testing

The main entry point to the application is ./SwiftGraphTerminal/main.swift although the more interesting bits are in ./SwiftGraphTerminal/Sources. Inside of that directory you will find several other directories that hold the actual source code for the project. In particular, browsing to ./SwiftGraphTerminal/Sources/Testing will reveal all of the testing harnesses I built for each tree/graph type.

Simply running the project will run all of those test harnesses and produce a pass/fail result for each tree/graph. Their source and results can be analyzed and tinkered with from those testing harness files. 

I tried to keep everything fairly organized so the ./SwiftGraphTerminal/Sources/Trees directory has all of the tree data structures and ./SwiftGraphTerminal/Sources/Graphs has all of the Graph data structures. I also had to implement some more basic data structures that aren't yet supported in Swift, like Queues and Stacks, which are in the ./SwiftGraphTerminal/Source/CollectionTypes directory.

#### Rubric

Here are some notes for my rubric to help explain things.  
  
- Basics  
	- Utilizes generics to follow Swift standard practices: Every tree and graph data structure in my project uses data structures to make them generic. Several of the testing harness actually use either String or Int values. The only catch is they have to support the Hashable and Comparable protocols due to their use in Dictionaries and their need to be compared for placement in trees.
	- Abstracting away traversal code to allow for third party algorithms: All traversal code is abstracted away into their own classes. You can find a Traversal directory in the Tree and Graphs directories for BFS, DFS, etc.
- Tree Implementations
	- N-ary Tree: Can be seen in the ./SwiftGraphTerminal/Sources/Trees directory.
	- AVL Tree:  Can be seen in the ./SwiftGraphTerminal/Sources/Trees directory.
	- Red-Black Tree: Can be seen in the ./SwiftGraphTerminal/Sources/Trees directory.
	- Properly Balancing: Red-Black and AVL trees both support balancing.
	- BFS and DFS: Each data structure supports one or both depending on the tree/graph. Most support both as well as pre/in/post order and can be switched on the fly by using the TraversalType property.
	- Traversal: Each tree and graph utilizes the build in Sequence class and associated protocols to enable dynamic traversals. This allows the built in for loop to use the traversal that has been specified for that tree/graph, dynamically. Any time you see a for loop within a data structure, it is using a specific traversal algorithm specified by the TraversalType property.
- Graph Implementations
	- Undirected Graph: Can be seen in the ./SwiftGraphTerminal/Sources/Graphs directory.
	- Directed Graph: Can be seen in the ./SwiftGraphTerminal/Sources/Graphs directory.
	- Traversal algorithm: Same implementation as the details for Traversals above. For loops automatically and dynamically use whatever Traversal has been specified.
- Open Sourcing
	- Hosting on a public Github repository: 
	- Providing a testing suite: Explained above in the Testing section. Harnesses can be found in the ./SwiftGraphTerminal/Sources/Testing directory.
	- Providing documentation: Included as DOCUMENTATION.md
	- Providing code usage examples:  Included as DOCUMENTATION.md
- Package Management Support
	- Cocoa Pods: Includes a podspec file in the root for usage with Cocoa Pods. Didn't get as far as I'd hoped with this, but I at least got it implemented at a base level.
- Demonstration
	- Include Swift playground for demonstration purposes: Had to fall back towards having the test harness output demonstration data. Couldn't get Playgrounds to play nice (pun intended) with this project type in time.