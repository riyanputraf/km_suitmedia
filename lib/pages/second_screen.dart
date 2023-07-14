import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
          style: TextStyle(color: Colors.black),
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
      // body: ListView(
      //   children: [
      //     Container(
      //       height: 500,
      //       child: Column(
      //         children: [
      //           Expanded(
      //             child: Align(
      //               alignment: Alignment.bottomCenter,
      //               child: ElevatedButton(
      //                 onPressed: (){},
      //                 child: Text('h'),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 13,
                ),
                Text('Welcome'),
                SizedBox(
                  height: 2,
                ),
                Text('John Does'),
                SizedBox(
                  height: 222,
                ),
                Center(
                  child: Text('Selected User Name'),
                ),
                // SizedBox(height: 315,),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Container(
                        width: 310,
                        height: 41,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 7,
                              primary: Color(0xff2B637B),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          child: Text('Next'),
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