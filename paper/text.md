---
title: A Review of Word Embedding in Morphonology
subtitle: With pandoc and a very long bash command
author:
- Huan LI (李卓桓) huan@bupt.edu.cn
institute:
- Department of Computer Science and Technology
- Beijing University of Post and Telecom
abstract: |
  How words are put together out of smaller pieces that linguists call morphemes, the minimal units of linguistic form and meaning. ①从事这一研究的目的和重要性; 　②研究的主要内容，指明完成了哪些工作; 　③获得的基本结论和研究成果，突出论文的新见解; 　④结论或结果的意义。

date: Sep 30, 2018
---

## 1 Introduction

When doing NLP(Natual Language Processing) with DNN(Deep Neural Network), we need to input the language to the computer. There's many technics can do this, such as One Hot Encoding for Character, or Vector Representing for Word.

The Vector Representing for Word is a very active field since Word2Vec [@mikolov2013distributed] from Google, GLOVE [@pennington2014glove] from Stanford, and FastText [@niu2017improved] from Facebook, etc.

Most algorithms are derivative of Word2Vec: they map words in training set into vectors. However, this method has many limitions, the biggest one is that it has a closed vocabulary assumption, so that if a worda had not been seen at training, then it could not be understood, this is a OOV(Out of Vocabulary) problem.

FastText has some breakthoughs, it considers each word as a Bag of Character n-grams. This is also called as a Subword-Units in the paper. Instead of dealing of individual words, FastText breaks words into several n-grams (Subword-Units). For instance, the tri-grams for the word `orange` is `ora`, `ran`, `ang`, `nge`. The word embedding vector for `orange` will be the sum of all these n-grams. 

Subword-Units will be helpful when we meet a OOV word, like rare and complex words, because we can analysing it from the characters. 

However, the naive Subword-Units had included the linguistics morphological structure for words. The n-gram algrithm will produce too much combinations, which most of them would be meaningless. See Figure \ref{subword-regularization} [@kudo2018subword]

![Subword Regularization \label{subword-regularization}](images/subword-regularization-improving-neural-network-translation-models-with-multiple-subword-candidates.png)

By introducing morphological knowledges, we can split the word into morphemes, which could help us to build representations for morphologically complex words from Subword-units of morphemes. Using Morph-Subword-Units build from morphemes will get better word representation. See Figure \ref{uncomfortable-morphology-tree} [@clair2009scared]

![Morpheme-based morphology tree of the word "uncomfortable"\label{uncomfortable-morphology-tree}](images/uncomfortable-morphology-tree.png)

The languages other than English, such as Chinese, Japaness, and Korea, also have their own word in different morphology. Those languages could use the same idea to presente the smallest meaningful morphological unit of the language, for example, Chinese character components. See Figure \ref{component-enhanced-hinese-character-embeddings} [@li2015component].

![Chinese Character Component \label{component-enhanced-hinese-character-embeddings}](images/component-enhanced-chinese-character-embeddings.png)

Besides the character components, there's also some researchers go deeper with strokes n-grams. See Figure \ref{chinese-word-n-gram} [@cao2018cw2vec].

![Chinese Word Embeddings with N-Gram \label{chinese-word-n-gram}](images/cw2vec-learning-chinese-word-embeddings-with-stroke-n-gram-information.png)

And get the sememe for the component of the Chinese characters from HowNet [@dong2003hownet]. See Figure \ref{character-and-word-embedding} [@niu2017improved]

![Chinese Word with Sememe \label{character-and-word-embedding}](images/joint-learning-of-character-and-word-embeddings.png)

Today, there's many Subword-Units algorithm that want to improve the performance for the language model, like Morfessor, BPE, char-trigram, character, and analysis. See Figure \ref{do-we-capture-morphology} [@vania2017characters]

![From Characters to Words to in Between \label{do-we-capture-morphology}](images/from-characters-to-words-to-in-between-do-we-capture-morphology.png)


Obviously, those prior knowledge of morphological is valuable. But how can we get the morphological knowledges? Of couse we can get them from the priory researchers. But it could be better if we could induct the morphology knowledge from unsupervised machine learning alghorithm. See Figure \ref{unsupervised-morphology-induction} [@soricut2015unsupervised]

![Unsupervised Morphology Induction\label{unsupervised-morphology-induction}](images/unsupervised-morphology-induction-using-word-mbeddings.png)

At last, there has already a lot researchs like "implicitly incorporating morphological information into Word Embedding" [@xu2017implicitly], See Figure \ref{morphological-information-into-word-embedding}, and "Better Word Representations with Recursive Neural Networks for Morphology" [luong2013better], See Figure \ref{representations-with-morphology} [@luong2013better].

