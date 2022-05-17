import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialBinding: _HomePageBinding(),
      home: const HomePage(),
    );
  }
}

class _HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<_HomePageController>(() => _HomePageController());
  }
}

class _HomePageController extends GetxController {
  final list = RxList<int>();
  int index = 0;

  void addList() => list.add(++index);
}

class HomePage extends GetView<_HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Increment"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => ListView.separated(
              itemCount: controller.list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, final int index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text("${controller.list[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: const Icon(Icons.add),
          onPressed: controller.addList,
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
