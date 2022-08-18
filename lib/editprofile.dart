import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class editprofile extends StatefulWidget {


  const editprofile({Key? key}) : super(key: key);

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
    File? _image  ;
    final imagepicar =ImagePicker();

    String name ="";

    String city ="";
    String street ="";
    String phone ="";
    String email ="";

    SharedPreferences? pref2 ;

    setdata(String name , String key)async{
      pref2= await SharedPreferences.getInstance();
      pref2!.setString(key, name);

    }
    getdata()async{
      pref2= await SharedPreferences.getInstance();
      setState(() {
        name=pref2!.getString("name")?? "";
        email=pref2!.getString("email")?? "";
        city=pref2!.getString("city")?? "";
        street=pref2!.getString("street")?? "";
        phone=pref2!.getString("phone")?? "";
      });
    }

    var editcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
      getdata();
    return Scaffold(

      backgroundColor: Color(0xFF432267),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xFF432267),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           InkWell(
             onTap: (){
               Navigator.pop(context);
             },
             child: BackButtonIcon(
           ),),
            Expanded(
              child: Text("Edit Profile",style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child:
              Text("Cancel",style: TextStyle(color: Color(0xFFE99000),fontSize: 15),),
            )
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Stack(
                  children: [
                    Container(
                      height: 115,
                      width: 115,
                    ),
                    Container(
                      height: 110,
                      width: 110,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: _image==null? const Icon(FontAwesomeIcons.solidUser,color: Color(0xFF432267),size: 35,)
                          : ClipRRect(child: Image.file(_image!,fit: BoxFit.scaleDown,),
                        borderRadius: BorderRadius.circular(100),)  ,
                    ),

                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) =>Container(
                                  decoration:  BoxDecoration(
                                      color: Color(0xFFE99000)
                                  ),
                                  height: 150,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("Chosse from",style: TextStyle(color: Color(0xFF432267),fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [InkWell(
                                          onTap:(){
                                            piccam();
                                          }
                                          ,
                                          child: Container(
                                            margin: EdgeInsets.all(20),
                                            child: Row(
                                              children: const [
                                                Icon(FontAwesomeIcons.camera,size: 30,color: Color(0xFF432267)),
                                                Text("Camera",style: TextStyle(color: Color(0xFF432267),fontSize: 25),)
                                              ],
                                            ),
                                          ),),
                                          InkWell(
                                              onTap:(){
                                                picgallery();
                                              }
                                              ,
                                              child: Container(
                                                margin: EdgeInsets.all(20),
                                                child:Row(
                                                  children: const [
                                                    Icon(FontAwesomeIcons.image,size: 30,color: Color(0xFF432267)),
                                                    Text("Gallery",style: TextStyle(color: Color(0xFF432267),fontSize: 25))
                                                  ],
                                                ),))],),

                                    ],
                                  ),
                                )));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 5,style: BorderStyle.solid,),
                              shape: BoxShape.circle,
                              color: Color(0xFF432267),
                            ),
                            child: const Icon(FontAwesomeIcons.pen,color: Colors.white,size: 20,),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(

                      onTap: (){

                        _displayTextInputDialog(context, "Name","name");
                      },

                      child:  Container(
                        decoration: const BoxDecoration(
                          borderRadius:BorderRadiusDirectional.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.9,

                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.09,
                              width: MediaQuery.of(context).size.width*0.17,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE99000),
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(15),
                                      bottomStart: Radius.circular(15))
                              ),
                              child: const Icon(FontAwesomeIcons.solidCircleUser,color: Color(0xFF432267),size: 33,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("${name}",style: TextStyle(
                                  color: Color(0xFF432267),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            )

                          ],
                        ),
                      ),),
                    InkWell(
                      onTap: (){

                        _displayTextInputDialog(context, "Email","email");
                      },

                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius:BorderRadiusDirectional.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.9,

                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.09,
                              width: MediaQuery.of(context).size.width*0.17,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE99000),
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(15),
                                      bottomStart: Radius.circular(15))
                              ),
                              child: const Icon(FontAwesomeIcons.solidEnvelope,color: Color(0xFF432267),size: 33,),
                            ),
                            Container(
                              margin:  EdgeInsets.only(left: 10),
                              child:  Text("${email}",style: TextStyle(
                                  color: Color(0xFF432267),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            )

                          ],
                        ),
                      ),),
                    InkWell(
                      onTap: (){
                        _displayTextInputDialog(context, "City","city");
                      },

                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius:BorderRadiusDirectional.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.9,

                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.09,
                              width: MediaQuery.of(context).size.width*0.17,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE99000),
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(15),
                                      bottomStart: Radius.circular(15))
                              ),
                              child: const Icon(FontAwesomeIcons.house,color: Color(0xFF432267),size: 33,),
                            ),
                            Container(
                              margin:  EdgeInsets.only(left: 10),
                              child:  Text("${city}",style: TextStyle(
                                  color: Color(0xFF432267),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            )

                          ],
                        ),
                      ),),
                    InkWell(
                      onTap: (){

                        _displayTextInputDialog(context, "Street","street");
                      },

                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius:BorderRadiusDirectional.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.9,

                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.09,
                              width: MediaQuery.of(context).size.width*0.17,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE99000),
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(15),
                                      bottomStart: Radius.circular(15))
                              ),
                              child: const Icon(FontAwesomeIcons.locationPin,color: Color(0xFF432267),size: 33,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child:  Text("${street}",style: TextStyle(
                                  color: Color(0xFF432267),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            )

                          ],
                        ),
                      ),),
                    InkWell(
                      onTap: (){
                        _displayTextInputDialog(context, "Phone","phone");
                      },
                      child:  Container(
                        decoration: const BoxDecoration(
                          borderRadius:BorderRadiusDirectional.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.9,

                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.09,
                              width: MediaQuery.of(context).size.width*0.17,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE99000),
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(15),
                                      bottomStart: Radius.circular(15))
                              ),
                              child: const Icon(FontAwesomeIcons.phone,color:Color(0xFF432267),size: 33,),
                            ),
                            Container(
                              margin:  EdgeInsets.only(left: 10),
                              child: Text("${phone}",style: TextStyle(
                                  color: Color(0xFF432267),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            )

                          ],
                        ),
                      ),),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                margin: EdgeInsets.only(top: 130),
                alignment: AlignmentDirectional.bottomEnd,
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius:BorderRadiusDirectional.only(
                      topStart: Radius.circular(15)
                      ,topEnd: Radius.circular(15)),
                  color: Color(0xFFE99000),
                ),
                child: const Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
              ),)

            ],
          ),
        ),
      ) ,
    );
  }
 picgallery() async{
  var image = await imagepicar.pickImage(source: ImageSource.gallery);

  setState(() {
    _image = File(image!.path);
  });}

   piccam() async {
    var image = (await imagepicar.pickImage(source: ImageSource.camera)) ;

    setState(() {
      _image = File(image!.path);
    });
  }

    Future<void> _displayTextInputDialog(BuildContext context,String val,String change) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('${val}'),
              content: TextField(
                controller: editcontroller,
                decoration: InputDecoration(hintText: "Enter new data"),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    setState(() {
                      setdata(editcontroller.text, change);
                      editcontroller.clear();
                      Navigator.pop(context);
                    });
                  },
                ),

              ],
            );
          });
    }
}


