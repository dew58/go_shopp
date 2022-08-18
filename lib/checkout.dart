import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_shop/Models/historymodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steps_indicator/steps_indicator.dart';
import 'package:go_shop/editcard.dart';

import 'Models/cartmodel.dart';
import 'home.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool value = true;
  bool clicked1 =true;
  bool clicked2 =true;
  bool clicked3 =true;
  bool clicked4 =true;

  SharedPreferences? pref ;

  //shared data

  setdata (String data, String key)async{
    pref= await SharedPreferences.getInstance();
    pref!.setString(key, data);
  }

  //text controllers

  TextEditingController street1 = TextEditingController();
  TextEditingController street2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController nameoncard = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController expirydate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  // form keys

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();



  int activeStep = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {

    final history = Provider.of<History>(context);
    final cart = Provider.of<Cartmodel>(context);

    return Scaffold(
      body:ListView(
        shrinkWrap: true,
       // physics: PageScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFFEFEFE),
              ),
              Container(
                //margin: EdgeInsets.only(bottom: 20),
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF432267),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 100),
                    child: AppBar(
                      // automaticallyImplyLeading : false,
                        elevation: 0,
                        toolbarHeight: 250,
                        backgroundColor: Color(0xFF432267),
                        centerTitle:true,
                        title: Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // IconButton( icon: Icon(FontAwesomeIcons.barsStaggered,color: Color(0xFFFEFEFE)), onPressed: () => ZoomDrawer.of(context)!.toggle()),
                              Text ("Checkout",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 20)),
                              IconButton( icon: SvgPicture.asset("assets/icons/home.svg",color: Color(0xFFFEFEFE)), onPressed: () {
                                Navigator.push(context, scaleIn(MainHome()));
                              },
                              ),
                            ],
                          ),)
                    ),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height*0.14,
                  left: MediaQuery.of(context).size.width*0.06,
                  child: StepsIndicator(
                    selectedStep: activeStep,
                    nbSteps:3,
                    unselectedStepColorOut : Colors.white,
                    unselectedStepColorIn : Colors.white,
                    selectedStepColorOut: Colors.white,
                    selectedStepColorIn: Colors.orange,
                    doneStepColor: Colors.orange,
                    doneLineColor: Colors.orange,
                    undoneLineColor: Colors.white,
                    isHorizontal: true,
                    lineLength: MediaQuery.of(context).size.width*0.35,
                    doneStepSize: 20,
                    unselectedStepSize: 20,
                    selectedStepSize: 25,
                    selectedStepBorderSize: 3,
                    enableLineAnimation: true,
                    //enableStepAnimation: true,
                  )
              ),
              Positioned(
                  left:MediaQuery.of(context).size.width*0.05 ,
                  top: MediaQuery.of(context).size.height*0.2,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address",style:TextStyle(color: Color(0xFFFEFEFE), fontWeight:activeStep==0? FontWeight.bold:null ),),
                        Text("Payments",style:TextStyle(color: Color(0xFFFEFEFE),fontWeight:activeStep==1? FontWeight.bold:null),),
                        Text("Summary",style:TextStyle(color: Color(0xFFFEFEFE),fontWeight:activeStep==2? FontWeight.bold:null),),

                      ],
                    ),)),
              Positioned(
                  top: MediaQuery.of(context).size.height*0.28,
                  child:
                  Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    width:MediaQuery.of(context).size.width ,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page){
                        setState(() {
                          activeStep =page;
                        });
                      },
                      children: [
                        Form(
                          key: _formKey1,
                          child: Container(
                            child: Stack(
                              children: [
                                Row(children: [
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Checkbox(
                                        value: clicked1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            clicked1 = !clicked1;
                                          });
                                        },
                                        activeColor: Colors.orange,
                                        shape: CircleBorder(),
                                        tristate: false,
                                        splashRadius: 30,

                                    ),
                                  ),
                                  Text("Billing address is the same as delivery address")
                                ],),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.1,
                                    left: MediaQuery.of(context).size.width*0.05,
                                    child: Text("Street 1",style: TextStyle(color: Colors.grey),)),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.12,
                                  left: MediaQuery.of(context).size.width*0.05,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    child:TextFormField(
                                      validator:  (value) {
                                        if (value == null || value.isEmpty ) {
                                          return 'Please enter the street';
                                        }
                                        return null;
                                      },
                                      controller: street1,
                                    ) ,
                                  ),),

                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.2,
                                    left: MediaQuery.of(context).size.width*0.05,
                                    child: Text("Street 2",style: TextStyle(color: Colors.grey),)),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.22,
                                  left: MediaQuery.of(context).size.width*0.05,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    child:TextFormField(
                                      validator:  (value) {
                                        if (value!.isEmpty ) {
                                          return 'Please enter the street';
                                        }
                                        return null;
                                      },
                                      controller: street2,
                                    ) ,
                                  ),),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.3,
                                    left: MediaQuery.of(context).size.width*0.05,
                                    child: Text("City",style: TextStyle(color: Colors.grey),)),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.32,
                                  left: MediaQuery.of(context).size.width*0.05,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    child:TextFormField(
                                      validator:  (value) {
                                        if (value!.isEmpty ) {
                                          return 'Please enter the city';
                                        }
                                        return null;
                                      },
                                      controller: city,
                                    ) ,
                                  ),),

                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.4,
                                    left: MediaQuery.of(context).size.width*0.05,
                                    child: Text("State",style: TextStyle(color: Colors.grey),)),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.42,
                                  left: MediaQuery.of(context).size.width*0.05,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.4,
                                    child:TextFormField(
                                      validator:  (value) {
                                        if (value!.isEmpty ) {
                                          return 'Please enter the state';
                                        }
                                        return null;
                                      },
                                      controller: state,
                                    ) ,
                                  ),),


                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.4,
                                    left: MediaQuery.of(context).size.width*0.5,
                                    child: Text("Country",style: TextStyle(color: Colors.grey),)),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.42,
                                  left: MediaQuery.of(context).size.width*0.5,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.4,
                                    child:TextFormField(
                                      validator:  (value) {
                                        if (value!.isEmpty ) {
                                          return 'Please enter the country';
                                        }
                                        return null;
                                      },
                                      controller: country,
                                    ) ,
                                  ),),
                              ],
                            ),),),
                        Form(
                            key: _formKey2,
                            child: Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                      left:MediaQuery.of(context).size.width*0.05 ,
                                      child:
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.9,
                                        child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                  border: Border.all(color: Colors.grey)
                                              ),
                                              child: Container(margin: EdgeInsets.only(top: 10,bottom: 10,left:35,right: 35),
                                                  child:
                                                  Image.asset("assets/icons/icons8_PayPal_1.png")
                                              ),

                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                                //border: Border.all(color: Colors.grey)
                                              ),
                                              child: Container(margin: EdgeInsets.only(top: 10,bottom: 10,left:35,right: 35),
                                                  child:
                                                  Image.asset("assets/icons/Icon_CreditCard.png")
                                              ),

                                            ),
                                            InkWell(
                                              onTap: (){
                                                Navigator.push(context, scaleIn(EditCard()));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                                    border: Border.all(color: Colors.grey)
                                                ),
                                                child: Container(margin: EdgeInsets.only(top: 10,bottom: 10,left:35,right: 35),
                                                    child:
                                                    Image.asset("assets/icons/Icon_SavedCards.png")
                                                ),

                                              ),
                                            ),

                                          ],),)),


                                  Positioned(
                                      top: MediaQuery.of(context).size.height*0.1,
                                      left: MediaQuery.of(context).size.width*0.05,
                                      child: Text("Name on Card",style: TextStyle(color: Colors.grey),)),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height*0.12,
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
                                      top: MediaQuery.of(context).size.height*0.2,
                                      left: MediaQuery.of(context).size.width*0.05,
                                      child: Text("Card Number",style: TextStyle(color: Colors.grey),)),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height*0.22,
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
                                      top: MediaQuery.of(context).size.height*0.3,
                                      left: MediaQuery.of(context).size.width*0.05,
                                      child: Text("Expiry Date",style: TextStyle(color: Colors.grey),)),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height*0.32,
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
                                      top: MediaQuery.of(context).size.height*0.3,
                                      left: MediaQuery.of(context).size.width*0.5,
                                      child: Text("CVV",style: TextStyle(color: Colors.grey),)),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height*0.32,
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
                                  Positioned(top: MediaQuery.of(context).size.height*0.42,
                                    child: Row(children: [
                                      Transform.scale(
                                        scale: 1.5,
                                        child: Checkbox(
                                            value: clicked2,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                clicked2 = !clicked2;
                                              });
                                            },
                                            activeColor: Colors.orange,
                                            shape: CircleBorder(),
                                            tristate: false,
                                            splashRadius: 30,
                                        ),
                                      ),
                                      Text("Save this card detalis")
                                    ],),)
                                ],
                              ),)),
                        Container(
                            height: MediaQuery.of(context).size.height*0.8,
                            width: MediaQuery.of(context).size.width*0.9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text("Summary",style: TextStyle(fontSize: 20),)),
                                Stack(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.6,
                                      width: MediaQuery.of(context).size.width*0.9,),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.3,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: cart.cartintem.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return
                                            Stack(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.16,
                                                  width: MediaQuery.of(context).size.width*0.9,
                                                ),
                                                Positioned(
                                                  left:MediaQuery.of(context).size.width*0.05,
                                                  child:  Container(
                                                    decoration:BoxDecoration(
                                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                      color: Color(0xFFFEFEFE),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3), // changes position of shadow
                                                        ),
                                                      ],),
                                                    height: MediaQuery.of(context).size.height*0.15,
                                                    width: MediaQuery.of(context).size.width*0.9,
                                                  ),),
                                                Positioned(
                                                  left:MediaQuery.of(context).size.width*0.05,
                                                  child: Container(
                                                      height: MediaQuery.of(context).size.height*0.15,
                                                      width:90,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                                                            bottomLeft:Radius.circular(20) ),
                                                        child: Image.network("${cart.cartintem[index].product[index].image}",fit: BoxFit.fill,),
                                                      )),
                                                ),
                                                Positioned(
                                                  top:20,
                                                  left: MediaQuery.of(context).size.width*0.3,
                                                  child: Column(
                                                    mainAxisAlignment : MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment : Alignment.topLeft,
                                                        child:Text("${cart.cartintem[index].product[index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),),
                                                      Align(
                                                        alignment : Alignment.topLeft,
                                                        child:Text("American Trenda",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.star,color: Color(0xFFE99000),),
                                                          Icon(Icons.star,color: Color(0xFFE99000),),
                                                          Icon(Icons.star,color: Color(0xFFE99000),),
                                                          Icon(Icons.star,color: Color(0xFFE99000)),
                                                          Icon(Icons.star,color: Color(0xFFE99000)),
                                                          Text("+23"),

                                                        ],
                                                      ),
                                                    ],),),

                                                Positioned(
                                                    top:MediaQuery.of(context).size.height*0.15,
                                                    child: Container(
                                                      height: 20,
                                                    ))
                                              ],
                                            )
                                          ; },


                                      ),),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                              color: Colors.white
                                          ),
                                          height: MediaQuery.of(context).size.height*0.35,
                                          width: MediaQuery.of(context).size.width,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Shipping Address",style: TextStyle(fontSize: 20),),
                                                    Checkbox(
                                                      value: clicked3,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          clicked3 = !clicked3;
                                                        });
                                                      },
                                                      activeColor: Colors.orange,
                                                      shape: CircleBorder(),
                                                      tristate: false,
                                                      splashRadius: 30,
                                                    ),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("${street1.text},${street2.text},${city.text}"),
                                                Text("${state.text},${country.text}"),
                                                TextButton( onPressed: () {
                                                  setState(() {
                                                    activeStep=0;
                                                    _pageController.animateToPage(activeStep, curve: Curves.decelerate, duration: Duration(milliseconds: 300));
                                                  });
                                                },
                                                    child: Text("Change",style: TextStyle(color: Colors.red),)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Shipping Address",style: TextStyle(fontSize: 20),),
                                                    Checkbox(
                                                      value: clicked4,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          clicked4 = !clicked4;
                                                        });
                                                      },
                                                      activeColor: Colors.orange,
                                                      shape: CircleBorder(),
                                                      tristate: false,
                                                      splashRadius: 30,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 50,
                                                      child: Image.asset("assets/icons/Icon_MasterCard.png"),),
                                                    Column(children: [
                                                      Text("Master Card",style: TextStyle(color: Colors.grey),),

                                                      Text(cardnumber.text.isEmpty?(''):("**** **** **** ${cardnumber.text.substring(cardnumber.text.length - 4)}")),
                                                    ],),
                                                  ],
                                                ),
                                                TextButton( onPressed: () {

                                                  Navigator.push(context, scaleIn(EditCard()));
                                                },
                                                    child: Text("Change",style: TextStyle(color: Colors.red),)),
                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: MediaQuery.of(context).size.height*0.06,
                  left: MediaQuery.of(context).size.width*0.15,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              if(activeStep>0){
                                activeStep--;
                                _pageController.animateToPage(activeStep, curve: Curves.decelerate, duration: Duration(milliseconds: 300));
                              }else{
                                Navigator.pop(context);
                              }
                            });
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
                            if (activeStep==0){
                              if (!_formKey1.currentState!.validate()){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Enter Data')),
                                );
                              }else{
                                activeStep++;
                                _pageController.animateToPage(activeStep, curve: Curves.decelerate, duration: Duration(milliseconds: 300));
                              }
                            }else if(activeStep==1) {
                              if (!_formKey2.currentState!.validate()){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Enter Data')),
                                );
                              }else{
                                activeStep++;
                                _pageController.animateToPage(activeStep, curve: Curves.decelerate, duration: Duration(milliseconds: 300));
                                setdata(cardnumber.text, "cardnumber");
                                setdata(nameoncard.text, "nameoncard");
                                setdata(expirydate.text, "expirydate");
                                setdata(cvv.text, "cvv");

                              }

                            }else if(activeStep==2){
                              history.addtohistory(cart.cartintem);
                              history.getdate();
                              cart.deletall();
                              Navigator.push(context, scaleIn(MainHome()));
                            }
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

                      ],),
                  )),
            ],
          )
        ],
      )



    )
    ;
  }

  Route scaleIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: page,
        );
      },
    );
  }

}