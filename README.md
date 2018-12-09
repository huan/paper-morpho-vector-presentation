# paper-morpho-vector-presentation

[![Open Paper Project](https://img.shields.io/badge/%20-Open%20Paper%20Project-brightgreen.svg)](https://github.com/BUPT/open-paper-project)

A Mini Review of Word Embedding in Morpho

![Morpho Butterfly](https://huan.github.io/paper-morpho-vector-presentation/images/morpho-logo.png)
> picture credit: [@juditfigarolacoach](https://juditfigarolacoach.wordpress.com/2017/05/19/a-puerto/)

| morpho |
| ------ |
| 英 ['mɔːfəʊ] 美 ['mɔːfoʊ] |
| n. [昆]大闪蝶( 产于南美洲) |
| pref. 表示“形式；形态；结构；语素” |

name as textmeme? meme2vec?

## USAGE

This is a [Open Paper Project](https://github.com/BUPT/open-paper-project), which means:

1. You can join if you are interested
1. PR is welcome to contribute
1. All contribtors who's PR had been accepted, will be listed as the authors in this paper.

> This project is my first paper, which the main propuse of it is to learn how to write paper for the first time. ;-D

## INSTALL

```shell
brew install pandoc pandoc-filter pandoc-citeproc
npm install -g nodemon
```

## BUILD

```shell
make clean
make pdf
```

The paper will be generated and save to `dist/A Mini Review for Word Embedding in Morpho.pdf`.

## HISTORY

### master

- TBW

### v0.0.1 Oct 2018

- [A Mini Review for Word Embeddingin Morpho.pdf](https://github.com/huan/paper-morpho-vector-presentation/releases/download/v0.0.1/A_Mini_Review_for_Word_Embedding_in_Morpho.pdf)


## SEE ALSO

- [How to make a scientific looking PDF from markdown (with bibliography)](https://gist.github.com/maxogden/97190db73ac19fc6c1d9beee1a6e4fc8)
- [plain text, papers, pandoc](https://kieranhealy.org/blog/archives/2014/01/23/plain-text/)
- [How to write an ACM-styled conference paper using Markdown/Pandoc](https://ineed.coffee/4008/how-to-write-an-acm-styled-conference-paper-using-markdownpandoc/)
- [Defination Morpho(pho)nology](http://www.ello.uos.de/field.php/EarlyModernEnglish/DefinitionMorphonology)

## PAPERS

> from @wangshirui33

1. 《subword language modeling with neural networks》
以元音为音节拆分单词为subword，选择s个出现频率最高的音节，作为今后拆分单词的依据，采用NNLM的方式训练

2. 《Tokenization-free pre-trained subword embeddings in 275 languages》
基于BPE(双字节编码）方法和维基百科语料预训练了275种语言的词向量集合

3. 《nerual machine translation of rare words with subword units》
提出了BPE（双字节编码）方法
根据语料构造词典，先切分成单个字符，频率最高的相邻元素结合成subword，以此类推。

4. 《Implicitly Incorporating Morphological Information into Word Embedding》
将能够代表词根、前缀和后缀的含义的词作为独立token参与建模(CBOW模型)（之前都是将单词切分为character或subword，利用这些子字符来建模，没有考虑到其词缀的通用含义）

5. 《Character-Aware Neural Language Models》
将单词的character向量矩阵利用CNN\最大池化得到一个表示向量，作为LSTM的输入预测下一个单词。

6. 《Better Word Representations with Recursive Neural Networks for Morphology》
将词拆分为前缀、词根、后缀，利用RNN训练其词缀得到subword representation，父词的embedding是由所有词素得到的，结合神经语言模型（利用上下文信息预测某一单词）来训练改善单纯由语素RNN得到的embedding。

7. 《Enriching Word Vectors with Subword Information》
采用word2vec的skip-gram模型，使用字母n-gram作为单位，本文n取值为3~6，一个词的embedding表示为其所有n-gram的和，用中心词的n-gram embedding预测目标词来训练。

8. 《Joint Learning of Character and Word Embeddings》
（CWE模型）采用word2vec的cbow模型，在模型的输入层中，引入了词语组成成分的单个汉字的信息（论文主要针对的是中文），提升了词向量生成的质量。如 智能+到来 --> 时代 ，智能被表示为智和能两个representation的和。

9. 《Bag of Tricks for Efficient Text Classification》
fasttext模型，采用cbow模型，不同之处在于cbow预测目标词，fasttext预测标签，且输入层结合了词语的n gram语素信息。如google--> go,goo,oog,ogl,gle,le  在训练过程中，每个n-gram都会对应训练一个向量，而原来完整单词的词向量就由它对应的所有n-gram的向量求和得到。

10. 《A Joint Model for Word Embedding and Word Morphology》
提出了一种char2vec模型，先利用Bi-LSTM获取输入序列（单词）的每个位置的表示，前向lstm可获得前缀和词根的表示，反向lstm可获取后缀及词根的表示，将两个hi结合即得到每个位置的表示，有了字符的表示，接下来用attention机制来构造词的表示，学习该词的语义与哪一部分关系更大，得到词向量，最后利用skip-gram模型进行训练改善语义相关性。

11. 《Improve Chinese Word Embeddings by Exploiting Internal Structure》
基于8论文的CWE模型。虽然CWE已经考虑了词的内部组成，增加了语义信息的表示，但在每一个词和他们的组成部分（单字）之间，CWE把每个字的贡献是视为一样的。本文要利用外部语言来获取语义信息，计算词与单字之间的相似度来体现其贡献度差异。（中文语料翻译成英文语料，利用cbow训练英文语料得到英文单词的词向量，通过这份词向量机酸词与单字之间的相似度），在词语相似性和文本分类上有很好的效果。

12. 《Morphological Word-Embeddings》
以多任务目标增强了 mnih 和 hinton (2007年) 的对数双线性模型 (LBL)，除了预测下一个单词外，增加了预测其语素标签的任务。如：city的morphological tags：N，NOM，SG，FEM。其中FEM包含了它是一个名词，且是单数的含义，每个单词tag都由多个tags组成。

13. 《Compositional Morphology for Word Representations and Language Modelling》
源自LBL模型，以该单词的词素信息与单词的结合作为词向量输入模型预测下一个单词。如novou: novou+novo+u

14. 《cw2vec: Learning Chinese Word Embeddings with Stroke n-gram Information》
本篇论文采用笔画信息作为特征，由于每个字符包含很多的笔画，类似于一个英文单词包含很多的拉丁字母，在这个基础之上，提出了笔画的n-gram特征。这个思想来源于2016年facebook提出的论文（Enriching Word Vectors with Subword Information），cw2vec可以称之为中文版本的fasttext，利用笔画的n-gram代skip-gram中的词语进行训练。

15. 《Radical Enhanced Chinese Word Embedding》
是基于CBOW来进行的改进，通过Radical（部首）来增强word embedding，称之为RECWE模型。为了能够充分的挖掘内部语义信息，还对radical进行了转换处理：如单人旁-->人

16. [Google’s Neural Machine Translation System: Bridging the Gap between Human and Machine Translation](https://arxiv.org/pdf/1609.08144.pdf), Yonghui Wu, Mike Schuster, et. al., 2016.
To improve handling of rare words, we divide words into a limited set of common sub-word units (“wordpieces”) for both input and output. This method provides a good balance between the flexibility of “character”-delimited models and the efficiency of “word”-delimited models, naturally handles translation of rare words, and ultimately improves the overall accuracy of the system.

## CO-AUTHORS

| Co-Author | GitHub | Bio & Research Direction |
| --- | --- | --- |
| Huan LI | @zixia | BUPT CS Ph.D. for Conversational AI |
| Shirui WANG | @wangshirui33 | BUPT CS Ph.D. for Language Embedding |

## COPYRIGHT & LICENSE

* Code & Docs © 2016-2018 Huan LI \<zixia@zixia.net\>
* Code released under the Apache-2.0 License
* Docs released under Creative Commons
