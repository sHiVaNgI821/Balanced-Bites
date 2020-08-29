
class Food {
  final String name;
  final double energy;
  final double carbs;
  final double protein;
  final double sugar;
  final double fat;
  final double fibre;
  final double cholestrol;

  Food(this.name, this.energy, this.carbs, this.sugar, this.protein, this.fat,
      this.fibre, this.cholestrol);
}
var foodList=[];
  /*factory Food.fromJson(Map<String, dynamic> json) {
    return new Food(
      name: json['product_name'] as String,
      energy: json['energy_100g'] as double,
      carbs: json['carbohydrates_100g'] as double,
      protein: json['proteins_100g'] as double,
      sugar: json['sugars_100g'] as double,
      fat: json['fat_100g'] as double,
      fibre: json['fiber_100g'] as double,
      cholestrol: json['cholesterol_100g'] as double,
    );
  }*/

/*class FoodList{
  final List<Food> items;
  FoodList({this.items,});
  factory FoodList.fromJson(List<dynamic> parsedJson)
  {
    List<Food> items =  List<Food>();
    items = parsedJson.map((i)=>Food.fromJson(i)).toList();

    return FoodList(
        items: items
    );
  }
}*/
