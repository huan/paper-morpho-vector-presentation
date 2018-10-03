---
title: A Review of Word Embedding in Morphonology
subtitle: With pandoc and a very long bash command
author:
- Huan LI (李卓桓) huan@bupt.edu.cn
institute:
- Department of Computer Science and Technology
- Beijing University of Post and Telecom
abstract: |
  The text meaning is important for AI, Word Embedding is the basic tool today for text meaning, so the Word Embedding is very important. However, most of the Word Embedding is based on words, like Word2Vec, GLOVE. From the view of Computational Linguistics, words are ruled by syntax, and they are formed by the basic unit of the language: morpheme. Morpheme is the smallest meaningful morphological unit of a language that cannot be further divided or analyzed. In other words, morpheme can be describe as the minimal units of meaning. In this paper, we believe that the morpheme could help AI understand the text meaing better, and reviewed some Word Embedding technology with Morphonology, which incorporating morphological information into Word Embedding.

date: Sep 30, 2018
---

## 1 Introduction

Morphology is a study of words. It basically deals with word formation, examines the relationship between words, and analyzes their constituent elements.

Morpheme is the smallest unit of a word, which has a meaning, lexical or grammatical, and cannot be divided into smaller units. For instance, the word "unpredictable" consists of 3 morphemes -- un + predict + able. Un is a prefix, which means "not" and is used in this example to negate the adjective "predictable." The suffix able is used to form adjectives and is usually placed at the end of a verb (useable, loveable, deniable, etc.).

In this paper, we will talk about the Word Embedding in Morphonology.

## 2. Morphonology

morphemes is Re-combin(e)-able. See Table \ref{morpheme-carries-meaning} [@jill2016morphology]:

Affix  | Morpheme  | Meaning
-------|-----------|-------------------
Prefix | "re-"     | "again"
Suffix | "-able"   | "capable of"
Stem   | "combine" | "to join"

Table: (Morpheme Carries Meaning) \label{morpheme-carries-meaning}

And it is powerful. See Table \ref{study-of-word-structure} [@penny2011linguistics]

| Word Structure |
|----------------|
| pre+pose |
| pre+pos+ition |
| pre+pos+ition+al |
| pre+pos+ition+al+ize |
| pre+pos+ition+al+iz+ation |
| pre+pos+ition+al+iz+ation+free |
| Pseudopseudohypoparathyroidism |

Table: (Study of Word Structure) \label {study-of-word-structure}

Those morphonology knowledges will also help human to understand the words a lot. As there a book namd 《GRE词汇精选》（GRE红宝书） which is known by all the Chinese students who want to pass the GRE test, it gives a lot of morphological tricks like Table \ref{gre-book}:

| Word | Morphemes / Meaning |
| ---- | --------- |
| abandon | a+band(乐队)+on→一个乐队在演出→放纵 |
| abash | ab+ash(灰)→中间有灰，灰头灰脸→尴尬 |
| abate | a(加强)+bate(减弱，减少)→减轻 |
| abbreviate | ab(加强)+brev(短)+iate→缩短 |
| abdicate | ab(相反)+dic(说话，命令)+ate<br />→不再命令→退位，辞职 |

Table: (GRE Book) \label {gre-book}

Those knowledge of the common prefixes would also help us in deciding the meaning of new words that we encounter.

## 3 Word Vector Presentations

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

There has already a lot researchs like "implicitly incorporating morphological information into Word Embedding" [@xu2017implicitly], See Figure \ref{morphological-information-into-word-embedding}, and "Better Word Representations with Recursive Neural Networks for Morphology" [luong2013better], See Figure \ref{representations-with-morphology} [@luong2013better].

![Morphological Information into Word Embedding \label{morphological-information-into-word-embedding}](images/implicitly-incorporating-morphological-information-into-word-embedding.png)

![Morphological Sub Words\label{representations-with-morphology}](images/better-word-representations-with-recursive-neural-networks-for-morphology.png)


At last, those prior knowledge of morphological is valuable. But how can we get the morphological knowledges? Of couse we can get them from the priory researchers. But it could be better if we could induct the morphology knowledge from unsupervised machine learning alghorithm. See Figure \ref{unsupervised-morphology-induction} [@soricut2015unsupervised]

![Unsupervised Morphology Induction\label{unsupervised-morphology-induction}](images/unsupervised-morphology-induction-using-word-mbeddings.png)

## Conclusion and Future Work

Morphonology knowledge is very valuable and it could be able to help the word embedding be more informative. 
There's already lots of word embedding research based on the morpheme, but it seems they are all very eary stage, and there stil haven't a solution for the industry like Word2Vec or GLOVE.

I believe this direction is a right direction to improve the performance of tradional word embedding for NLP tasks, it's worth to do more research based on the previous studies.

The future work would consider to:

1. Train a Tokenizer to parse Word to Morphemes
1. Train Morpheme Embedding on Wikipedia Dataset
1. Use GRU to convert Morpheme Embeddings for each word to Word Embedding(Morpheme Word Embedding)
1. Benchmark all the morpheme based word embedding algorithms
1. Compare the results of standard NLP tasks on Morpheme Word Embedding against to other traditional word embeddings.

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
