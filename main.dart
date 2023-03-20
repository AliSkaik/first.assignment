import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(
          child: Text(
            'Main Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.person_sharp,
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  )),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginpage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgot()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Successful Registered',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Confirmation',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => confirm()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Change Password',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => change()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class loginpage extends StatelessWidget {
  loginpage({super.key});

  final userContorller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String _fname;
  late String _lname;
  late String _username;
  late String _email;
  late String _password;
  late String _confirmpassword;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool isValidEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(
          child: Text(
            'Login Page     ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Enter Your information ',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              Center(
                child: Text(
                  'then press Login.',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!isValidEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.tealAccent),
                      ),
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: 'Password'),
                  obscureText: true,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => forgot()));
                    },
                    child: Text(
                      'Forgot password                                                                 ',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              new SizedBox(
                width: 170.0,
                height: 100.0,
                child: ElevatedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      }
                      ;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  new SizedBox(
                    width: 170.0,
                    height: 100.0,
                    child: ElevatedButton(
                        child: Text(
                          'Change Passwrod',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => change()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign Up page    ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Provide your information ',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                'then press Sign Up.',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: 'E-mail',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: 'Username',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'Password'),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              width: 170.0,
              height: 100.0,
              child: ElevatedButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Successfully Registered page     ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'You have been registered',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  'Successfully!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Icon(
                Icons.add_task_outlined,
                size: 100,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class forgot extends StatelessWidget {
  const forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Forgot Password page    ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Enter the E-mail that you',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              'signed up with then press ',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              'send.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                ),
                fillColor: Colors.grey.shade300,
                filled: true,
                hintText: 'E-mail',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          new SizedBox(
            width: 170.0,
            height: 100.0,
            child: ElevatedButton(
                child: Text(
                  'Send Code',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                )),
          ),
        ],
      )),
    );
  }
}

class change extends StatelessWidget {
  const change({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Change Password page   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.grey.shade800,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Enter the information',
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                'required below the press',
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                'Change.',
                style: TextStyle(fontSize: 30),
              )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'Your old password',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'New password',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'confirm password',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              new SizedBox(
                width: 170.0,
                height: 100.0,
                child: ElevatedButton(
                    child: Text(
                      'change',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => confirm()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                    )),
              ),
            ],
          ),
        ));
  }
}

class confirm extends StatelessWidget {
  const confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Confirmation page   ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Enter the code that have',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                'been sent to you then press',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                'confirm.',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  ),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintText: 'Enter Code',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              width: 170.0,
              height: 100.0,
              child: ElevatedButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
