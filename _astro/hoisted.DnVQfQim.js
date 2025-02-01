import"./hoisted.rasoniT7.js";async function o(){const t=await fetch("https://dev.azure.com/SE2425TheAvengers/_apis/projects/SEIIProject?api-version=7.0",{method:"GET",headers:{Authorization:`Basic ${btoa(":"+"6yXt6ztCVl5lMT5W7sLQxnD5uEjWplFgQA1HhkSLfi85sXrYJ6XGJQQJ99BAACAAAAAJsFPkAAASAZDOWTYs")}`}});if(!t.ok){document.getElementById("devops-project").innerHTML="<p>Error fetching project data. Please check the token or project URL.</p>";return}const e=await t.json();document.getElementById("devops-project").innerHTML=`
        <h3 class="text-xl font-semibold">${e.name}</h3>
        <p>${e.description||"No description available."}</p>
        <p><strong>Visibility:</strong> ${e.visibility}</p>
        <p><strong>State:</strong> ${e.state}</p>
        <a href="https://dev.azure.com/SE2425TheAvengers/SEIIProject" target="_blank" 
           class="text-blue-600 underline hover:text-blue-800 dark:text-blue-400">View on Azure DevOps</a>
      `}o();
