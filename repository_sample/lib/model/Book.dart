class Book {
  int price;
  String title;
  String thumbnail;

  Book(this.price, this.title, this.thumbnail);

  Book.fromMap(Map<String, dynamic> data)
      : price = data['price'],
        title = data['title'],
        thumbnail = data['thumbnail'];
}
