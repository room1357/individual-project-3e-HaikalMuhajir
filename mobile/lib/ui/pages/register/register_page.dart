import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register_viewmodel.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final usernameCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final confirmPasswordCtrl = TextEditingController();

    return Consumer<RegisterViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(title: Text('Register'), backgroundColor: Colors.blue),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person_add, size: 50, color: Colors.white),
                ),
                SizedBox(height: 32),
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: usernameCtrl,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: confirmPasswordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        vm.isLoading
                            ? null
                            : () async {
                              final user = await vm.register(
                                name: nameCtrl.text,
                                email: emailCtrl.text,
                                username: usernameCtrl.text,
                                password: passwordCtrl.text,
                                confirmPassword: confirmPasswordCtrl.text,
                              );
                              if (!context.mounted) return;
                              if (user != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Register berhasil")),
                                );
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/login',
                                );
                              } else if (vm.error != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(vm.error!)),
                                );
                              }
                            },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child:
                        vm.isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                              'REGISTER',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                ),
                SizedBox(height: 16),
                if (vm.error != null)
                  Text(vm.error!, style: TextStyle(color: Colors.red)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
