import 'package:flutter/material.dart';

String _name = 'Your Name';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  bool _isComposing = false;
  final FocusNode _focusNode = FocusNode();

  bool me = true;

  @override
  Widget build(BuildContext context) {
    me = false;
    // me = true;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text('민주'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView(
              children: [
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ '),
                _buildTextMSG(true, '정현', '싫은데요 '),
                _buildTextMSG(true, '정현', '뭐 맛있는거 해먹을라고 ?-?'),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ '),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ '),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ '),
                _buildTextMSG(true, '정현', '싫은데요 '),
                _buildTextMSG(true, '정현', '싫은데요 '),
                _buildTextMSG(true, '정현', '싫어싫어싫어싫어싫어싫어싫어싫어싫\n어싫어싫어싫어싫어싫어싫다고!! '),
              ],
            )),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 3000),
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _isComposing ? _handleSubmitted : null,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  color: _isComposing
                      ? Theme.of(context).accentColor
                      : Colors.grey,
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTextMSG(bool me, String sender, String text) {
    return Material(
      child: Row(
          mainAxisAlignment:
              me ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            !me
                ? CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('images/users/photo_mj.jpeg'),
                    backgroundColor: Colors.white60,
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment:
                      me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(sender),
                    Container(
                      margin: me
                          ? EdgeInsets.only(left: 30)
                          : EdgeInsets.only(right: 30),
                      child: Material(
                        color: me
                            ? Theme.of(context).accentColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 6.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(text),
                        ),
                      ),
                    ),
                  ]),
            ),
            me
                ? CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('images/users/photo_jh.jpeg'),
                    backgroundColor: Colors.white60,
                  )
                : SizedBox(),
          ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.headline4),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
