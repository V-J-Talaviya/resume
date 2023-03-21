import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  List<TextEditingController> item;
  ResultScreen(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Result Screen",
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detail(0,"Name",item[0].text,0),
                    const SizedBox(height: 10,),
                    detail(1,"Email",item[1].text,0),
                    const SizedBox(height: 10,),
                    detail(2,"Experience",item[2].text,0),
                    const SizedBox(height: 10,),
                    item.length > 3 ?
                       ListView.builder(
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: item.length - 3,
                         shrinkWrap: true,
                         itemBuilder: (context,index){
                           return detail(index,"Item",item[index+3].text,1);
                         },
                       )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  detail(int index, String heading, String text, int i){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          i == 0 ? heading : "$heading ${index+1}",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10,),

      ],
    );
  }

}
