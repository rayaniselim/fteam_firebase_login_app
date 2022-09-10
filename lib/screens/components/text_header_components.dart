import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class TextHeaderComponents extends StatefulWidget {
  const TextHeaderComponents({super.key});

  @override
  State<TextHeaderComponents> createState() => _TextHeaderComponentsState();
}

class _TextHeaderComponentsState extends State<TextHeaderComponents> {
  var hand = Emoji('hand', '👋');
  var parser = EmojiParser();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 8,
        right: 24,
        bottom: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        ' 👋 Hello,',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Are you new here?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'if you have an account /',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        // pagina de criar conta
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
