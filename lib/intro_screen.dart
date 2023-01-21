import 'package:example_onboarding/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.black),
      // bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    Widget _buildFullscreenImage() {
      return Image.asset(
        'assets/fullscreen.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      );
    }

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [ //set your page view here
        PageViewModel(
          title: "Fractional shares1",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/img_1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares2",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/img_2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares3",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/img_3.jpg'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],

      onDone: () => goHomepage(context), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,
      // skipFlex: 0,
      nextFlex: 0,
      skip: Text('Skip', style: TextStyle(color: Colors.blue),),
      next: Icon(Icons.arrow_forward, color: Colors.blue,),
      done: Text('Getting Stated', style: TextStyle(
          fontWeight: FontWeight.w600, color:Colors.blue
      ),),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Color(0xFFBDBDBD), //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder( //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return Home();
        }
        ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return  Padding(
      padding: EdgeInsets.only(top: 20),
      child: Align(
        child: Image.asset('$assetName', width: 350.0),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
