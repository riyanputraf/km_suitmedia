import 'package:flutter/material.dart';
import 'package:suitmedia/theme.dart';
import 'package:suitmedia/widget/card_user.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/Stroke.png',
            width: 48,
            height: 48,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Third Screen',
          style: semiBoldSubTitle,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          // Atur tinggi sesuai dengan lebar garis yang diinginkan
          child: Divider(
            color: Colors.black, // Atur warna garis sesuai dengan kebutuhan
            thickness: 0.1, // Atur ketebalan garis sesuai dengan kebutuhan
          ),
        ),
      ),
      body: CardUser(),
    ));
  }
}
