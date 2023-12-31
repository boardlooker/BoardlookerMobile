import 'package:boardlooker_mobile/blocs/index.dart';
import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:boardlooker_mobile/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatefulWidget{

  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();

}

class RegistrationScreenState extends State<RegistrationScreen>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _dateBirthEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  bool _passwordVisible = false;

  _togglePasswordVisability() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (authContext, authState) {
        return Scaffold(
          appBar: MediaQuery.of(context).viewInsets.bottom > 0
              ? null
              : AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            leading:  IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).push(Routes.root.name);
              },
            ),
          ),
          body:  Container(
              alignment: AlignmentDirectional.topCenter,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Регистрация',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 19),
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _loginEditingController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    letterSpacing: -0.5
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 10.0
                                ),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.primary,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                hintText: 'Введите логин',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0
                            ),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _passwordEditingController,
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: _togglePasswordVisability,
                                    icon: Icon(!_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                      size: 17.0,
                                    )
                                ),
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    letterSpacing: -0.5
                                ),
                                contentPadding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 10.0
                                ),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.primary,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                hintText: 'Введите пароль',
                              ),
                              // validator: (String? value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "Введите email";
                              //   }
                              //   if (!validEmailReg.hasMatch(value)) {
                              //     return "Неверный формат";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0
                            ),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _nameEditingController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    letterSpacing: -0.5
                                ),
                                contentPadding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 10.0
                                ),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.primary,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                hintText: 'Введите имя',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0
                            ),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _dateBirthEditingController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    letterSpacing: -0.5
                                ),
                                contentPadding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 10.0
                                ),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.primary,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                hintText: 'Введите дату рождения',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 11),
                    PrimaryButton(
                      onPress: () {
                        authContext.read<AuthBloc>().add(AuthSignUpRequestedEvent(
                          username: _loginEditingController.text,
                          password: _passwordEditingController.text,
                          fullName: _nameEditingController.text,
                          birthdate: _dateBirthEditingController.text,
                        ));
                        },
                      label: "Зарегистрироваться",
                    ),
                  ],
                ),
              )),
        );
      }
    );
  }
}