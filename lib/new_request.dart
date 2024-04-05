import 'package:factory_api/features/api_bloc/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class NewRequest extends StatefulWidget {
  const NewRequest({super.key});

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  final ApiBloc apiBloc = ApiBloc();

  final _formKey = GlobalKey<FormState>();

  String _enteredLogin = '';
  String _enteredPassword = '';

  void performAuth() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      apiBloc.add(AuthRequestEvent());

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredLogin = value!;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLength: 15,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 15) {
                    return 'Must be between 1 and 15 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredPassword = value!;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: performAuth, child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
