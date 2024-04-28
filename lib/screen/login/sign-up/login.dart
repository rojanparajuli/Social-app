import 'package:chatapp/screen/drawer/drawer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Date Set Go'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/new logo.png'),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter your details'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Date of Birth',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 30)),
                          onPressed: () {
                            // Do something with the user input
                            Navigator.of(context).pop();
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter phone number and password'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Phone number',
                            ),
                          ),
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                          TextButton(
                            child: const Text("Forget Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Reset Password'),
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Phone number',
                                          ),
                                        ),
                                        TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            labelText: 'New Password',
                                          ),
                                        ),
                                        TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            labelText: 'conform Password',
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Do something to reset the password
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()));
                                  },
                                  child: const Text('Submit')),
                              TextButton(
                                  onPressed: () {
                                     Navigator.of(context).pop();
                                  }, child: const Text('Cancel')),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
