### Documentation

#### Binary Search Tree

> //Creation (swap out Int for data type needed)  
> let tree = BinaryTree<Int>()
> 
> //Insertion  
> tree.Add(value: 13)  
>  
>  //Removal  
> tree.Remove(item: 13)
>  
> //Traversal  
> for node in tree {  
> 	print("\(node.Value) ")  
> }  

#### AVL Tree

> //Creation (swap out Int for data type needed)  
> let tree = AVLTree<Int>()
> 
> //Insertion  
> tree.Add(value: 13)  
>  
>  //Removal  
> tree.Remove(item: 13)
>  
> //Traversal  
> for node in tree {  
> 	print("\(node.Value) ")  
> }  

#### N-Ary Tree

> //Creation (swap out Int for data type needed)  
> let tree = AVLTree<Int>()
> 
> //Insertion  
> let root = tree.Add(value: 10)  
> tree.Add(value: 1, to: root)        
> let two = tree.Add(value: 2, to: root)  
>  
> //Removal  
> tree.Remove(item: 2)
>  
> //Search  
> let node = tree.Search(value: 13)
>  
> //Traversal  
> for node in tree {  
> 	print("\(node.Value) ")  
> }  

#### Red-Black Tree

> //Creation (swap out Int for data type needed)  
> let tree = RedBlackTree<Int>()
> 
> //Insertion  
> tree.Add(value: 13)  
>  
> //Removal  
> tree.Remove(item: 13)
>  
> //Search  
> let node = tree.Search(value: 13)
>  
> //Traversal  
> for node in tree {  
> 	print("\(node.Value) ")  
> }  

#### Directed Graph

> //Creation (swap out Int for data type needed)  
> let graph = DirectedGraph<Int>()
> 
> //Insertion  
> let A = graph.Add(value: "A")  
> let F = graph.Add(value: "F")  
>         
> let E = A.Add(value: "E")  
> F.Add(vertex: E)
>  
> //Removal  
> graph.Remove(item: 13)
>  
> //Search  
> let node = graph.Search(value: 13)
>  
> //Traversal  
> for node in graph {  
> 	print("\(node.Value) ")  
> } 


#### Undirected Graph

> //Creation (swap out Int for data type needed)  
> let graph = UndirectedGraph<Int>()
> 
> //Insertion  
> let A = graph.Add(value: "A")  
> let F = graph.Add(value: "F")  
>         
> let E = A.Add(value: "E")  
> F.Add(vertex: E)
>  
> //Removal  
> graph.Remove(item: 13)
>  
> //Search  
> let node = graph.Search(value: 13)
>  
> //Traversal  
> for node in graph {  
> 	print("\(node.Value) ")  
> } 