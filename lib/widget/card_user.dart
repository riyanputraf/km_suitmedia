import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/data/models/user_model.dart';
import 'package:suitmedia/provider/select_user_provider.dart';
import 'package:suitmedia/utils/theme.dart';

class CardUser extends StatelessWidget {
  final UserData userData;

  const CardUser({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: blueBtn,
      onTap: () {
        String selectedUsername = '${userData.firstName}${userData.lastName}';
        Provider.of<SelectUserProvider>(context, listen: false)
            .setSelectedUser(selectedUsername);

        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text('You select ${selectedUsername}. Please check in Second Screen'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 18),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.network(
                    userData.avatar,
                    width: 49,
                    height: 49,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userData.firstName} ${userData.lastName}',
                      style: mediumTitle,
                    ),
                    Text(
                      userData.email,
                      style: subTitleGrey,
                    ),
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
