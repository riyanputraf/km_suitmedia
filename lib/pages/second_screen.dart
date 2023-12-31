import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/pages/third_screen.dart';
import 'package:suitmedia/provider/select_user_provider.dart';
import 'package:suitmedia/utils/theme.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          ), // Ganti dengan path gambar ikon Anda
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Second Screen',
          style: semiBoldSubTitle,
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          // Atur tinggi sesuai dengan lebar garis yang diinginkan
          child: Divider(
            color: Colors.black, // Atur warna garis sesuai dengan kebutuhan
            thickness: 0.1, // Atur ketebalan garis sesuai dengan kebutuhan
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 13,
                ),
                Text(
                  'Welcome',
                  style: regular,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  widget.name == '' ? 'User' : widget.name,
                  style: semiBoldSubTitle,
                ),
                const SizedBox(
                  height: 222,
                ),
                Consumer<SelectUserProvider>(builder: (context, state, _) {
                  var selectedUsername =
                      Provider.of<SelectUserProvider>(context).getSelected;
                  return Center(
                      child: Text(
                    selectedUsername == ''
                        ? 'Selected User Name'
                        : selectedUsername,
                    style: semiBoldTitle,
                  ));
                }),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: SizedBox(
                        width: 310,
                        height: 41,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 7,
                              backgroundColor: const Color(0xff2B637B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ThirdScreen()),
                            );
                          },
                          child: Text(
                            'Chose a User',
                            style: medium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
