class OrderModel{
  final int orderId;
  final String orderDate;
  final String personImage;
  final int orderPrice;
  final bool status;
  final String ordersName;
  final String orderDecoration;
  final List<ContentOrder> contents;
  final int priceSum;

  OrderModel(this.orderId, this.orderDate, this.personImage, this.orderPrice,
      this.status, this.orderDecoration,this.contents,this.priceSum,this.ordersName);
}
class ContentOrder {
  final String image;
  final String title;
  final int price;
  final int countSell;

  ContentOrder(this.image, this.title, this.price,this.countSell);
}