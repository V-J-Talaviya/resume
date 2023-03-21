import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  List<TextEditingController> item = [];
  final formKey = GlobalKey<FormState>();
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    item.add(TextEditingController());
    item.add(TextEditingController());
    item.add(TextEditingController());

  }

  void reorderData(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = item.removeAt(oldIndex);
    item.insert(newIndex, items);
    update();
  }

  void addTextFiled() {
    item.add(TextEditingController());
    update();
  }

  void removeTextFiled(TextEditingController items) {
    item.remove(items);
    update();
  }

  void changeIndex(int oldIndex, int newIndex) {
    print("oldIndex");
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }
    final element = item.removeAt(oldIndex);
    item.insert(newIndex, element);
    print('item ${item}');
    update();
  }

}