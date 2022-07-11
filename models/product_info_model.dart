
class ProductInfoModel{
  final String imageProduct;
  final String nameProduct;
  final String categoryProduct;
  final String statusProduct;
  final String unitProduct;
  final String mostNumberProduct;
  final String priceProduct;
  final String descriptionProduct;
  final List<dynamic> daysProduct;
  final String toTimeProduct;
  final String fromTimeProduct;

  ProductInfoModel(
      this.imageProduct,
      this.nameProduct,
      this.categoryProduct,
      this.statusProduct,
      this.unitProduct,
      this.mostNumberProduct,
      this.priceProduct,
      this.descriptionProduct,
      this.daysProduct,
      this.toTimeProduct,
      this.fromTimeProduct
      );
}