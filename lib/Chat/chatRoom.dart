import 'package:flutter/material.dart';
import 'package:mango_test/Chat/calendar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('민주'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Calendar()));
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Material(
                elevation: 1.0,
                child: ExpansionTile(
                  title: Text('거래 중 항목'),
                  children: ListTile.divideTiles(context: context, tiles: [
                    _buildExpansionTile(),
                    _buildExpansionTile(),
                  ]).toList(),
                )),
            Flexible(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        '2021년 02월 18일',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Color(0xFFBFBFBF)),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ ', '오후 4:30'),
                _buildTextMSG(true, '정현', '싫은데요 ', '오후 4:31'),
                _buildTextMSG(true, '정현', '뭐 맛있는거 해먹을라고 ?-?', '오후 4:31'),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ ', '오후 4:35'),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ ', '오후 4:35'),
                _buildTextMSG(false, '민주', '오이 좀 나눠 주세요..ㅎㅎ ', '오후 4:36'),
                _buildTextMSG(true, '정현', '싫은데요 ', '오후 4:40'),
                _buildTextMSG(true, '정현', '싫은데요 ', '오후 4:41'),
                _buildTextMSG(true, '정현',
                    '싫어싫어싫어싫어싫어싫어싫어싫어싫\n어싫어싫어싫어싫어싫어싫다고!! ', '오후 4:45'),
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

  Widget _buildExpansionTile() {
    return ListTile(
      title: Text(
        '김민주님께서 ‘레몬 2개’에 대한 채팅을 요청하였습니다. 거래가 완료되면 버튼을 클릭해주세요.',
        style: Theme.of(context)
            .textTheme
            .overline
            .copyWith(color: Color(0xFF929292)),
      ),
      trailing: FlatButton(
        onPressed: () {},
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              '거래완료',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Theme.of(context).accentColor),
            )),
      ),
    );
  }

  Widget _buildTextMSG(bool me, String sender, String text, String time) {
    return Material(
      // animationDuration: ,
      child: Container(
        margin: me ? EdgeInsets.only(left: 10) : EdgeInsets.only(right: 10),
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            me
                                ? Text(
                                    time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        .copyWith(
                                            color: Color(0xFF666666)
                                                .withOpacity(0.6)),
                                  )
                                : SizedBox(),
                            Container(
                              margin: me
                                  ? EdgeInsets.only(left: 10)
                                  : EdgeInsets.only(right: 10),
                              child: Material(
                                color: me
                                    ? Theme.of(context).accentColor
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.0),
                                elevation: 1.0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  child: Text(text),
                                ),
                              ),
                            ),
                            !me
                                ? Text(
                                    '오후 4:31',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        .copyWith(
                                            color: Color(0xFF666666)
                                                .withOpacity(0.6)),
                                  )
                                : SizedBox(),
                          ]),
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
      ),
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
