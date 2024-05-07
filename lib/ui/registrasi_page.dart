import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget{

  @override
  _RegistrasiPageState createState() =>_RegistrasiPageState();

}

class _RegistrasiPageState extends State<RegistrasiPage>{
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _namaTextField(),
                _emailTextField(),
                _passwordTextField(),
                _passwordKonfirmasiTextField(),
                _buttonRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Nama'),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if(value!.length < 3) {
          return 'Nama harus lebih dari 3 karakter';
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.text,
      controller: _emailTextboxController,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Email harus diisi';
        }

        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0 -9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


        return null;
      },
    );
  }
}