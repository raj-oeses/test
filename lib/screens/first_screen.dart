import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upwork/controller/first_controller.dart';

var flag = 0;

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomSheetScreen(),
    );
  }
}

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = Get.find<BottomSheetPageController>();
    return Container(
      height: Get.height,
      width: Get.width,
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: () {
          pageController.pageController.value = 0;
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Obx(
                () => pageController.pageController.value == 0
                    ? Container(
                        height: Get.height,
                        color: Colors.amber,
                        child: Row(
                          children: [
                            Button(
                                title: 'Fish',
                                onPressed: () {
                                  pageController.pageController.value = 1;
                                  ++flag;
                                }),
                            Button(
                                title: 'Food',
                                onPressed: () {
                                  pageController.pageController.value = 2;
                                  ++flag;
                                }),
                            Button(
                                title: 'Rice',
                                onPressed: () {
                                  pageController.pageController.value = 3;
                                  ++flag;
                                }),
                          ],
                        ),
                      )
                    : pageController.pageController.value == 1
                        ? const ListViewPage(title: 'Fish')
                        : pageController.pageController.value == 2
                            ? const ListViewPage(title: 'Food')
                            : const ListViewPage(title: 'Rice'),
              );
            },
          );
        },
        child: const Text(
          'Bottom Sheet',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  final String title;

  const ListViewPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, index) => ListTiles(title: title, count: index));
  }
}

class ListTiles extends StatelessWidget {
  final int count;
  final String title;

  const ListTiles({Key? key, required this.count, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$title ${count + 1}');
  }
}

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const Button({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
