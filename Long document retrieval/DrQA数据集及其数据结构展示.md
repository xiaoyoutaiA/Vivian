# DrQA数据集及其数据结构展示

## DrQA默认目录结构

```
DrQA
├── data (or $DRQA_DATA)
    ├── datasets
    │   ├── SQuAD-v1.1-<train/dev>.<txt/json>
    │   ├── WebQuestions-<train/test>.txt
    │   ├── freebase-entities.txt
    │   ├── CuratedTrec-<train/test>.txt
    │   └── WikiMovies-<train/test/entities>.txt
    ├── reader
    │   ├── multitask.mdl
    │   └── single.mdl
    └── wikipedia
        ├── docs.db
        └── docs-tfidf-ngram=2-hash=16777216-tokenizer=simple.npz
```

## QA Datasets

The datasets used for DrQA training and evaluation can be found here:

- SQuAD: [train](https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json), [dev](https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json)
- WebQuestions: [train](http://nlp.stanford.edu/static/software/sempre/release-emnlp2013/lib/data/webquestions/dataset_11/webquestions.examples.train.json.bz2), [test](http://nlp.stanford.edu/static/software/sempre/release-emnlp2013/lib/data/webquestions/dataset_11/webquestions.examples.test.json.bz2), [entities](https://dl.fbaipublicfiles.com/drqa/freebase-entities.txt.gz)
- WikiMovies: [train/test/entities](https://dl.fbaipublicfiles.com/drqa/WikiMovies.tar.gz)
(Rehosted in expected format from https://research.fb.com/downloads/babi/)
- CuratedTrec: [train/test](https://dl.fbaipublicfiles.com/drqa/CuratedTrec.tar.gz)
(Rehosted in expected format from https://github.com/brmson/dataset-factoid-curated)

## DrQA将数据集处理为一下两种格式
**格式A**    即文档检索(Document Retrieval)部分 通过脚本文件的处理，将 SQuAD 和WebQuestions 转换为这种格式期望数据集作为一个.txt文件，其中每一行是一个JSON编码QA对，像这样：
```python
'{"question": "q1", "answer": ["a11", ..., "a1i"]}'
...
'{"question": "qN", "answer": ["aN1", ..., "aNi"]}'
```
**格式B**   即文档阅读(Document Reader)部分 期望数据集作为一个.json文件，就像SQuAD数据集表现的那样：
```
file.json
├── "data"
│   └── [i]
│       ├── "paragraphs"
│       │   └── [j]
│       │       ├── "context": "paragraph text"
│       │       └── "qas"
│       │           └── [k]
│       │               ├── "answers"
│       │               │   └── [l]
│       │               │       ├── "answer_start": N
│       │               │       └── "text": "answer"
│       │               ├── "id": "<uuid>"
│       │               └── "question": "paragraph question?"
│       └── "title": "document id"
└── "version": 1.1
```
