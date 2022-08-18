import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components.dart';
import 'home.dart';
import 'login_screen.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailController = TextEditingController();

  var citycontroller = TextEditingController();
  var streetcontroller = TextEditingController();

  var phonecontroller = TextEditingController();
  var passwoord2controller = TextEditingController();
  var passwordController = TextEditingController();

  bool isPassword = false;

  bool isPassword2 = false;

  bool logged =false;

  IconData passwordIcon = Icons.visibility_off_rounded;



  SharedPreferences? pref ;

  //shared data

  setdatabool (bool log)async{
    pref= await SharedPreferences.getInstance();
    pref!.setBool("login", log);
  }

  setdata (String data, String key)async{
    pref= await SharedPreferences.getInstance();
    pref!.setString(key, data);
  }


  @override
  Widget build(BuildContext context) {
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
                      height: MediaQuery.of(context).size.height/3.5,
                    ),
                  ),
                  defaultTextFiled(
                    controlller: namecontroller,
                    lable: 'Name',
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'Enter your Name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
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
                    height: 10.0,
                  ),
                  defaultTextFiled(
                    controlller: citycontroller,
                    lable: 'City',
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Your city';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFiled(
                    controlller: streetcontroller,
                    lable: 'Street',
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Your street';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFiled(
                    controlller: phonecontroller,
                    lable: 'Phone Number',
                    validate: ( value){
                      if(value!.isEmpty){
                        return 'Enter your Phone';
                      }
                    },
                  ),

                  const SizedBox(
                    height: 20.0,
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
                    height: 20.0,
                  ),
                  defaultTextFiled(
                    controlller: passwoord2controller,
                    isPassword: !isPassword2,
                    suffix: passwordIcon,
                    lable: 'Confirm Password',
                    onPressed: (){
                      setState(() {
                        isPassword2 = !isPassword2;
                        if(isPassword2){
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
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextButton(
                        onPressed: (){

                          if (!formKey.currentState!.validate() && passwordController.text == passwoord2controller.text){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Enter Data')),
                            );
                          }else{
                            setState(() {
                              logged =true;
                              setdatabool(logged);
                              setdata(namecontroller.text, "name");
                              setdata(emailController.text, "email");
                              setdata(citycontroller.text, "city");
                              setdata(streetcontroller.text, "street");
                              setdata(phonecontroller.text, "phone");
                              setdata(passwordController.text, "password");
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MainHome()),
                            );
                          }
                        },
                        text: 'Sign up',
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
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginScreen()),
                          );
                        },
                        text: 'Log in',
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
