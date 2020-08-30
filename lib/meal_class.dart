class Meal {
  final String name, imagePath, protein, fat, carbs,preparation;
  final List <String> ingredients;
  Meal({this.name, this.imagePath, this.carbs, this.protein, this.fat,this.ingredients,this.preparation});
}

var meals = [
  Meal(
      name: "PIZZA",
      imagePath: "assets/pizza.jpeg",
      protein: "250mg",
      fat: "500mg",
      carbs: "600mg",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisins",
        "1 tbsp of honey",
      ],
      preparation:
      ('''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.
Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.
Ultricies lacus sed turpis tincidunt id aliquet risus feugiat.''')
  ),
  Meal(
    name: "PIZZA",
    imagePath: "assets/pizza.jpeg",
    protein: "250mg",
    fat: "500mg",
    carbs: "600mg",
    ingredients: [
      "1 cup of granola",
      "1 banana",
      "1/2 cup of raisins",
      "1 tbsp of honey",
    ],
    preparation:('''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
  Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
  Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.
  Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.
  Ultricies lacus sed turpis tincidunt id aliquet risus feugiat.'''),
  ),
  Meal(
      name: "PIZZA",
      imagePath: "assets/pizza.jpeg",
      protein: "250mg",
      fat: "500mg",
      carbs: "600mg",
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisins",
        "1 tbsp of honey",
      ],
      preparation:
      ('''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.
Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.
Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.
Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.
Ultricies lacus sed turpis tincidunt id aliquet risus feugiat.''')
  ),
];
