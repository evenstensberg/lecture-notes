# B Tree

A reason for having a b tree is to store large number of keys in one node as well as bigger key values key values by keeping the height of a tree small.

A B-tree of order m (can have most m-1 keys and m children) contains all properties of a m-ary tree, in addition to these:

- Every node in a B-tree contains at most m-children.
- Every node in a B-tree except the root node and the leaf node contain at least m/2 children.
- All leaf nodes must be at the same level (balanced)

The fact that all nodes contain same number of children is not needed, but each node must have at least m/2 nodes.

A B-tree is a self-balancing tree that is a variation of a binary search tree, but allows more than 2 child nodes. 

**B-trees are useful for handling data that cannot fit into main memory**

B-trees handle large amount of data, which traditionally other trees cannot. This makes the efficiency of concurrency better and the tradeoff against more efficient ones that keep small data is noticable. 

- If there are n-keys in a node, there must be n+1 children for that node. (2-3 trees)
- B in B tree stands for branching factor, how many children a node can possibly have, and how many keys a node possibly could contain.
- This branching factor represents the bound for the tree, the maxiumum or minimum number of children per node.

The number of children per node in a B tree could be described as B <= x < 2B, where B is the branching factor, and x represents the number of children per node.

B=2

- B <= #children per node < 2B
- B-1 <= #possible keys per node < 2B - 1

* Turns into a 2-3 tree property list


For B-trees this is similar:

- Describing bounds like parameters B and 2B - 1 (instead of n+1, reverse equation)
    - In 2-3 tree B=2, upper and lower bounds are 2, hence 2-3 keys/nodes
- No bounds to key, only needs 1 key
    - i.e in a 5-9 tree a root node could have 5-9 nodes, but only concerned with 1 key.
- All leaves must be at same depth
    - No lower bound since k children of a leaf is always 0.

## Notes on B-tree nodes

- A node contains at least one, could contain many keys as the data it holds
- References one or many children
- When iterating or searching a B-tree, useful to have keys sorted in order, such that decision of moving left, down or right of trie is easier.

- Insertion is done by walking the root to its slot.
- Fill a 3-slot node, split it in the middle to the parent [4,6,8] -> ([6,15,29] -> [4,8 (left)])

- Delete is straight forward if not key deleting is a single key.
- Rotate nearest sibling to parent and move down a key from parent to deleted idx
- If parent node is deleted with children, move leftmost child up

- Edge case: Merge child nodes and merge those into a node at the height