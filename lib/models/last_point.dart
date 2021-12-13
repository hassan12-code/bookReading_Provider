class LastPoint {
  String bookTitle;
  String bookAuthor;
  String bookCover;
  int chapterNo;
  int totalChapters;
  int pageNo;

  LastPoint({
    required this.bookTitle,
    required this.bookAuthor,
    required this.chapterNo,
    required this.totalChapters,
    required this.pageNo,
    required this.bookCover,
  });

  factory LastPoint.fromJson(Map<String, dynamic> json) {
    return LastPoint(
        bookTitle: json["bookTitle"],
        bookAuthor: json["bookAuthor"],
        chapterNo: json["chapterNo"],
        totalChapters: json["totalChapters"],
        pageNo: json["pageNo"],
        bookCover: json["bookCover"]);
  }

  Map<String, dynamic> toJson() => {
        "bookTitle": this.bookTitle,
        "bookAuthor": this.bookAuthor,
        "chapterNo": this.chapterNo,
        "totalChapters": this.totalChapters,
        "pageNo": this.pageNo,
        "bookCover": this.bookCover,
      };
}
