---
title: "Paternalism in the algorithm"
description: "The delegation of our decisions, both individual and collective, towards an increasingly closed and unknown algorithm."
pubDate: "Feb 12 2026"
heroImage: "/Blog/Paternalismo.png"
tags: ["AI", "Synthetic Empathy", "Ethics"]
translationUrl: "/blog/paternalismo-en-el-algoritmo" 
---
<p style="text-align: justify;">
There is not a day in which we are not surrounded by algorithms that try to guide our choices. We see it, for example, in social media with systems that feed on our interaction, sometimes almost imperceptible, and adjust what is shown to us to tip the balance towards certain content. In that context, our decisions stop being completely ours, because they are made within an environment designed to push us in a direction.
</p>

<p style="text-align: justify;">
We often assume that this delegation is done "for our own good", to save us time and avoid the mental load of deciding what to watch on one of our few evenings of rest. And, on the surface, it works. Help in the face of indecision is usually perceived as something positive. But the question changes when the algorithm decides unilaterally, based on partial, biased, incomplete or conditioned information, and furthermore, does so without the user being fully aware of how that recommendation was reached.
</p>

<p style="text-align: justify;">
<a href="https://prism.sustainability-directory.com/area/digital-paternalism" target="_blank" rel="noopener noreferrer" class="text-black-600 underline hover:text-black-800"><strong>Algorithmic paternalism</strong></a> can be understood as the intervention of computational or artificial intelligence systems in human decision-making, guiding or limiting freedom of choice towards outcomes that the system, or those who design it, consider "better". The critical trait is that this guidance can operate in an opaque manner, so that the person does not always perceive how much of their decision truly comes from their deliberation and how much from the design of the environment.
</p>

<blockquote>I was surprised that algorithms were presented and marketed as an objective fact. A much more accurate description of an algorithm is that it is an opinion embedded in mathematics.</blockquote>
<figcaption>— Cathy O'Neil. <em>American mathematician and writer,</em></figcaption>

<p style="text-align: justify;">
And if that opinion furthermore cannot be seen from the inside, then the problem is no longer just what the system decides, but how and for whom it is deciding.
</p>

<p style="text-align: justify;">
Currently, algorithmic paternalism is not usually considered among the most visible risks associated with computing advances. However, as <a href="https://www.immersia.eu/recursos/blog/la-caja-negra-en-la-inteligencia-artificial" target="_blank" rel="noopener noreferrer" class="text-black-600 underline hover:text-black-800"><strong>black box</strong></a> type models become widespread and explainability decreases, it becomes more difficult to audit why the system recommends, prioritises or discards certain options. In that scenario, we cannot assume that the delegation of decisions will always operate for the benefit of the user. It can also reflect data biases, commercial incentives or design criteria that do not align with our values, tastes or preferences.
</p>

<p style="text-align: justify;">
The justification that has been given to us for the necessity of this phenomenon relies, to a great extent, on a prior idea, that people are irrational beings and that, therefore, we need "help" to decide better. Along this line, Dan Ariely popularises the thesis that we are "systematically and predictably irrational beings" in his book <em>Predictably Irrational: The Hidden Forces That Shape Our Decisions</em>. Ariely suggests that this irrationality appears as a recurring distance between the way we would like to behave and the way we actually do, a persistent gap that he calls <em>The Potential Human Gap</em>.
</p>

<figure style="text-align: center;">
  <img src="/Blog/PredictablyIrrational.jpg" alt="Predictably Irrational: The Hidden Forces that Shape Our Decisions" title="Predictably Irrational: The Hidden Forces that Shape Our Decisions" style="max-width: 30%; height: auto; margin: 0 auto; display: block;">
  <figcaption>Figure 1: <em>Predictably Irrational</em> (Dan Ariely, 2008), a book demonstrating human irrationality.</figcaption>
</figure>

<p style="text-align: justify;">
But not everyone buys that starting premise. In contrast, Herbert Simon nuanced that human beings can indeed be rational, although under very specific limits such as time, available information, computing capacity, context... That is, it is not so much irrationality as bounded rationality, we decide as best we can with what we have, not with what would be ideal to have.
</p>

<p style="text-align: justify;">
Despite this nuance, the idea that we are irrational beings has always won this battle, undervaluing us as beings capable of making decisions and thus justifying the idea that technology, algorithms and AI will be more apt to make decisions than ourselves. Furthermore, with the idea that this irrationality is incorrigible, it invites the exploitation of these deficiencies in our capacities to redirect our behaviour, no longer just correcting it, but directing it intentionally.
</p>

<p style="text-align: justify;">
A clear example in Catalonia is RisCanvi, an institutional tool for assessing risk (including recidivism) in the prison system. The ethical problem appears when that technical assessment functions as algorithmic paternalism, the system labels the person as more or less dangerous and that label conditions sensitive decisions such as intervention, classification, permits... displacing human deliberation towards a probabilistic logic. If furthermore the model is opaque or difficult to challenge, autonomy, explainability and justice in the face of errors or biases are weakened, reducing the person to a risk profile that is difficult to contradict when there is no comprehensible explanation.
</p>

<figure style="text-align: center;">
  <a 
    href="https://www.elconfidencial.com/tecnologia/2024-04-24/riscanvi-algoritmo-cataluna-prisiones-presos-inteligencia-artificial_3871170/"
    target="_blank"
    rel="noopener noreferrer"
    title="Open article in El Confidencial"
    style="display: inline-block;"
  >
    <img
      src="/Blog/RisCanvis.png"
      alt="Screenshot of the RisCanvi report (El Confidencial)"
      style="max-width: 60%; height: auto; margin: 0 auto; display: block; cursor: pointer;"
      loading="lazy"
    >
  </a>

  <figcaption>
    Figure 2: Report on <em>RisCanvi</em> in <em>El Confidencial</em>. (Click to open)
  </figcaption>
</figure>

<p style="text-align: justify;"> Ultimately, the problem is not that systems that help decide exist, but that the help transforms into direction without fully informed consent. When we accept that a model, however efficient it may be, can substitute our deliberation, we are giving up something more than time. We give up the judgement on what counts as a good decision. And there algorithmic paternalism stops being a technological convenience to become a moral and political question: who defines what is best, to what ends, and under what conditions of transparency and accountability. If we cannot see, understand and question the logic that pushes us, then the delegation is no longer assistance, it is <strong>governance over our choices</strong>.
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