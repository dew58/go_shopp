import 'package:flutter/material.dart';
import 'package:go_shop/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  IconData passwordIcon = Icons.visibility_off_rounded;

  SharedPreferences? pref ;

  bool logged= false ;

  SharedPreferences? pref2 ;

  String email ="";

  setdata (bool log)async{
    pref= await SharedPreferences.getInstance();
    pref!.setBool("login", log);
  }

  setemail(String ema)async{
    pref2= await SharedPreferences.getInstance();
    pref2!.setString("email", ema);

  }
  getdata()async{
    pref= await SharedPreferences.getInstance();
    pref2= await SharedPreferences.getInstance();

    setState(() {
      logged =pref!.getBool("login")?? false;
      email=pref2!.getString("email")?? "";
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getdata();

    return Scaffold(
      backgroundColor: Color(0xFF432267),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/image/Group-2.png'),
                      height: MediaQuery.of(context).size.height/2.5,
                    ),
                  ),
                  defaultTextFiled(
                    controlller: emailController,
                    lable: 'E-mail',
                    validate: (String? value){
                      if(value!.isEmpty||!value.contains('@') || !value.contains('.')){
                        return 'Enter correct Email';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  defaultTextFiled(
                    controlller: passwordController,
                    isPassword: !isPassword,
                    suffix: passwordIcon,
                    lable: 'Password',
                    onPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                        if(isPassword){
                          passwordIcon = Icons.visibility_rounded;
                        }
                        else{
                          passwordIcon = Icons.visibility_off_rounded;
                        }
                      });
                    },
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'password must not be empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextButton(
                    onPressed: (){},
                    text: 'Forget Password?',
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 90.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextButton(
                        onPressed: (){
                          if (!formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Enter Data')),
                            );
                          }else{
                            setState(() {
                              logged =true;
                              setdata(logged);
                              setemail(emailController.text);
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MainHome()),
                            );
                          }
                        },
                        text: 'Log in',
                        fontWeight: FontWeight.bold,
                        textColor: Color(0xFFE99000),
                        fontSize: 20.0,
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Container(
                        width: 3.0,
                        height: 20.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      defaultTextButton(
                        onPressed: (){},
                        text: 'Register',
                        fontWeight: FontWeight.bold,
                        textColor: Color(0xFFFEFEFE),
                        fontSize: 20.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// #432267 #E99000 #FEFEFE #E9BC6B #9F94AB