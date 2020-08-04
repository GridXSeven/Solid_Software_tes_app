import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Brain>(
      create: (context) => Brain(),
      child: MaterialApp(
        home: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<Brain>(context).bgColor != null
          ? Provider.of<Brain>(context).bgColor
          : Colors.white,
      body: GestureDetector(
        onTap: () => Provider.of<Brain>(context, listen: false).onScreenTap(),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Provider.of<Brain>(
                            context,
                          ).danceCounter !=
                          -1 &&
                      Provider.of<Brain>(
                            context,
                          ).danceMan !=
                          null
                  ? Text(
                      Provider.of<Brain>(
                        context,
                      ).danceMan,
                      style: TextStyle(
                        color: Provider.of<Brain>(context).bgColor != null
                            ? Provider.of<Brain>(context).textColor
                            : Colors.black,
                        fontSize: 25.0,
                      ),
                    )
                  : null,
            ),
            Container(
              decoration: BoxDecoration(
                  image: Provider.of<Brain>(context).screenCrashed
                      ? DecorationImage(
                          image: AssetImage("assets/broken.png"),
                          fit: BoxFit.cover,
                        )
                      : null),
              width: double.maxFinite,
              height: double.maxFinite,
              child: Center(
                child: Text(
                  Provider.of<Brain>(context).centerText,
                  style: TextStyle(
                    color: Provider.of<Brain>(context).bgColor != null
                        ? Provider.of<Brain>(context).textColor
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
