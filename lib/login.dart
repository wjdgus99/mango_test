import 'app.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 10,
          ),
          Image(
            image: AssetImage('images/defaultImage.jpg'),
            height: 140,
            fit: BoxFit.contain,
          ),
          Spacer(
            flex: 13,
          ),
          ButtonTheme(
            minWidth: 300,
            height: 70,
            buttonColor: Colors.white,
            child: OutlineButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () => Navigator.pushNamed(context, HOME),
              icon: Icon(
                Icons.account_box,
                size: 24,
              ),
              label: Text(
                'Google로 시작하기',
                style: TextStyle(
                    color: Color.fromRGBO(53, 53, 53, 1), fontSize: 16),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          //same as above button.
          ButtonTheme(
            minWidth: 300,
            height: 70,
            child: OutlineButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: null,
              icon: Icon(Icons.account_box),
              label: Text('Kakao로 시작하기'),
            ),
          ),
          Spacer(
            flex: 9,
          )
        ],
      ),
    ));
  }
}
