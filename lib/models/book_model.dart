class BookModel {
  String image;
  String secondImage;
  String title;
  String subtitle;
  bool favorite;

  BookModel({
    required this.image,
    required this.secondImage,
    required this.title,
    required this.subtitle,
    required this.favorite,
  });

  static List<BookModel> newBooks = [
    BookModel(
      image: "assets/images/New_Book_1.jpg",
      secondImage: "assets/images/New_Book_1.jpg",
      title: "It Ends With Us",
      subtitle: "-Colleen Hoover",
      favorite: true,
    ),
    BookModel(
      image: "assets/images/New_Book_2.jpg",
      secondImage: "assets/images/New_Book_2.jpg",
      title: "The Silent Patient",
      subtitle: "-Alex Michaelindas",
      favorite: true,
    ),
  ];
  static List<BookModel> books = [
    BookModel(
        image: "assets/images/Book_1.jpg",
        secondImage: "assets/images/Book_1.jpg",
        title: "Black Holes And Baby Universes  ",
        subtitle: "Baby Universities and Other Essays",
        favorite: true),
    BookModel(
        image: "assets/images/Book_2.jpg",
        secondImage: "assets/images/Book_2.jpg",
        title: "The Grand Design",
        subtitle: "#1 New York Times Bestseller",
        favorite: false),
    BookModel(
        image: "assets/images/Book_3.jpg",
        secondImage: "assets/images/Book_3.jpg",
        title: "A Life In Science",
        subtitle: "Micheal White & Dr.John Gribbin",
        favorite: true),
    BookModel(
        image: "assets/images/Book_4.jpg",
        secondImage: "assets/images/Book_4.jpg",
        title: "Harry Potter and the Deadly Hallow",
        subtitle: "J K Rowling 's Harry Potter",
        favorite: true),
    BookModel(
        image: "assets/images/Book_5.jpg",
        secondImage: "assets/images/Book_5.jpg",
        title: "Fantastic Beasts ",
        subtitle: "Original ScreenPlay",
        favorite: true),
  ];
}
