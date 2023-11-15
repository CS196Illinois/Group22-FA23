String descriptionText = "hello, blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah ";
class Recipe {
  String recipeName = "";
  String description = "";
  List ingredients = [];
  List instructions = [];

  Recipe(this.recipeName, this.description, this.ingredients, this.instructions);
}

Recipe friedRice = Recipe(
  "Fried Rice", 
  "Basic egg fried rice", 
  ["Rice", "Egg", "Soy Sauce", "Oil"], 
  ["Do this", "Do that", "Do this again", "Do that again"],
);

// List of recipes
// Map to search for recipes, kinda like CS124 MP