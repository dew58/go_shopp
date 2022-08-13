import 'package:flutter/material.dart';
import 'package:store/home_page.dart';
import 'database.dart';

class app_1 extends StatefulWidget {
  const app_1({Key? key}) : super(key: key);

  @override
  _app_1State createState() => _app_1State();
}

class _app_1State extends State<app_1>  {

  bool _passwordVisible = false;
  final _textController = TextEditingController();
  bool _isloged =false;

  void addtodb(){
    Users().insert(_textController.text);
    setState(() {
      _isloged = true;
    });
  }

  @override
  void initState() {
    Users().creatdb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/download.png'),
            radius: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _textController,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 20),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    },
                    );
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 130, // <-- match_parent
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    addtodb();
                    _isloged = true;
                    if (_isloged){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const home_page()),
                      );
                    }
                  });

                },
                child: Text('Log in', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Colors.lightBlueAccent),
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Forget password?", style: TextStyle(fontSize: 15,
                  color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?", style: TextStyle(fontSize: 15,
                      color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  ),
                  TextButton( // <-- TextButton
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const signup()),
                      // );
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),

            ],
          ),
        ],

      ),
    );
  }

}
