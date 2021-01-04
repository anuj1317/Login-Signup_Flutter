
import 'package:flutter_login_ui/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future logOut(BuildContext context)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('user');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.purple.withOpacity(0.8)),
              clipper: getClipper(),
            ),
            // Positioned(
            //     width: 60,
            //     top: MediaQuery.of(context).size.height / 12,
            //     child: InkWell(
            //       onTap: (){
            //         Navigator.of(context).pop();
            //       },
            //         child: Icon(
            //           Icons.arrow_back,color: Colors.black,size: 40,)
            //     )
            // ),
            Positioned(
                width: MediaQuery.of(context).size.width / 1,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(
                                   'assets/dp.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black,spreadRadius: 2)
                            ])),
                    SizedBox(height: 70.0),
                    Text(
                      'Anonymous',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Flutter',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Edit Name',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purpleAccent,
                          color: Colors.purple,
                          elevation: 7.0,
                          child: InkWell(
                            onTap: () {
                              logOut(context);
                            },
                            child: Center(
                              child: Text(
                                'Log out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.black,
                          color: Colors.black,
                          elevation: 7.0,
                          child: InkWell(
                            onTap: () {
                              show(context);
                            },
                            child: Center(
                              child: Text(
                                'Description',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 1.8);
    path.lineTo(size.width+150, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget show(context){
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                height: 350.0,
                width: 200.0,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(height: 150.0),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Colors.purple),
                        ),
                        Positioned(
                            top: 50.0,
                            left: 94.0,
                            child: Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45.0),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2.0),
                                  image: DecorationImage(
                                      image:
                                      AssetImage('assets/dp.jpg'),
                                      fit: BoxFit.cover)),
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'Flutter Custom Dialog box',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                    SizedBox(height: 5.0),

                    Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'Anuj Singh',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                    SizedBox(height: 15,),

                    FlatButton(
                        child: Center(
                          child: Text(
                            'OKAY',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.teal),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.transparent
                    )
                  ],
                )));
      });
}
