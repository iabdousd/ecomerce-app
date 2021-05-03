import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rimlines/bloc/auth/auth_bloc.dart';
import 'package:rimlines/models/auth/auth_state.dart';
import 'package:rimlines/services/auth/login.dart';
import 'package:rimlines/views/main-views/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  AuthBloc _bloc;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    if (!_formKey.currentState.validate()) return;
    List<String> tokens =
        await signin(_usernameController.text, _passwordController.text);
    if (tokens != null) {
      _bloc.add(Authorized(
        jwtToken: tokens[0],
        refreshToken: tokens[1],
      ));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc = BlocProvider.of<AuthBloc>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 196.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    "login.title".tr(),
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                // Spacer(
                //   flex: 1,
                // ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: TextFormField(
                            validator: (v) {
                              if (v.isEmpty) {
                                return "login.username.errors.empty".tr();
                              } else if (v.length < 8) {
                                return "login.username.errors.minimum".tr();
                              } else if (double.parse(v, (e) => null) == null) {
                                return "login.username.errors.unformal".tr();
                              }
                              return null;
                            },
                            controller: _usernameController,
                            maxLength: 15,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "login.username.hint".tr(),
                              border: InputBorder.none,
                              labelText: "login.username.label".tr(),
                              counterText: '',
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: TextFormField(
                            validator: (v) {
                              if (v.isEmpty) {
                                return "login.password.errors.empty".tr();
                              } else if (v.length < 8) {
                                return "login.password.errors.minimum".tr();
                              }
                              // else if (double.parse(v, (e) => null) == null) {
                              //   return "login.password.errors.unformal".tr();
                              // }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: true,
                            maxLength: 15,
                            decoration: InputDecoration(
                              hintText: "login.password.hint".tr(),
                              border: InputBorder.none,
                              labelText: "login.password.label".tr(),
                              counterText: '',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                            child: RaisedButton(
                              onPressed: login,
                              child: Text(
                                "login.submit".tr(),
                                style:
                                    Theme.of(context).textTheme.button.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
