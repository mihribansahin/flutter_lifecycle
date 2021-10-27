import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    debugPrint("in init state second page");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      debugPrint(" AppLifecycleState = PAUSED (second page)");
      // went to Background
    }
    if (state == AppLifecycleState.resumed) {
      debugPrint(" AppLifecycleState = RESUMED (second page)");
      // came back to Foreground
    }
    if (state == AppLifecycleState.inactive) {
      debugPrint(" AppLifecycleState = INACTIVE (second page)");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("in didChangeDependencies at second page");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("in build at second page");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Text("SECOND PAGE", style: TextStyle(fontSize: 30)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("< Back"),
                onPressed: () {
                  Navigator.of(context).pop();
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
    super.deactivate();
    debugPrint("in deactivate at second page");
  }

  @override
  void dispose() {
    // then run pushReplecment
    super.dispose();
    debugPrint("in dispose at second page");
    WidgetsBinding.instance!.removeObserver(this);
  }
}
