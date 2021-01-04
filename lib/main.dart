import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Signup.dart';

var user;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  user = preferences.getString('user');
  print(user);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new Signup(),
        '/profile': (BuildContext context) => new Profile()
      },
       home: user==null?MyHomePage():Profile(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation animation,delayedAnimation,muchDelayedAnimation;
  AnimationController animationController;

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String user = "test123";
  String password = "123456";

  Future checkLogin()async{
    if (userController.text == user && passController.text == password) {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('user', userController.text);

      Navigator.of(context).pushNamed('/profile');
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "Username & Password Invalid!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }




  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);

    animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      curve: Curves.easeOutCirc,
      parent: animationController
    ));

    delayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn),
        parent: animationController
    ));


    muchDelayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.8,1.0,curve: Curves.fastOutSlowIn),
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
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                          child: Text('Hello',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 140.0, 0.0, 0.0),
                          child: Text('folks',
                              style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(195.0, 140.0, 0.0, 0.0),
                          child: Text('.',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple)),
                        )
                      ],
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
                  child: Container(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: userController,
                            decoration: InputDecoration(
                                labelText: 'USERNAME',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black26),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors
                                        .purple))),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: passController,
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black26),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors
                                        .purple))),
                            obscureText: true,
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.purple,
                              color: Colors.purple,
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  checkLogin();
                                },
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text('Log in with facebook',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 15.0),
                Transform(
                  transform: Matrix4.translationValues(muchDelayedAnimation .value * width, 0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New to Spotify ?',
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
    }
    );
  }
}