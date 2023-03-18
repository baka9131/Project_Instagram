import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_page/kakao_login/kakao_login.dart';
import '../login_page/kakao_login/main_view_model.dart';

final viewModel = MainViewModel(KakaoLogin());

class FrontScreen extends StatelessWidget {
  FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                FirebaseAuth.instance.signOut();
                print('logout');
              } catch (e) {
                print(e.toString());
              }
            },
            child: const Text('로그아웃'),
          ),
          ElevatedButton(
            onPressed: () async {
              await viewModel.logout();
              if (!viewModel.isLogined) {
                Navigator.of(context).pop();
                snackBarMessenger(context, '정상적으로 카카오톡에서 로그아웃 되었습니다.');
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

void snackBarMessenger(context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: '확인',
        onPressed: () {},
      ),
    ),
  );
}