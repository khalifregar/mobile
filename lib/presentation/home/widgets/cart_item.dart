// lib/models/cart_item.dart
class CartItem {
  final String name;
  final double price;
  final String imagePath;
  final String color;
  final bool inStock;
  int quantity;
  bool isSelected;

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.color,
    required this.inStock,
    required this.quantity,
    required this.isSelected,
  });
}