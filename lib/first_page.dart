import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with WidgetsBindingObserver {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    debugPrint("in init state at first page");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("in didChangeDependencies at first page");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("state at first page = $state");
    if (state == AppLifecycleState.paused) {
      debugPrint(" AppLifecycleState = PAUSED (first page)");
    }
    if (state == AppLifecycleState.resumed) {
      debugPrint(" AppLifecycleState = RESUMED (first page)");
    }
    if (state == AppLifecycleState.inactive) {
      debugPrint(" AppLifecycleState = INACTIVE (first page)");
    }
  }

  counter() {
    _counter++;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("in build at firtPage");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: counter,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "FIRST PAGE :')",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Text(
                    "$_counter",
                    style: TextStyle(fontSize: 30),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("New Page >"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    //then run pushReplecment
// TODO: implement deactivate
    super.deactivate();
    debugPrint("in deactivate at first page");
  }

  @override
  void dispose() {
    // push replecment ile sayfa değiştirdiğimizde stack'dan silindiği için bu method çalışır

    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    debugPrint("in dispose at first page");
  }
}
