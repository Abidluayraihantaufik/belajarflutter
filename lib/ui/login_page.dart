import 'package:belajarflutter/bloc/login_bloc.dart';
import 'package:belajarflutter/helpers/user_info.dart';
import 'package:belajarflutter/widget/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:belajarflutter/ui/registrasi_page.dart';
import 'package:belajarflutter/ui/products_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _emailTextField(),
                _passwordTextField(),
                _buttonLogin(),
                const SizedBox(
                  height: 30,
                ),
                _menuRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Password harus diisi';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Password harus diisi';
        }
        return null;
      },
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if(validate) {
            if(!_isLoading) _submit();
          }
        },
        child: const Text('Login')
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
      email: _emailTextboxController.text,
      password: _passwordTextboxController.text
    ).then((value) async {
      await UserInfo().setToken(value.token.toString());
      await UserInfo().setUserId(int.parse(value.userID.toString()));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProductsPage())
      );
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
            description: "Login gagal, silahkan coba lagi",
          )
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          'Registrasi',
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegistrasiPage())
          );
        },
      ),
    );
  }
}