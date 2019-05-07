import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  void _onTap() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Animações"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _onTap,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: (isLoading)
                      ? BorderRadius.circular(25)
                      : BorderRadius.circular(15)),
              alignment: Alignment.center,
              width: (isLoading) ? 50 : 200,
              height: 50,
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                crossFadeState: (isLoading) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                secondChild: Center(
                  child: Text(
                      "Button",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )),
                )
              ) 
        ),
      ),
    );
  }
}
