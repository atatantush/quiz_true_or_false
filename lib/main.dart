import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var n = 0;
  var score = 0;
  List que = [
    questions("1. Al-Ahly Club of Egypt has 24 continental championships ?",
        "https://www.elmogaz.com/img/20/12/05/16071853597805090.jpg", true),
    questions(
        "2. The Egyptian Zamalek is the historically best club in the African continent ?",
        "https://elnas.net/wp-content/uploads/2021/08/415766-68098493.jpeg",
        false),
    questions(
        "3. Al-Ahly of Egypt won the African Championship in 2020 ?",
        "https://www.kingfut.com/wp-content/uploads/2021/07/Al-Ahly-SC-6-680x453.jpg",
        true),
    questions(
        "4. Italy won the 2006 World Cup ? ",
        "https://www.si.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MTY4MDA4MTA1OTEwMDg0OTky/italian-goalkeeper-gianluigi-buffon-kiss-5d247106146a1ada9400001fjpg.webp",
        true),
    questions("5. Mohamed Salah won the Golden Ball award in 2017 ? ",
        "https://static.dw.com/image/43516410_403.jpg", false),
  ];

  void check(bool choice, BuildContext ctx) {
    if (choice == que[n].ans) {
      score = score + 1;
      final snackbar = SnackBar(
        content: Text('Correct Answer'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      // ignore: deprecated_member_use
      Scaffold.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text('Wrong Answer'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      // ignore: deprecated_member_use
      Scaffold.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      if (n < que.length - 1) {
        n = n + 1;
      } else {
        final snackbar = SnackBar(
          content: Text('Quiz Completed Score : $score/5 '),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.lightBlueAccent,
        );
        // ignore: deprecated_member_use
        Scaffold.of(ctx).showSnackBar(snackbar);
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE2F3F4),
        appBar: AppBar(
          backgroundColor: Color(0xffD0D5D6),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "True",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                " or",
                style: TextStyle(
                    color: Colors.blue.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                " False ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "Quiz ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Builder(
          builder: (ctx) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(15),
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    child: Image.network(que[n].imgurl)),
              ),
              //SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 105.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50)),
                    border: Border.all(color: Colors.blue.shade600, width: 5)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        que[n].que,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'True',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.greenAccent.shade700,
                    onPressed: () => check(true, ctx),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () => check(false, ctx),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('False',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    color: Colors.red.shade700,
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Score: $score/5",
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    InkWell(
                        onTap: () => reset(),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class questions {
  final String que;
  final String imgurl;
  final bool ans;

  questions(this.que, this.imgurl, this.ans);
}
