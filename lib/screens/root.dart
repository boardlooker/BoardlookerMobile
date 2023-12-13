import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:boardlooker_mobile/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
              alignment: AlignmentDirectional.topCenter,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Добро пожаловать!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  ),
                  const SizedBox(height: 19),
                  PrimaryButton(
                    onPress: () {
                      GoRouter.of(context).push(Routes.login.name);
                    },
                    label: "Войти",
                  ),
                  const SizedBox(height: 11),
                  PrimaryButton(
                    onPress: () {
                      GoRouter.of(context).push(Routes.registration.name);
                    },
                    label: "Зарегистрироваться",
                  ),
                ],
              )),
    );
  }
}
