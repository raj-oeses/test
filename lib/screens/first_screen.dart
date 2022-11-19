import 'package:flutter/material.dart';

var page = 0;

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomSheetScreen(),
    );
  }
}

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: () {
          page = 0;
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) => page == 0
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.amber,
                          child: Row(
                            children: [
                              Button(
                                  title: 'Fish',
                                  onPressed: () {
                                    page = 1;
                                    setState(() {});
                                    debugPrint('page $page');
                                  }),
                              Button(
                                  title: 'Food',
                                  onPressed: () {
                                    setState(() {});
                                    page = 2;
                                    debugPrint('page $page');
                                  }),
                              Button(
                                  title: 'Rice',
                                  onPressed: () {
                                    page = 3;
                                    setState(() {});
                                    debugPrint('page $page');
                                  }),
                            ],
                          ),
                        )
                      : page == 1
                          ? const ListViewPage(title: 'Fish')
                          : page == 2
                              ? const ListViewPage(title: 'Food')
                              : const ListViewPage(title: 'Rice'));
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
