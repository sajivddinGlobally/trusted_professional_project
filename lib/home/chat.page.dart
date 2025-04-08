import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void onSend() {
    setState(() {
      messages.add({
        'text': _controller.text.trim(),
        'time': TimeOfDay.now().format(context),
        'isMe': true,
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 251, 252),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: Color.fromARGB(255, 252, 251, 252),
                      border: Border.all(
                        width: 0.89,
                        color: Color.fromARGB(25, 0, 0, 0),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                          color: Color.fromARGB(255, 30, 30, 30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                Text(
                  "Robert Johnson",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 38, 38, 38),
                    fontSize: 17.sp,
                  ),
                ),
                Spacer(),
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: Color.fromARGB(255, 252, 251, 252),
                    border: Border.all(
                      width: 0.89,
                      color: Color.fromARGB(25, 0, 0, 0),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.call_outlined,
                      size: 20.sp,
                      color: Color.fromARGB(255, 0, 97, 254),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(10.0),
                      children: [
                        ChatBubble(
                          isUserMessage: true,
                          message: "Hi, What is the exacat concern",
                        ),
                        ChatBubble(
                          isUserMessage: false,
                          message: "The bathroom top concern",
                        ),
                        ChatBubble(
                          isUserMessage: false,
                          message: "I am available Monday 5 PM",
                        ),
                        ChatBubble(isUserMessage: true, message: "Ok"),
                        ChatBubble(
                          isUserMessage: false,
                          message: "Charge 1200+GSt",
                        ),
                        SizedBox(height: 250.h),
                        SizedBox(
                          width: 200.w,
                          height: 55.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(200.w, 55.h),
                            ),
                            onPressed: () {},
                            child: Text("Book Now"),
                          ),
                        ),
                      ],
                    ),
                    if (messages.length < 10) ...[
                      SizedBox(height: MediaQuery.of(context).size.height / 2),
                    ],
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return ChatScreen(
                          text: message['text'],
                          isMe: message['isMe'],
                          time: message['time'],
                        );
                      },
                    ),
                    SizedBox(height: 300.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80.h,
        child: MessageInput(controller: _controller, onSend: onSend),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isUserMessage;
  final String message;

  ChatBubble({required this.isUserMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color:
              isUserMessage
                  ? Color.fromARGB(255, 0, 97, 254)
                  : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: isUserMessage ? Radius.circular(10) : Radius.zero,
            bottomRight: isUserMessage ? Radius.zero : Radius.circular(10),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String text;
  final bool isMe;
  final String time;
  const ChatScreen({
    super.key,
    required this.isMe,
    required this.time,
    required this.text,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment:
              widget.isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color:
                    widget.isMe
                        ? Color.fromARGB(255, 0, 97, 254)
                        : Colors.white,
                borderRadius:
                    widget.isMe
                        ? BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )
                        : BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                border: Border.all(width: 1),
              ),
              child: Column(
                crossAxisAlignment:
                    widget.isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color:
                          widget.isMe
                              ? Colors.white
                              : Color.fromARGB(255, 38, 50, 56),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.time,
                    style: TextStyle(
                      color: widget.isMe ? Colors.white70 : Colors.black54,
                      fontSize: 10,
                    ),
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

class MessageInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 245, 245, 245),
          hintText: "Send Messages",
          hintStyle: GoogleFonts.roboto(
            fontSize: 15.sp,
            color: Color.fromARGB(255, 128, 128, 128),
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(width: 1.w, color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(width: 1.w, color: Colors.grey.shade300),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              widget.onSend();
            },
            child: Container(
              child: Icon(Icons.send, color: Color.fromARGB(255, 0, 97, 254)),
            ),
          ),
        ),
      ),
    );
  }
}
