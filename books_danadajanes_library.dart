ECHO is on.

// تعريف مكتبة الكتب كمجموعة (Map)
Map<String, Map<String, dynamic>> libreries = {};

//  دالة لإضافة كتاب إلى المكتبة
void addBook({
  required String TitlEE,
  String Autheer = "Unknown",
  int YEAR = 0,
  String GENREKIND = "General",
}) {
  libreries[TitlEE] = {
    'Autheer':   Autheer,
    'YEAR': YEAR,
    'GENREKIND': GENREKIND,
  };
  print("Book added successfully.");
}

// دالة لاسترجاع معلومات كتاب معين
String getBookInfo({required String TitlEE}) {
  if (libreries.containsKey(TitlEE)) {
    var book = libreries[TitlEE]!;
    return "Autheer: ${book['Autheer']}, YEAR: ${book['YEAR']}, GENREKIND: ${book['GENREKIND']}";
  }
  return "Book not found.";
}

//  دالة لعرض جميع الكتب وبنعمل التصفية حسب النوع
void listAllBooks({String? GENREKIND}) {
  if (libreries.isEmpty) {
    print("No books in the libreries.");
    return;
  }

  libreries.forEach((TitlEE, book) {
    if (GENREKIND == null || book['GENREKIND'] == GENREKIND) {
      print("TitlEE: $TitlEE, Autheer: ${book['Autheer']}, YEAR: ${book['YEAR']}, GENREKIND: ${book['GENREKIND']}");
    }
  });
}

// دالة بعطيني الكتب يعني نوع الخيال كل كتب الخيال حسب النوع
List<String> listBooksByGENREKIND({required String GENREKIND}) {
  List<String> booksInGENREKIND = [];

  libreries.forEach((TitlEE, book) {
    if (book['GENREKIND'] == GENREKIND) {
      booksInGENREKIND.add(TitlEE);
    }
  });

  return booksInGENREKIND.isNotEmpty ? booksInGENREKIND : ["No books found for this GENREKIND."];
}

// حسب عنوان الكتاب دالة لحذف كتاب معين
String removeBook({required String TitlEE}) {
  if (libreries.containsKey(TitlEE)) {
    libreries.remove(TitlEE);
    return "Book removed successfully.";
  }
  return "Book not found.";
}


void main() {
  addBook(TitlEE: "Dart tutorials", Autheer: "Yazan Dajane", YEAR: 2024, GENREKIND: "Programming");
addBook(TitlEE: "c++ language_pro", GENREKIND: "Programming");
  addBook(TitlEE: "Flutter Development", Autheer: "Faten TuqaaN", YEAR: 2025, GENREKIND: "Programming");
  addBook(TitlEE: "Mystery Novel", Autheer: "Dana Haitham Dajane", YEAR: 2023, GENREKIND: "Fiction");
  addBook(TitlEE: "killer in train", Autheer: "Agath krasti", YEAR: 1980);
  //كل اوامر الطباعة لاظهار النتائج  الفنكشنات
  print(getBookInfo(TitlEE: "Dart tutorials"));
  print(getBookInfo(TitlEE: "Unknown Book"));

  print("\nAll Books:");
  listAllBooks();

  print("\nProgramming Books:");
  print(listBooksByGENREKIND(GENREKIND: "Programming"));

  print("\nRemoving 'Dart tutorials':");
  print(removeBook(TitlEE: "Dart tutorials"));

  print("\nAfter Removal:");
  listAllBooks();
}
