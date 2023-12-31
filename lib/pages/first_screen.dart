import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:suitmedia/pages/second_screen.dart';
import 'package:suitmedia/utils/theme.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  late String _palindromeText;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  bool checkPalindrome(String text) {
    String cleanedText =
        text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    String reversedText =
        String.fromCharCodes(cleanedText.runes.toList().reversed);
    return cleanedText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background.png',
              width: 375,
              height: 812,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 186,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/ic_photo.png',
                    width: 116,
                    height: 116,
                  ),
                ),
                const SizedBox(
                  height: 51,
                ),
                Center(
                  child: SizedBox(
                    height: 47,
                    width: 310,
                    child: TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: 'Name',
                        hintStyle: hintStyle,
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: SizedBox(
                    height: 47,
                    width: 310,
                    child: TextField(
                      controller: _palindromeController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: 'Palindrome',
                        hintStyle: hintStyle,
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: 310,
                  height: 41,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7,
                        backgroundColor: blueBtn,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      _palindromeText = _palindromeController.text;

                      if (checkPalindrome(_palindromeText)) {
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "isPalindrome",
                          desc: "Your input isPalindrome",
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                              child: const Text(
                                "Ok",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ).show();
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "not palindrome",
                          desc: "Your input not palindrome",
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                              child: const Text(
                                "Ok",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ).show();
                      }
                    },
                    child: Text(
                      'CHECK',
                      style: medium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 310,
                  height: 41,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7,
                        backgroundColor: blueBtn,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      String name = _nameController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen(
                                  name: name,
                                )),
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: medium,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
