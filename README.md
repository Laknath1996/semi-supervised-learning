# Graph-based Semi-Supervised Learning 

In this EN.553.738 Course Project, we study graph-based methods for semi-supervised learning (SSL), presenting the theoretical motivations of these methods, and experimental results on benchmark datasets.

### Semi-supervised Learning

Suppose we have a large number of samples $x_1, \dots, x_n \in \mathcal{X} \subseteq \mathbb{R}^d$, where only the first $m << n$ such samples (which we can assume, without loss of generality, to be the first $m$ such samples) have labels $y_i = f(x_i) \in \mathcal{Y} = \{1, \dots, C\}$. Here, we have assumed that there are $C$ classes and $f: \mathcal{X} \mapsto \mathcal{Y}$ is some labeling function that assigns one of these class labels to to each sample $x_i$. In semi-supervised learning, we wish to learn a function $\hat f$ using the entirety of $n$ samples such that $\hat f$ may achieve a low misclassification error on the unlabeled samples:

$$ err(\hat f) = \frac{1}{n-m} \sum_{i = m+1}^n \mathbb{1} [ \hat f(x_i) \neq f(x_i) ]. $$

The main idea here is that we can exploit the total amount of samples we have to understand the underlying geometry of the data, and leverage this information to learn an appropriate classifier $\hat f$. 

While there are a number of different ways of tackling the semi-supervised learning problem such as generative, consistency-regularization, and pseudo-labeling methods, in this work we restrict our focus to graph-based semi-supervised learning.

### Graph-based semi-supervised Learning

We can represent each sample by a vertex in a graph that measures some degree of similarity between the samples. Such a graph may be able to represent the underlying structure of the data and this information can be exploited in the context of the semi-supervised learning problem. After constructing a similarity graph using both labeled and unlabeled samples, the labeled information can be propagated to the unlabeled samples through the learned graph. Note that the large amount of unlabeled samples allows us to construct a rich graph that encodes the geometric structure of the data. This forms the basis for graph-based semi-supervised learning techniques. In this work, we consider 4 such methods and discuss their theoretical motivations, algorithmic implementations, experimental results on several benchmarks, and limitations in detail. 

* Laplacian eigenmaps-based SSL [1]
* Eigenfunction-based Regularization on Graph with Function-Adapted Kernels [2]
* Diffusion-based Regularization on Graph with Function Adapted Kernels [2]
* Poisson Learning [3]

Group Members: Ashwin De Silva, Jeremy Welland, Sai Koukuntla, Zhenghan Fang

Course Instructor: Prof. Mauro Maggioni

[[project report](https://github.com/Laknath1996/semi-supervised-learning/blob/master/work/report.pdf)] [[slides](https://github.com/Laknath1996/semi-supervised-learning/blob/master/work/slides.pdf)]

### References

[1] Mikhail Belkin and Partha Niyogi. Using manifold stucture for partially labeled classification. Advances in neural
information processing systems, 15, 2002.

[2] Arthur D Szlam, Mauro Maggioni, and Ronald R Coifman. Regularization on graphs with function-adapted diffusion
processes. Journal of Machine Learning Research, 9(8), 2008.

[3] Jeff Calder, Brendan Cook, Matthew Thorpe, and Dejan Slepcev. Poisson learning: Graph based semi-supervised
learning at very low label rates, 2020.
