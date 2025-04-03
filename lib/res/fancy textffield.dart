import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class FancyTextField extends StatefulWidget {
  @override
  _FancyTextFieldState createState() => _FancyTextFieldState();
}

class _FancyTextFieldState extends State<FancyTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _emojiShowing = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _emojiShowing = false; // Hide emoji picker when keyboard is opened
        });
      }
    });
  }

  void _toggleEmojiPicker() {
    if (_emojiShowing) {
      setState(() {
        _emojiShowing = false;
      });

      Future.delayed(Duration(milliseconds: 100), () {
        _focusNode.requestFocus();
      });
    } else {
      _focusNode.unfocus();
      Future.delayed(Duration(milliseconds: 200), () {
        setState(() {
          _emojiShowing = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Hi my name is ....",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 15), // Adjust padding
              ),
            ),
            Positioned(
              bottom: 5, // Move to the bottom
              right: 10, // Align to the right
              child: GestureDetector(
                onTap: _toggleEmojiPicker,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.withOpacity(0.1), // Light background
                  ),
                  child: Icon(Icons.emoji_emotions, color: Colors.orange),
                ),
              ),
            ),
          ],
        ),

        // Emoji Picker
        if (_emojiShowing)
          EmojiPicker(
            onEmojiSelected: (category, emoji) {
              _controller.text += emoji.emoji;
            },
          ),
      ],
    );
  }
}
