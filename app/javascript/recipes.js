const recipeList = document.querySelector("#recipe-list");
const recipeDetails = document.querySelector("#recipe-details");

recipeList.addEventListener("click", async (event) => {
  if (event.target.tagName !== "LI") {
    return;
  }

  const recipeName = event.target.textContent.trim();
  const slug = encodeURIComponent(recipeName);
  const response = await fetch("/recipes/" + slug);
  const recipe = await response.json();

  recipeDetails.innerHTML = `
<h2 id="title">${recipe.name}</h2>
<p id="details">${recipe.description}</p>
<div style="display:flex; flex-grow:1;">
  <label for="ingredients">
  <span id="i-li-label">Ingredients</span>
    <ul id="ingredients">
      ${recipe.foods
        .map(
          (food) => `
          <li>
          <div id="amount">${food.amount} ${food.unit}</div>
          <div id="ingredient">${food.name}</div>
          </li>
          `
        )
        .join("")}
    </ul>
  </label>
</div>
    `;
});
