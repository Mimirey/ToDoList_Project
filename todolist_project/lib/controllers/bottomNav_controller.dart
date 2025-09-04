import 'package:get/get.dart';

class BottomnavController extends GetxController{
  var currenttIndex=0.obs;

  void changePage(int index){
    currenttIndex.value=index;
  }
}