class OrderItem {
  final String name;
  final int price;

  OrderItem({required this.name, required this.price});
}

class Order {
  final String orderNumber;
  final List<OrderItem> items;
  final int total;

  Order({required this.orderNumber, required this.items, required this.total});
}
