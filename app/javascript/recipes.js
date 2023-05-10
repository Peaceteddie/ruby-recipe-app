var LastSelected = null;
const recipeList = document.querySelector("#recipe-list");
const recipeDetails = document.querySelector("#recipe-details");

recipeList.addEventListener("click", async (event) => {
  if (event.target.tagName !== "LI") {
    return;
  }

  if (LastSelected != null) {
    LastSelected.classList.remove("selected");
  }

  LastSelected = event.target;
  event.target.classList.add("selected");

  const response = await fetch("/recipes/" + event.target.id);
  const response_json = await response.json();

  const recipe = response_json.recipe;
  const ingredients = response_json.ingredients;

  const isEven = (num) => {
    return num % 2 === 0;
  };

  const recipeDetails = document.getElementById("recipe-details");

  const title = document.createElement("h2");
  title.setAttribute("id", "title");
  title.textContent = recipe.name;

  const details = document.createElement("p");
  details.setAttribute("id", "details");
  details.textContent = recipe.description;

  const taglist = document.createElement("ul");
  taglist.setAttribute("id", "taglist");

  for (let i = 0; i < recipe.tags.length; i++) {
    const tag = recipe.tags[i];

    const li = document.createElement("li");
    li.setAttribute("id", "tag");
    li.style.background = isEven(i) ? "#0001" : "#0000";

    li.textContent = tag.name;

    taglist.appendChild(li);
  }

  const ul = document.createElement("ul");
  ul.setAttribute("id", "ingredients");

  const liLabel = document.createElement("span");
  liLabel.setAttribute("id", "i-li-label");
  liLabel.textContent = "Ingredients";

  const label = document.createElement("label");
  label.setAttribute("for", "ingredients");
  label.appendChild(liLabel);
  label.appendChild(ul);

  const div = document.createElement("div");
  div.appendChild(label);

  for (let i = 0; i < ingredients.length; i++) {
    const ingredient = ingredients[i];

    const li = document.createElement("li");

    const amountDiv = document.createElement("div");
    amountDiv.setAttribute("id", "amount");
    amountDiv.style.background = isEven(i) ? "#0001" : "#0000";
    amountDiv.textContent = `${ingredient.amount} ${
      ingredient.unit === "None" ? "" : ingredient.unit
    }`;

    const ingredientDiv = document.createElement("div");
    ingredientDiv.setAttribute("id", "ingredient");
    ingredientDiv.style.background = isEven(i) ? "#0001" : "#0000";
    ingredientDiv.textContent = ingredient.food;

    li.appendChild(amountDiv);
    li.appendChild(ingredientDiv);

    ul.appendChild(li);
  }

  recipeDetails.innerHTML = "";
  recipeDetails.appendChild(title);
  recipeDetails.appendChild(details);
  recipeDetails.appendChild(taglist);
  recipeDetails.appendChild(div);
});
