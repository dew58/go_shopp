import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:awesome_card/awesome_card.dart';
class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {

  bool flip =false;
  SharedPreferences? pref ;

  final _formKey2 = GlobalKey<FormState>();

  String nameon ="";
  String cardnum ="";
  String expir ="";
  String cv ="";

  TextEditingController nameoncard = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController expirydate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  getdata()async{
    pref= await SharedPreferences.getInstance();
    setState(() {
      nameon =pref!.getString("nameoncard")??"";
      cardnum =pref!.getString("cardnumber")??"";
      expir =pref!.getString("expirydate")??"";
      cv =pref!.getString("cvv")??"";

    }
    );
  }
  @override
  Widget build(BuildContext context) {

    getdata();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Color(0xFF432267),
        title:  Container(
          width: MediaQuery.of(context).size.width*0.6,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text ("Edit Card",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 20)),
            IconButton( icon: Icon(Icons.home,color: Color(0xFFFEFEFE),), onPressed: () {  },),
          ],
        ),)


      ),

    body: ListView(
      children: [
        SizedBox(
          height: 30,
        ),
       InkWell(
         onTap: (){
           setState(() {
             flip =!flip;
           });
         },
         child:  CreditCard(
         cardNumber: cardnum,
         cardExpiry: expir,
         cardHolderName: nameon,
         cvv: cv,
         bankName: "Ahly Bank",
         cardType: CardType.masterCard, // Optional if you want to override Card Type
         showBackSide: flip,
         frontBackground: CardBackgrounds.black,
         backBackground: CardBackgrounds.white,
         showShadow: true,
       ),),
        Form(
            key: _formKey2,
            child: Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                      top: MediaQuery.of(context).size.height*0.05,
                      left: MediaQuery.of(context).size.width*0.05,
                      child: Text("Name on Card",style: TextStyle(color: Colors.grey),)),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.062,
                    left: MediaQuery.of(context).size.width*0.05,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child:TextFormField(
                        validator:  (value) {
                          if (value!.isEmpty ) {
                            return 'Please enter the card name';
                          }
                          return null;
                        },
                        controller: nameoncard,
                      ) ,
                    ),),

                  Positioned(
                      top: MediaQuery.of(context).size.height*0.15,
                      left: MediaQuery.of(context).size.width*0.05,
                      child: Text("Card Number",style: TextStyle(color: Colors.grey),)),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.162,
                    left: MediaQuery.of(context).size.width*0.05,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child:TextFormField(
                        controller: cardnumber,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator:  (value) {
                          if (value!.isEmpty ) {
                            return 'Please enter the card number';
                          }
                          return null;
                        },
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            suffixIcon:Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Image.asset("assets/icons/Icon_MasterCard.png"),
                            )


                        ),
                      ) ,
                    ),),
                  Positioned(
                      top: MediaQuery.of(context).size.height*0.27,
                      left: MediaQuery.of(context).size.width*0.05,
                      child: Text("Expiry Date",style: TextStyle(color: Colors.grey),)),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.272,
                    left: MediaQuery.of(context).size.width*0.05,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child:TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator:  (value) {
                          if (value!.isEmpty ) {
                            return 'Please enter the Expiry date';
                          }
                          return null;
                        },
                        controller: expirydate,
                      ) ,
                    ),),

                  Positioned(
                      top: MediaQuery.of(context).size.height*0.27,
                      left: MediaQuery.of(context).size.width*0.5,
                      child: Text("CVV",style: TextStyle(color: Colors.grey),)),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.272,
                    left: MediaQuery.of(context).size.width*0.5,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child:TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator:  (value) {
                          if (value!.isEmpty ) {
                            return 'Please enter the cvv';
                          }
                          return null;
                        },
                        controller: cvv,
                      ) ,
                    ),),
                  Positioned(top: MediaQuery.of(context).size.height*0.35,
                    child: Row(children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            activeColor: Colors.orange,
                            shape: CircleBorder(),
                            tristate: false,
                            value: true,
                            splashRadius: 30,
                            onChanged: (bool? value) {
                            }
                        ),
                      ),
                      Text("Save this card detalis")
                    ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.45,
                    left: MediaQuery.of(context).size.width*0.1,
                    child:  Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child:
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange ,width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: Container(margin: EdgeInsets.only(top: 10,bottom: 10,left:35,right: 35),
                                child: Text("Back",style: TextStyle(color: Colors.orange,fontSize: 17,fontWeight: FontWeight.bold),)
                            ),

                          ),),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: Container(margin: EdgeInsets.only(top: 10,bottom: 10,left:35,right: 35),
                                child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)
                            ),

                          ),),

                      ],),))
                ],
              ),
            )
        ),

      ],
    ),);
  }
}
