# Build a Generatively Pretrained Transformer (GPT), following the paper "Attention is All You Need" and OpenAI's GPT-2 / GPT-3. 

https://www.youtube.com/watch?v=kCc8FmEb1nY&t=450s

- Papaers
    - [Attention is All You Need paper](https://arxiv.org/abs/1706.03762) , [PDF](papers/1706.03762v7.pdf)
        - If you read this paper, it likes a pretty random machine translation paper, and that's because the author didn't fully anticipate the impact that the Transformer would have on the field.
        - The architecture they produced actually ended up taking over the rest of AI in the next 5 years after. The architecture with minor changes was copy-pasted into a huge amount of AI applications in more recent years. And that includes at the core of chatGPT.
    - [OpenAI GPT-3 paper](https://arxiv.org/abs/2005.14165) , [PDF](papers/2005.14165v4.pdf)


- Language Model
    - It models the sequence of words, or tokens, and it knows how sort of words following each other.
- GPT
    - GPT is short for Generatively Pretrained Transformer. So Transformer is the neural nut that actullay does all the heavy lifting under the hood.

I'd like to focus on is just to train a Transformer based language model. And in our case it's going to be a character level language model.

We need a smaller data set, in this case, the ['Tiny Shakespeare'](https://raw.githubusercontent.com/karpathy/char-rnn/master/data/tinyshakespeare/input.txt).

We're going to basically model how these characters follow each other. Once we've trained the system, we can generate infinite Shakespeare. And of course it's a fake thing that looks like Shakespeare.


I've already written this entire code to train these Transformers, it's called [nano GPT](https://github.com/karpathy/nanoGPT). It's a repository for training Transformers on any given text. There's many ways to train Transformers. This is a very simple implementation. Just 2 files of 300 lines of code. I've only so far reproduced the smallest 124M parameter GPT-2 model, but basically this is just proving that the code base is correctly arranged and I'm able to load the neural network weights that openAI has released later.


## Training a Transformer

Now the important to realize is we're never going to actually feed the entire text into Transformer all at one, that would be computationally very expensive. Instead, we're going to feed it in chunks of text.

When we train the Transformers we basically sample random little chunks out of the training set, and train them just chunks at a time and these chunks have basically some kind of a max-length called, e.g.,  `block_size`.
