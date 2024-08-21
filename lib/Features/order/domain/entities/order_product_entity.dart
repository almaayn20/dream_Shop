class OrderProductEntity {
  final int productID;
  final int productQuantity;
  final double? productPrice;
  OrderProductEntity({
    required this.productID,
    required this.productQuantity,
    this.productPrice,
  });
}
