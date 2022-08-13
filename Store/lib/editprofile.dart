import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class editprofile extends StatefulWidget {


  const editprofile({Key? key}) : super(key: key);

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
    File? _image  ;
    final imagepicar =ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BackButtonIcon(),
            Expanded(
              child: Text("Edit Profile",style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              child:
              Text("Cancel",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),),
            )
          ],
        ),
      ),
      body:Center(
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
                      child: _image==null? const Icon(FontAwesomeIcons.solidUser,color: Colors.deepPurple,size: 35,)
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
                                    color: Colors.deepOrangeAccent
                                  ),
                                  height: 150,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("Chosse from",style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                                            Icon(FontAwesomeIcons.camera,size: 30,color: Colors.deepPurple),
                                            Text("Camera",style: TextStyle(color: Colors.deepPurple,fontSize: 25),)
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
                                            Icon(FontAwesomeIcons.image,size: 30,color: Colors.deepPurple),
                                            Text("Gallery",style: TextStyle(color: Colors.deepPurple,fontSize: 25))
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
                              color: Colors.deepPurple,
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
                    Container(
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
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(15),
                                    bottomStart: Radius.circular(15))
                            ),
                            child: const Icon(FontAwesomeIcons.solidCircleUser,color: Colors.deepPurple,size: 33,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("Nada Mohammed",style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                          )

                        ],
                      ),
                    ),
                    Container(
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
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(15),
                                    bottomStart: Radius.circular(15))
                            ),
                            child: const Icon(FontAwesomeIcons.solidEnvelope,color: Colors.deepPurple,size: 33,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("nada.mohammed@example.com",style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                          )

                        ],
                      ),
                    ),
                    Container(
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
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(15),
                                    bottomStart: Radius.circular(15))
                            ),
                            child: const Icon(FontAwesomeIcons.house,color: Colors.deepPurple,size: 33,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("Al Arish, Egypt",style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                          )

                        ],
                      ),
                    ),
                    Container(
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
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(15),
                                    bottomStart: Radius.circular(15))
                            ),
                            child: const Icon(FontAwesomeIcons.locationPin,color: Colors.deepPurple,size: 33,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text("23 july St. North Sinai.Egypt",style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                          )

                        ],
                      ),
                    ),
                    Container(
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
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(15),
                                    bottomStart: Radius.circular(15))
                            ),
                            child: const Icon(FontAwesomeIcons.phone,color: Colors.deepPurple,size: 33,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("+201016728784",style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius:BorderRadiusDirectional.only(
                      topStart: Radius.circular(15)
                  ,topEnd: Radius.circular(15)),
                  color: Colors.deepOrangeAccent,
                ),
                child: const Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
              )

            ],
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
}


