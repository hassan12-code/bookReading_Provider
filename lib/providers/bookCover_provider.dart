import 'package:flutter/cupertino.dart';

class BookCoverClass with ChangeNotifier{
  bool isShowingDetails = false;
  bool isShowingCover = true;
  
  void onShowingDetails()
  {
      if (isShowingDetails == false) {
         isShowingDetails = true;
         isShowingCover = false;
         print("Text == 122");
        }
        else {
          isShowingDetails = false;
          isShowingCover = true;
          print("Text == 144");
      }
      notifyListeners();
  }


}