![Morphological Information into Word Embedding \label{morphological-information-into-word-embedding}](images/implicitly-incorporating-morphological-information-into-word-embedding.png)

![Morphological Sub Words\label{representations-with-morphology}](images/better-word-representations-with-recursive-neural-networks-for-morphology.png)


## 2. Morpheme

Why is text meaning is important for AI?

Morpheme is the smallest meaningful morphological unit of a language that cannot be further divided or analyzed. In other words, morpheme can be describe as the minimal units of meaning.

In NLP, we always use word2vec(google) or glove(stanford)

Morpheme RNN...

引入 Morphology 先验知识

s -> fastext will ignore
s -> multiple things

ed -> fastext will ignore (with the hyperparameter `smallest ngram[minn]`=3)
ed -> past V

un -> ignore with fasttext
un -> not, logical

include the knowledge of Morpheme & phoneme, will reduce the complexity & memory problem of FastText n-gram character model


name as textmeme? meme2vec?

#### Morpheme

1. Free Morpheme
1. Bound Morpheme(Affixex)
    1. Derivational Morpheme
        1. Prefix
        1. Suffix
    1. Inflectional Morpheme
        1. Suffix(Do not change word class)

)对于某些新知识领域、新技术，写作时可以追溯该主题的发展过程，适当增加一些基础知识内容，以便读者理解。

（1） 该领域的研究意义。 
主要包括论据和论证。通过提出问题、分析问题和解决问题，比较各种观点的异同点及其理论根据，从而反映作者的见解

横纵法

主要叙述综述的目的和作用，概述主题的有关概念和定义，简述所选择主题的历史背景、发展过程、现状、争论焦点、应用价值和实践意义，同时还可限定综述的范围．使读者对综述的主题有一个初步的印象。这部分约200～


Morphology is the study of word structure that critical to reading skills development.

morphemes is Re-combin(e)-able:

```
Each "morpheme" carries meaning - "prefix", "stem", "suffix"

1. Prefix `re-` means "again" 
2. Suffix `-able` means "capable of"
3. Stem `combine` means "to join"
```
> https://www.youtube.com/watch?v=zlkGtu035xc

```
◮ pre+pose
◮ pre+pos+ition
◮ pre+pos+ition+al
◮ pre+pos+ition+al+ize
◮ pre+pos+ition+al+iz+ation
◮ pre+pos+ition+al+iz+ation+free
◮ Pseudopseudohypoparathyroidism
```
> Page 3, https://web.stanford.edu/class/linguist1/Slides/morph1-slides.pdf


aforementioned -> a fore mentioned 
英文词根切词

俞敏洪的GRE红宝书（《GRE词汇精选》）中，会把每一个英文单词拆分成对应的词根，用来辅助记忆，如：
为每一个重要单词都给出了精炼又贴切的记忆方法，包括词根词缀法、联想记忆法和发音记忆法等。同时又给这些重要单词配以同根词、派生词、形近词和反义词，帮助考生理解和记忆，达到举一反三的效果。

```
abandon v./n.放弃；放纵 分拆联想：a+band(乐队)+on→一个乐队在演出→放纵
abash v.使害羞，使尴尬 分拆联想：ab+ash(灰)→中间有灰，灰头灰脸→尴尬
abate v.减轻，减少 词根记忆：a(加强)+bate(减弱，减少)→减轻
abbreviate v.缩短；缩写 词根记忆：ab(加强)+brev(短)+iate→缩短
abdicate v.退位，辞职，放弃 词根记忆：ab(相反)+dic(说话，命令)+ate→不再命令→退位，辞职
```
> 《GRE词汇精选》

中文字体偏旁：鲸、鲤、鲶 -> 鲜 -> 地三鲜
海里能吃的东西都比较鲜

朝鲜：不同的维度语义



## Morphology Ideas

### The Problem in NLP

1. MNIST -> MLP -> Acurracy: The 2D relation information was lost.
1. OOV problem

Understanding the meanings of the common prefixes would help us in deciding the meaning of new words that we encounter.

### The Solution

MNIST -> CNN -> Acurracy

The 3D relation information was perfectly included.

### Morpheme

Δ简介主题；Δ主题的重要性；Δ理清首要问题；
Δ简介各篇（例如A.B.）文章与作者，及不同或互补之处。

## Test


Non-English or Math|Frequency |Comments          
-------------------|----------|-----------------
\O                 |1 in 1,000|For Swedish names 
$\pi$              |1 in 5    |Common in math    
\$                 |4 in 5    |Used in business  

