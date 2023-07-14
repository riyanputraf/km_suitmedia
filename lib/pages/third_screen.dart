import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/data/api/api_service.dart';
import 'package:suitmedia/provider/user_provider.dart';
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
      body: ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(apiService: ApiService()),
        child: Consumer<UserProvider>(builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return RefreshIndicator(
              onRefresh: () => state.refreshData(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.data.length,
                itemBuilder: (context, index) {
                  var user = state.result.data[index];
                  return Column(
                    children: [
                      CardUser(
                        userData: user,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Divider(),
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        }),
      ),
    ));
  }
}
