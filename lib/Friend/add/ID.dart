import 'package:flutter/material.dart';

class ID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _text = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
          Navigator.pop(context);
        },),
        title: Text('아이디로 추가'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: _text,
          decoration: InputDecoration(
            counterText: '${_text.text.length}/20',
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
    );
  }
}