Table: (Table title) \label{my_table}


See Table \ref{my_table} for more.



## Tasks

1. Building NLP Pipeline with Morpheme RNN
2. Evaluating Morpheme RNN

1.1 分析A的观点 
1.2 分析B的理论/观点 
1.3 比较A与B的理论/观点

2.1 找出A与B的共性 
2.2 找出A与B的差异性 
2.3 探讨出一个中心议题

（2） 该领域的研究背景和发展脉络。 

（3） 目前的研究水平、存在问题及可能的原因。 

议题1: 探讨A&B 
议题2：探讨A&B 
议题3：探讨A&B

1)历史发展：按时间顺序，简述该主题的来龙去脉，发展概况及各阶段的研究水平。
(2)现状评述：重点是论述当前国内外的研究现状，着重评述哪些问题已经解决，哪些问题还没有解决，提出可能的解决途径；存在的争论焦点，比较各种观点的异同并作出理论解释，亮明作者的观点；详细介绍有创造性和发展前途的理论和假说，并引出论据，指出可能的发展趋势。
(3)发展前景预测：通过纵横对比，肯定该主题的研究水平，指出存在的问题，提出可能的发展趋势，指明研究方向，提示研究的捷径。


## Conclusion and Future Work

提出一个比其他更好的理念与立场
提出一个优于每一个理论与立场的部分的摘要

（4） 进一步的研究课题、发展方向概况。 
（5） 自己的见解和感想。 

提出几条语言简明、含义确切的意见和建议；也可以对主体部分的主要内容作出扼要的概括，并提出作者自己的见解，表明作者赞成什么，反对什么；对于篇幅较小的综述，可以不单独列出总结，仅在主体各部分内容论述完后，用几句话对全文进行高度概括。

## Acknowledgements

I'd like to thank professor Xiaojie LI for I started thinking about embedding in morphology when I'm on the class Computational Linguistics that he taught.

I'd also like to thank my friend Tongjun LI, who is the orginazer of Wechat group "NLP Fans" with hundreds of members, where I could discuss my idea over there.

## See Also

1. [Morphology: Word Structure](https://www.youtube.com/watch?v=zlkGtu035xc) (video)
1. [Morphology: The Study of Word Structure](https://web.stanford.edu/class/linguist1/Slides/morph1-slides.pdf) (slide)
1. [汉字拼义理论：心理学揭开争鸣百年的汉字之谜1](http://blog.sina.com.cn/s/blog_97658e3a010162gh.html)
1. [汉字拼义理论：心理学揭开争鸣百年的汉字之谜2](http://blog.sina.com.cn/s/blog_97658e3a010162gi.html)
3 [汉字拼义理论：心理学揭开争鸣百年的汉字之谜](http://blog.sina.com.cn/s/blog_97658e3a010162gj.html)
1. [morphology (morpheme & allomorph)](https://www.youtube.com/watch?v=DiQ7ai6i4lE)
1. [A review of word embedding and document similarity algorithms applied to academic text](http://ad-publications.informatik.uni-freiburg.de/theses/Bachelor_Jon_Ezeiza_2017_presentation.pdf)
1. [Morphological Recursive Neural Network (morphoRNN)](shukebeta.me/UoE-nlu/#Meaning-representations)
1. [“后 Word Embedding ”的热点会在哪里？](http://yanran.li/peppypapers/2015/08/17/post-word-embedding.html)
1. [论文阅读笔记 Improved Word Representation Learning with Sememes](https://www.cnblogs.com/fengyubo/p/9038190.html)
1. [BETTER WORD REPRESENTATIONS WITH RECURSIVE NEURAL NETWORKS FOR MORPHOLOGY](https://pdfs.semanticscholar.org/cd3a/b4a3536da969297db446eaf8795fef62c8a6.pdf) (slide)
1. [Word embeddings in 2017: Trends and future directions](http://ruder.io/word-embeddings-2017/)
1. [HowNet - 义原（Sememe）顾名思义就是原子语义，即最基本的、不宜再分割的最小语义单位](https://zhuanlan.zhihu.com/p/32688983)
1. [SentencePiece](https://github.com/google/sentencepiece) is a re-implementation of Subword-units, an effective way to alleviate the open vocabulary problems in neural machine translation. SentencePiece supports two segmentation algorithms, byte-pair-encoding (BPE) [Sennrich et al.] and unigram language model [Kudo.]. 
1. [Deep contextualized word representations](https://allennlp.org/elmo)

## References
