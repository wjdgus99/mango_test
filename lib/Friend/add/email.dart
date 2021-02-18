import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  String dropdownValue = '직접 입력';

  TextEditingController _myController = TextEditingController();

  bool _isComposing = false;

  void _deleteInput() {
    _myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text('이메일로 추가'),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                '확인',
                style: Theme.of(context).textTheme.button,
              )),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 40),
        Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                controller: _myController,
                decoration: InputDecoration(
                  // helperText: '- 없이 숫자만 입력해 주세요.',
                  isCollapsed: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 4.0),
                    child: Text(
                      '이메일',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Color(0xFF666666).withOpacity(0.6)),
                    ),
                  ),
                  suffixIcon: _isComposing
                      ? IconButton(
                    onPressed: (){
                      _deleteInput();
                    },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                            size: 13,
                          ),
                        )
                      : Icon(
                          Icons.cancel_outlined,
                          color: Colors.black.withOpacity(0),
                        ),
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['직접 입력', '@naver.com', '@kakao.com']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Text('-없이 숫자만 입력해 주세요.'),
        )
      ]),
    );
  }
}
