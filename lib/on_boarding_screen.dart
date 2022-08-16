import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_shop/components.dart';
import 'package:go_shop/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardingModel{
  final String image;
  final String title;
  final String lButton;
  final String rButton;

  BoardingModel({
    required this.image,
    required this.title,
    required this.lButton,
    required this.rButton,
  });
}
class OnBoardingScreen2 extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen2> {
  var BoardController=PageController();

  List<BoardingModel> boarding = [
    BoardingModel(image: 'assets/intro/Catalogue-amico.svg', title: 'We strive to have a positive impact on customers, employees, small businesses, the economy, and communicaties.', lButton: 'Skip', rButton: 'Next',),
    BoardingModel(image: 'assets/intro/Free shipping-pana.svg', title: 'We promote the fact that we offer free shopping for all orders.', lButton: 'Back', rButton: 'Next',),
    BoardingModel(image: 'assets/intro/Mobile Marketing-pana.svg', title: 'Be sure to log to be able to book newly added offers.', lButton: 'Log in', rButton: 'Register',),
  ];
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF432267),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF432267),
        actions: [
          TextButton(
            onPressed: (){
              navigateAndFinish(context, LoginScreen());
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFFE99000),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: ( int index){
                  if(index==boarding.length-1)
                  {
                    setState(() {
                      isLast=true;
                    });
                    print('last');
                  }
                  else{
                    print(' not last');
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                controller: BoardController,
                itemBuilder: (context,index)=>BuildBoardingItem(boarding[index], index),
                itemCount: boarding.length,),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(controller: BoardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFFE99000),
                    dotHeight: 8.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                    expansionFactor: 2,

                  ),
                ),
                Spacer(),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget BuildBoardingItem (BoardingModel model, int index)=>Center(child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child:Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15),
          child: SvgPicture.asset(
          model.image,
        ),)
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        model.title,
        style: TextStyle(
          color: Color(0xFFFEFEFE),
        ),
      ),
      const SizedBox(
        height: 60.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultTextButton(
            onPressed: (){
              if(index == 0 || index == 2){
                navigateAndFinish(context, LoginScreen());
              }
              else{
                BoardController.previousPage(
                  duration: const Duration(
                    milliseconds: 750,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }
            },
            text: model.lButton,
            fontWeight: FontWeight.bold,
            textColor: Color(0xFFFEFEFE),
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
              if(isLast){
                navigateAndFinish(context, LoginScreen());
              }
              else{
                BoardController.nextPage(
                  duration: const Duration(
                    milliseconds: 750,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }
            },
            text: model.rButton,
            fontWeight: FontWeight.bold,
            textColor: Color(0xFFE99000),
            fontSize: 20.0,
          ),
        ],
      ),
    ],
  ),);
}
