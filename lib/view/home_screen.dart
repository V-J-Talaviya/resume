import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_app/view/result_screen.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resume App',
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Expanded(
                  child: ReorderableListView.builder(
                      itemCount: controller.item.length,
                      itemBuilder: (context, index) {
                        // final String productName = controller.item[index];
                        return Container(
                          color: Colors.transparent,
                          key: ValueKey('$index'),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: index < 3 ? TextFormField(
                              controller: controller.item[index],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter value';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: index == 0 ? "Name" : index == 1 ? "Email" : "Experience",
                              ),
                            ) :  Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    key: ValueKey(controller.item[index].text),
                                    controller: controller.item[index],
                                    decoration: InputDecoration(
                                      hintText: "Add Item ${index - 2}",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter value';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    controller.removeTextFiled(controller.item[index]);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      // The reorder function
                      onReorder: (oldIndex, newIndex) {
                         controller.changeIndex(oldIndex, newIndex);
                      }),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    if (controller.formKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Get.to(ResultScreen(controller.item));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please Fill up the Form')),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Generate",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          );
        }
      ),
      floatingActionButton: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return FloatingActionButton(
            onPressed: (){
              controller.addTextFiled();
            },
            child: const Icon(
              Icons.add,
            ),
          );
        }
      ),
    );
  }
}
