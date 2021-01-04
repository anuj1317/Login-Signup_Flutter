import 'package:flutter/material.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin{

  Animation animation,delayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: animationController
    ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(animation: animationController,
    builder: (BuildContext context,Widget child)
    {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.purple.withOpacity(0.5)
                ],

                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                              child: Text(
                                'Register',
                                style:
                                TextStyle(fontSize: 60.0, fontWeight: FontWeight
                                    .bold, color: Colors.purple),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors
                                          .green))),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD ',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors
                                          .green))),
                              obscureText: true,
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'USERNAME',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black26),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors
                                          .green))),
                            ),
                            SizedBox(height: 50.0),
                            Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.purple,
                                  color: Colors.purple,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'SIGNUP',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(height: 20.0),
                            Container(
                              height: 40.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1.0),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child:

                                  Center(
                                    child: Text('Go Back',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,)),
                                  ),


                                ),
                              ),
                            ),
                          ],
                        )),
                  ),

                ]),
          ));
    }
    );
  }
}