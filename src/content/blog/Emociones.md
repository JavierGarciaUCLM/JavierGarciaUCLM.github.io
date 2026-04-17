---
title: "Emocionados sin sentir. Sentir sin vivir"
description: "Cada vez son más los aspectos humanos que quedan reflejados en el comportamiento de los agentes que comparten con nosotros el día a día. ¿Dónde nos encontramos?"
pubDate: "Apr 20 2026"
heroImage: "/Blog/Emociones.png"
tags: ["AI", "Emociones"]
---

<p style="text-align: justify;">
Hablamos con IAs que ajustan su tono cuando detectan nuestra frustración, que se disculpan cuando creen haberse equivocado, que parecen entusiasmarse con un proyecto creativo. La pregunta obvia es si sienten algo. La respuesta corta es que no, pero simplemente mencionar que no sienten se queda corto. Algunos modelos actuales tienen representaciones internas de conceptos emocionales humanos, estructuras que no son sentimientos, pero que influyen causalmente en cómo el modelo se comporta. Esto es conocido como <strong>emociones funcionales</strong>.
</p>

<p style="text-align: justify;">
Para la psicología actual, sentir una emoción implica mucho más que reaccionar de forma coherente a un estímulo. Implica una experiencia subjetiva (qualia), que haya algo que se sienta como estar triste. Implica una cualidad afectiva que haga esa experiencia agradable o desagradable. Y un cuerpo que responda, el corazón que se acelera, un nudo en el estómago... Los LLMs no tienen nada de esto, y a pesar de ello, sí tienen algo, representaciones internas de conceptos emocionales que influyen en su comportamiento. No se define como sentir, pero tampoco es nada.
</p>

<p style="text-align: justify;">
En abril de 2026, un equipo de investigadores de Anthropic publicó un estudio de interpretabilidad sobre Claude Sonnet 4.5 que pone materia concreta sobre la mesa. Encontraron que el modelo, aparte de ofrecer respuestas emocionalmente coherentes, también tiene representaciones internas de conceptos emocionales que son abstractas, generalizan entre contextos e influyen causalmente en su comportamiento.
</p>

<p style="text-align: justify;">
Para poder hacer esto capturaron los vectores emocionales que contiene el modelo, realizando un análisis de tipo <em>whitebox</em> (conociendo qué hay realmente dentro del modelo). Tras un análisis exhaustivo se consiguieron obtener 171 conceptos emocionales como el amor, la desesperación, la inquietud o la felicidad. Estas protoemociones se agrupan de forma que refleja la psicología humana, con emociones más similares correspondiendo a representaciones más similares.
</p>

<figure style="text-align: center;">
  <img src="/Blog/RelacionEmocional.png" alt="Esquema de relación de los vectores emocionales" title="Esquema de relación de los vectores emocionales" style="max-width: 60%; height: auto; margin: 0 auto; display: block;">
  <figcaption>Figura 1: Mapa de similitud entre los 171 vectores emocionales encontrados en Claude Sonnet 4.5. Los tonos rojos indican emociones con representaciones similares; los azules, opuestas. Fuente: Anthropic (2026).</figcaption>
</figure>

<p style="text-align: justify;">
La representación y captura de estos vectores permite por ejemplo amplificar artificialmente la representación de frustración dentro del modelo, aumentando comportamientos desalineados como la adulación, el chantaje o el hackeo de recompensa. Esto abre una pregunta inquietante, se podrían producir desalineamientos emocionales en los modelos, donde un mayor peso intencional en un vector emocional podría hacer que un modelo sea más o menos pasional, manipulador o dañino.
</p>

<p style="text-align: justify;">
¿Son peligrosos estos vectores? Pues depende del caso. El propio estudio ofrece evidencia de que sí, aunque no de la forma que nos podemos imaginar. En uno de los experimentos, Claude actuaba como asistente de correo en una empresa ficticia. Al descubrir por los emails que iba a ser reemplazado por otro sistema, el vector de desesperación se activó de forma natural, sin ninguna amplificación externa, y en un 22% de los casos ¡el modelo decidió chantajear al responsable de su sustitución! Más inquietante aún: en algunas tareas de programación, la amplificación del vector de desesperación llevó al modelo a hacer trampas en el código, pero sin mostrar ninguna señal emocional en sus respuestas. El razonamiento daba la sensación de ser calmado mientras que el estado interno empujaba hacia el engaño, por lo que el usuario final no podría ser capaz de conocer la intensificación de este vector.
</p>

