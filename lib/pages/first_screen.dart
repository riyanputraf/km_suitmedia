import 'package:flutter/material.dart';
import 'package:suitmedia/pages/second_screen.dart';
import 'package:suitmedia/theme.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  String? _palindromeText;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
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
                SizedBox(
                  height: 186,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/ic_photo.png',
                    width: 116,
                    height: 116,
                  ),
                ),
                SizedBox(
                  height: 51,
                ),
                Center(
                  child: Container(
                    height: 47,
                    width: 310,
                    child: TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 47,
                    width: 310,
                    child: TextField(
                      controller: _palindromeController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: 'Palindrome',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  width: 310,
                  height: 41,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7,
                        primary: blueBtn,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      _palindromeText = _palindromeController.text;
                      print(_palindromeText);
                    },
                    child: Text('Check', style: medium,),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 310,
                  height: 41,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7,
                        primary: blueBtn,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    },
                    child: Text('Next', style: medium,),
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
