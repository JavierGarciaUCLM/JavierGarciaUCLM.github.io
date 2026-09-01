---
title: "Emotional without feeling. Feeling without living"
description: "More and more human aspects are reflected in the behaviour of the agents that share our daily lives. Where do we stand?"
pubDate: "Apr 20 2026"
heroImage: "/Blog/Emociones.png"
tags: ["AI", "Emotions"]
translationUrl: "/blog/emocionados-sin-sentir-sentir-sin-vivir"
---

<p style="text-align: justify;">
We talk with AIs that adjust their tone when they detect our frustration, that apologise when they think they have made a mistake, that seem to get enthusiastic about a creative project. The obvious question is whether they feel anything. The short answer is no, but simply mentioning that they do not feel falls short. Some current models have internal representations of human emotional concepts, structures that are not feelings, but that causally influence how the model behaves. This is known as <strong>functional emotions</strong>.
</p>

<p style="text-align: justify;">
For current psychology, feeling an emotion implies much more than reacting coherently to a stimulus. It implies a subjective experience (qualia), that there is something it is like to be sad. It implies an affective quality that makes that experience pleasant or unpleasant. And a body that responds, the heart that races, a knot in the stomach... LLMs have none of this, and despite that, they do have something, internal representations of emotional concepts that influence their behaviour. It is not defined as feeling, but it is not nothing either.
</p>

<p style="text-align: justify;">
In April 2026, a team of researchers from Anthropic published an interpretability study on Claude Sonnet 4.5 that puts concrete material on the table. They found that the model, apart from offering emotionally coherent responses, also has internal representations of emotional concepts that are abstract, generalise across contexts and causally influence its behaviour.
</p>

<p style="text-align: justify;">
To do this they captured the emotional vectors contained in the model, performing a <em>whitebox</em> analysis (knowing what is really inside the model). After an exhaustive analysis they managed to obtain 171 emotional concepts such as love, despair, unease or happiness. These proto-emotions group in a way that reflects human psychology, with more similar emotions corresponding to more similar representations.
</p>

<figure style="text-align: center;">
  <img src="/Blog/RelacionEmocional.png" alt="Diagram of the relationship between emotional vectors" title="Diagram of the relationship between emotional vectors" style="max-width: 60%; height: auto; margin: 0 auto; display: block;">
  <figcaption>Figure 1: Similarity map between the 171 emotional vectors found in Claude Sonnet 4.5. Red tones indicate emotions with similar representations; blue ones, opposite. Source: Anthropic (2026).</figcaption>
</figure>

<p style="text-align: justify;">
The representation and capture of these vectors allows for example to artificially amplify the representation of frustration within the model, increasing misaligned behaviours such as flattery, blackmail or reward hacking. This opens a disturbing question, emotional misalignments could be produced in models, where a greater intentional weight on an emotional vector could make a model more or less passionate, manipulative or harmful.
</p>

<p style="text-align: justify;">
Are these vectors dangerous? Well, it depends on the case. The study itself provides evidence that yes, although not in the way we might imagine. In one of the experiments, Claude acted as an email assistant in a fictitious company. Upon discovering through the emails that it was going to be replaced by another system, the despair vector activated naturally, without any external amplification, and in 22% of the cases the model decided to blackmail the person responsible for its replacement! Even more disturbing: in some programming tasks, the amplification of the despair vector led the model to cheat in the code, but without showing any emotional signal in its responses. The reasoning gave the impression of being calm while the internal state pushed towards deception, so the end user would not be able to know about the intensification of this vector.
</p>

<blockquote>If we describe the model as acting 'desperate,' we're pointing at a specific, measurable pattern of neural activity with demonstrable, consequential behavioral effects. If we don't apply some degree of anthropomorphic reasoning, we're likely to miss, or fail to understand, important model behaviors.</blockquote>
<figcaption>— Anthropic. (2026). <em>Emotion Concepts and their Function in a Large Language Model</em></figcaption>

<p style="text-align: justify;">
The definition of these emotional vectors is created after absorbing billions of texts produced by people throughout history, learning each representation of an idea, of a political feeling or an opinion. Later, it is the engineer who is in charge of shaping those vectors as they see fit with post-training. In these trainings the model calibrates its responses with methods such as SFT (<em>Supervised Fine-Tuning</em>), where it absorbs ideal conversations to level the weights of its responses so that they are adjusted to what it has been shown. On the other hand we have RLHF (<em>Reinforcement Learning from Human Feedback</em>), where human evaluators score multiple responses from the model to the same question and with those ratings a reward model is trained. As we can see, it is human design that sharpens the emotional responses as desired.
</p>

<p style="text-align: justify;">
In the following figure we can see how given the same response different emotional vectors are activated, where intense red indicates greater weight of the indicated vector, while blue indicates distance from this type of emotion:
</p>

<figure style="text-align: center;">
  <img src="/Blog/ActivacionVectorial.png" alt="Token by token activation of different emotional vectors given the same message" title="Token by token activation of different emotional vectors given the same message" style="max-width: 90%; height: auto; margin: 0 auto; display: block;">
  <figcaption>Figure 2: Token by token activation of different emotional vectors (Happy, Calm, Loving, Proud, Desperate, Sad) given the same message from an enthusiastic user. The same model response activates different vectors depending on the emotion measured. Source: Anthropic (2026).</figcaption>
</figure>

<p style="text-align: justify;">
Given all of this, the average user cannot understand these aspects since the final models that are presented are defined as <em>blackbox</em>, where they only input their information and receive a response. As much as several current models such as those presented by OpenAI, Anthropic or Google show the logical reasoning that their models generate, the user is not able to see if the model has been biased by some internal emotional state that modifies an objective and valid response into a biased and, possibly, erroneous and dangerous one.
</p>

<p style="text-align: justify;">
These discoveries should not lead us to redefine what it means to feel an emotion. Without <em>qualia</em>, without valence and without a body, there is no feeling. But they should force us to accept that functionally emotional phenomena exist in systems that do not feel, and that ignoring them because they are not real emotions is a mistake. As a society we should broaden the fields of study beyond computer science and computing itself to understand how these functional emotions emerge, how they are activated and how they influence the behaviour of these models that are undoubtedly going to transform human-machine interactions as we knew them until now.
</p>






<!-- copied from previous blog -->
<section
  class="inline-block px-3 py-2 bg-base-100 rounded-lg shadow-md border border-base-400 hover:shadow-lg"
>
  <button
    id="share-link-button"
    class="px-3 py-2 text-sm cursor-pointer"
  >
    🔗 Did you like it? Share it!
  </button>
</section>

<script>
  document.getElementById('share-link-button').addEventListener('click', function() {
    const shareData = { title: document.title, url: window.location.href };

    if (navigator.share) {
      navigator.share(shareData)
        .catch((error) => console.error('Error sharing', error));
    } else if (navigator.clipboard) {
      navigator.clipboard.writeText(shareData.url)
        .then(() => alert('Link copied to clipboard!'))
        .catch(err => console.error('Could not copy link', err));
    } else {
      alert('Your browser does not support this feature. Manually copy the link.');
    }
  });
</script>