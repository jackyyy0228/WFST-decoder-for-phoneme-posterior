# WFST decoder for phoneme posterior

This is a WFST decoder for phoneme posterior built on kaldi. The WFST is composed of HCLG.


**H** is an 2 state HMM with probability of 0.95 for self-loop and probabilty of 0.05 to transit to final state.

**C** is an one-to-one mapping function of phoneme, which is built from a full-unigramm tree.

**L** is an one-to-one mapping of all phoneme.

**G** is an FST built from a 9-gram phone LM.

## How to use

### Dependencies

-kaldi 

-srilm (can be built with kaldi/tools/install_srilm.sh)

### Path

- Modify path.sh with your path of kaldi and srilm.

### Preprocess

- Format and make lang directory for data preparation of kaldi. (Should be modified with different kinds of input format)

- Train n-gram phone LM and generate HMM topology with specified self-loop prob.

```
$ bash scripts/preprocess.sh --self_loop_prob 0.95 --n_gram 9
```

### Decode

- Decode with given phoneme posteriors and graph compiled in preprocess.sh and automatically compute PER corresponding to correct transcription.

- The order of phoneme may be different (should be transformed manually) , since there is a specified order of kaldi (can be checked in data/lang/phones.txt).


```
$  python scripts/decode.py 
```