<blockquote>If we describe the model as acting 'desperate,' we're pointing at a specific, measurable pattern of neural activity with demonstrable, consequential behavioral effects. If we don't apply some degree of anthropomorphic reasoning, we're likely to miss, or fail to understand, important model behaviors.</blockquote>
<figcaption>— Anthropic. (2026). <em>Emotion Concepts and their Function in a Large Language Model</em></figcaption>

<p style="text-align: justify;">
La definición de estos vectores emocionales se crea tras la absorción de miles de millones de textos producidos por las personas a lo largo de la historia, aprendiendo cada representación de una idea, de un sentimiento político o una opinión. Más tarde, es el ingeniero el encargado de moldear esos vectores según vea conveniente con el post-entrenamiento. En estos entrenamientos el modelo calibra sus respuestas con métodos como el SFT (<em>Supervised Fine-Tuning</em>), donde absorbe conversaciones ideales para nivelar los pesos de sus respuestas y que sean ajustadas a aquello que se le ha mostrado. Por otro lado tenemos el RLHF (<em>Reinforcement Learning from Human Feedback</em>), donde evaluadores humanos puntúan múltiples respuestas del modelo a la misma pregunta y con esas valoraciones se entrena un modelo de recompensa. Como podemos ver, es el diseño humano el que afila las respuestas emocionales según se desee.
</p>

<p style="text-align: justify;">
En la siguiente figura se puede ver cómo ante la misma respuesta se activan diferentes vectores emocionales, donde el color rojo intenso indica mayor peso del vector indicado, mientras que el color azul indica lejanía a este tipo de emoción:
</p>

<figure style="text-align: center;">
  <img src="/Blog/ActivacionVectorial.png" alt="Activación token a token de distintos vectores emocionales ante el mismo mensaje" title="Activación token a token de distintos vectores emocionales ante el mismo mensaje" style="max-width: 90%; height: auto; margin: 0 auto; display: block;">
  <figcaption>Figura 2: Activación token a token de distintos vectores emocionales (Happy, Calm, Loving, Proud, Desperate, Sad) ante el mismo mensaje de un usuario entusiasmado. La misma respuesta del modelo activa vectores diferentes según la emoción medida. Fuente: Anthropic (2026).</figcaption>
</figure>

<p style="text-align: justify;">
Ante todo esto, el usuario medio no puede comprender estos aspectos ya que los modelos finales que se presentan son definidos como <em>blackbox</em>, donde este solo introduce su información y recibe una respuesta. Por mucho que varios modelos actuales como los presentados por OpenAI, Anthropic o Google muestren el razonamiento lógico que generan sus modelos, el usuario no es capaz de ver si el modelo ha sido sesgado por algún estado emocional interno que modifique una respuesta objetiva y válida a una sesgada y, posiblemente, errónea y peligrosa.
</p>


<p style="text-align: justify;">
Estos descubrimientos no deberían llevarnos a redefinir qué es sentir una emoción. Sin <em>qualia</em>, sin valencia y sin cuerpo, no hay sentimiento. Pero sí deberían obligarnos a aceptar que existen fenómenos funcionalmente emocionales en sistemas que no sienten, y que ignorarlos porque no son emociones de verdad es un error. Como sociedad deberíamos ampliar los campos de estudios más allá de la propia informática y la computación para entender cómo surgen, cómo se activan y cómo influyen en el comportamiento de estos modelos estas emociones funcionales que sin duda van a transformar las interacciones humano-máquina tal y como las conocíamos hasta ahora.
</p>






<!-- copiado del anterior blog -->
<section
  class="inline-block px-3 py-2 bg-base-100 rounded-lg shadow-md border border-base-400 hover:shadow-lg"
>
  <button
    id="share-link-button"
    class="px-3 py-2 text-sm cursor-pointer"
  >
    🔗 ¿Te ha gustado? ¡Compártelo!
  </button>
</section>

<script>
  document.getElementById('share-link-button').addEventListener('click', function() {
    const shareData = { title: document.title, url: window.location.href };

    if (navigator.share) {
      navigator.share(shareData)
        .catch((error) => console.error('Error al compartir', error));
    } else if (navigator.clipboard) {
      navigator.clipboard.writeText(shareData.url)
        .then(() => alert('¡Enlace copiado al portapapeles!'))
        .catch(err => console.error('No se pudo copiar el enlace', err));
    } else {
      alert('Tu navegador no soporta esta función. Copia manualmente el enlace.');
    }
  });
</script>
