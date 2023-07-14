import 'package:flutter/material.dart';
import 'package:suitmedia/theme.dart';

class CardUser extends StatelessWidget {
  const CardUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(38),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 49,
                    height: 49,
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('firstname lastname', style: mediumTitle,),
                    Text('email@email.com', style: subTitleGrey,),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
