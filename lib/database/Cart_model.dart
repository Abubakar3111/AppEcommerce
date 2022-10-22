class Cart {
  late final int? id;
  final String? productId;
  final String? ProductNAme;
  final int? initialPrice;
  final int? ProductPrice;
  final int? quantity;
  final String? ProductImages;
  Cart({
    required this.id,
    required this.productId,
    required this.ProductNAme,
    required this.initialPrice,
    required this.ProductPrice,
    required this.quantity,
    required this.ProductImages,
  });
  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        ProductNAme = res['ProductNAme'],
        initialPrice = res['initialPrice'],
        ProductPrice = res['ProductPrice'],
        quantity = res['quantity'],

        ProductImages = res['ProductImages'];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'ProductNAme': ProductNAme,
      'initialPrice': initialPrice,
      'productPrice': ProductPrice,
      'quantity': quantity,

      'ProductImages': ProductImages
    };
  }
}
