import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Login());
}
class Login extends StatefulWidget {

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: LoginPage()
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var isPasswordVisible =false;

  void navigateToResultPage(Map<String,String> map){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_){
            return ResultPage(data: map);
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                                border: const OutlineInputBorder()),
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
                            Map<String,String> map= {};
                            map["Email"] = emailController.text;
                            map["Password"] = passwordController.text;
                            navigateToResultPage(map);
                            /*
                                 Map<String,String> map= {};
                                      map["Email"] = emailController.text;
                                      map["Password"] = passwordController.text;
                                 */
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
        home: ResultPageUI(data: data,)
    );
  }
}

class ResultPageUI extends StatefulWidget {
  Map<String,String> data;

  ResultPageUI({Key? key , required this.data}) : super(key: key);

  @override
  State<ResultPageUI> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Text("${widget.data["Email"]}"),
                Text("${widget.data["Password"]}"),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (_){
                          return Login();
                        }
                    ),
                  );
                }, child: const Text("Log Out"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}