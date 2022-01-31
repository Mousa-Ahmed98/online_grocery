import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:online_grocery/widgets/product_shop_widget.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

enum AuthMode { login, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Map<String, String> authData = {
    'email': '',
    'password': '',
  };

  AuthMode _authMode = AuthMode.login;

  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1)
    .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(body: buildLoginFun(context));
  }

  Center buildLoginFun(BuildContext context) {
   // Provider.of<AuthProvider>(context, listen: true).login('fricces05@gmail.com', 'galala');
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _animation,
              child: const Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Image(
                    image: AssetImage('assets/images/playstore.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          cursorColor: Colors.black,
                          validator: (value) {
                            if (!value.toString().trim().contains('@')) {
                              return 'Bad formatted e-mail';
                            }
                            return null;
                          },
                          onSaved: (email) => {
                            authData['email'] = email.toString().trim(),
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: TextFormField(
                          controller: _passController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          cursorColor: Colors.black,
                          validator: (value) {
                            if (value.toString().trim().length < 6) {
                              return 'Password must be longer than 5 characters';
                            }
                            if (_passController.text.trim() !=
                                value.toString().trim()) {
                              return "passwords doesn't match";
                            }
                            return null;
                          },
                          onSaved: (password) {
                            authData['password'] = password.toString().trim();
                          },
                        ),
                      ),
                    ),
                    _authMode == AuthMode.signup
                        ? FadeTransition(
                          opacity: _animation,
                          child: Container(
                              constraints: BoxConstraints(
                                minHeight: _authMode == AuthMode.signup ? 60 : 0,
                                maxHeight: _authMode == AuthMode.signup ? 120 : 0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[200]),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      labelStyle: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    cursorColor: Colors.black,
                                    validator: (value) {
                                      if (value.toString().trim().length < 6) {
                                        return 'Password must be longer than 5 characters';
                                      }
                                    },
                                    onSaved: (password) {
                                      authData['password'] =
                                          password.toString().trim();
                                    },
                                  ),
                                ),
                              ),
                            ),
                        )
                        : Container(),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text(
                            _authMode == AuthMode.login? 'LOGIN' : 'Signup',
                            style: const TextStyle(color: Colors.white),
                          ),
                          onPressed: () => submit(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _authMode = _authMode == AuthMode.signup
                                  ? AuthMode.login
                                  : AuthMode.signup;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  void submit(ctx) {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      print('email: ${authData['email']}');
      print('password: ${authData['password']}');
    }
    if(_authMode == AuthMode.login){
      Provider.of<AuthProvider>(ctx, listen: false)
          .login(authData['email']!, authData['password']!);
    }
    else{
      Provider.of<AuthProvider>(ctx, listen: false)
          .signUp(authData['email']!, authData['password']!);
    }
  }
}
