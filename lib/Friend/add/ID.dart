import 'package:flutter/material.dart';

class ID extends StatefulWidget {
  @override
  _IDState createState() => _IDState();
}

class _IDState extends State<ID> {
  bool _isComposing = false;
  TextEditingController _myController = TextEditingController();

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
        title: Text('아이디로 추가'),
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
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
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
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  'ID',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Color(0xFF666666).withOpacity(0.6)),
                ),
              ),
              suffixIcon: _isComposing
                  ? IconButton(
                      onPressed: () {
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
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xFFF9F8F6)),
            child: ListTile(
              title: Text(
                '내 아이디',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Color(0xFF666666).withOpacity(0.6)),
              ),
              trailing: Text('jhyun715',
                  style: Theme.of(context).textTheme.bodyText2),
            )),
      ]),
    );
  }
}
