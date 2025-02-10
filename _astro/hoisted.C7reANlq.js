import"./hoisted.BScVxmeO.js";async function e(){const t=await(await fetch("https://api.github.com/repos/JavierGarciaUCLM/Jobder")).json();document.getElementById("github-repo").innerHTML=`
        <h3 class="text-xl font-semibold">${t.full_name}</h3>
        <p>${t.description||"No description available."}</p>
        <p><strong>Last updated:</strong> ${new Date(t.updated_at).toLocaleDateString()}</p>
        <p><strong>Stars:</strong> ${t.stargazers_count} ⭐</p>
        <a href="${t.html_url}" target="_blank" class="text-blue-600 underline hover:text-blue-800 dark:text-blue-400">View on GitHub</a>
      `}e();
