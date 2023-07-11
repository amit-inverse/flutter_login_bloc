import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            padding: const EdgeInsets.only(bottom: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error as String?,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: snapshot.error as String?,
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: const Text('Login'),
        );
      },
    );
  }
}
