import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:revision/multi_screens.dart';

void main(){
  runApp(Login());
}
class Login extends StatefulWidget {

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var isPasswordVisible =false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: Scaffold(
            
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    border: OutlineInputBorder()),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isPasswordVisible,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(onPressed: () { setState(() {
                                      isPasswordVisible=!isPasswordVisible;
                                    });}, icon: Icon(isPasswordVisible?Icons.visibility_off : Icons.visibility),

                                    ),
                                    border: OutlineInputBorder()),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: double.infinity,
                        child: MaterialButton(
                            color: Colors.blue,
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            onPressed: () {
                              if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty){
                                print("asdas");
                            Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                      builder: (_){
                                        Map<String,String> map= {};
                                        map["Email"] = emailController.text;
                                        map["Password"] = passwordController.text;
                                        return ResultPage(data: map);
                                      }
                                  )
                                  );
                              }else{
                                setState(() {
                                  passwordController.text="";
                                  emailController.text="";
                                });
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
class ResultPage extends StatefulWidget {
  Map<String,String> data;
  ResultPage({Key? key , required this.data}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultState(data: data);
}

class _ResultState extends State<ResultPage> {
  Map<String,String> data;

  _ResultState({ required this.data});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text("${data["Email"]}"),
                Text("${data["Password"]}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

