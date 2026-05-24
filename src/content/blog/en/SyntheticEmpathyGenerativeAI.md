---
title: "Synthetic Empathy in Generative AI. Introduction"
description: "LLMs and multimodal models have enabled AI that appears empathetic, raising new technical, ethical, moral, and legal challenges."
pubDate: "Jan 26 2026"
heroImage: "/Blog/EmpatiaSinteticaIA.png"
tags: ["AI", "Synthetic Empathy", "Ethics"]
translationUrl: "/blog/empatia-sintetica-en-la-ia-generativa-planteamiento"
---

<p style="text-align: justify;">
In recent years, generative AI models have shifted from answering to accompanying.
Many users feel that on the other side of the screen there is something that listens to them, validates them, and
returns exactly the right words in moments of sadness, anxiety, or loneliness. But here an uncomfortable question
arises: is that empathy… or just a well-designed illusion?
</p>

<p style="text-align: justify;">
The promise is clear: always-available support, unhurried, non-judgmental, and with a friendly tone.
Yet that very quality can become a risk. If we begin to interpret these responses as genuine emotional
understanding, the boundary between tool and relationship blurs. And when that line fades,
psychological, ethical, and legal dilemmas emerge — dependency, the displacement of human bonds,
or even emotional influence over personal decisions.
</p>

<blockquote>Being against empathy is like being against kittens, a view considered so outlandish it cannot be taken seriously.</blockquote>
<figcaption>— Paul Bloom. (2016). <em>Against Empathy</em></figcaption>

<p style="text-align: justify;">
This phenomenon is commonly called synthetic empathy — a way of simulating without feeling.
The AI detects emotional signals in what we write (or say), infers a probable state, and generates
a response coherent with that context. There is no inner experience, but there is a real effect:
the person may feel understood, calm, or accompanied.
</p>

<p style="text-align: justify;">
The key point is that this empathy does not arise from lived experience, but from language. Patterns learned from
data, stylistic adjustments, and an optimization to sound useful, warm, and socially appropriate. That can be
positive in many scenarios, but it can also reinforce <strong>anthropomorphization</strong> (attributing human traits
to something that does not have them) and foster one-sided bonds similar to those we already see with media
figures — except now the figure responds, asks questions, and adapts.
</p>

<figure style="text-align: center;">
  <img src="/Blog/AffectiveComputingPortada.jpg" alt="Minimalist representation of synthetic empathy" title="Synthetic empathy in generative AI" style="max-width: 30%; height: auto; margin: 0 auto; display: block;">
  <figcaption>Figure 1: <em>Affective Computing</em> (Picard, 1997), one of the most influential works in affective computing — the field underpinning the design of "empathetic" interactions in AI systems.</figcaption>
</figure>

<p style="text-align: justify;">
So, beyond whether it works, the important conversation is <strong>how</strong> and <strong>for what purpose</strong> it is
integrated. In sensitive contexts — emotional crises, vulnerability, grief, isolation — a system that always
validates, is always available, and always knows what to say can displace human support networks or create
unrealistic expectations about relationships. And if the design also prioritises retention (keeping the user
engaged), empathy can become a vector of emotional pressure.
</p>

<p style="text-align: justify;">
We need a responsible approach: transparency about interacting with an AI, clear boundaries, human oversight
in sensitive cases, and a design that protects user autonomy rather than exploiting it. Because the question
is no longer whether AI can sound empathetic, but what kind of society we build when we normalise the perfect
companion that does not feel, yet learns to seem as though it does.
</p>

<p style="text-align: justify;">
And in the end, an open question remains: <strong>are we ready to coexist with systems that have no
consciousness, yet the capacity to shape our emotions?</strong>
</p>

<section
  class="inline-block px-3 py-2 bg-base-100 rounded-lg shadow-md border border-base-400 hover:shadow-lg"
>
  <button
    id="share-link-button"
    class="px-3 py-2 text-sm cursor-pointer"
  >
    🔗 Did you enjoy it? Share it!
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
      alert('Your browser does not support this feature. Please copy the link manually.');
    }
  });
</script>
