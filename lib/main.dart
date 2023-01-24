import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

// variables
// -admob

// -device properties
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
// -steps properties
bool _visible = true;
int _count = 0;
// -steps json data
List homepageData = [];
// -timer
late Timer _timer;

// voids
Future<void> homepageJson() async {
  final String response = await rootBundle.loadString('assets/json/homepage.json');
  final data = await json.decode(response);
  //setState(() {
    homepageData = data;
  //});
}

class _StartAppState extends State<StartApp> {

  @override
  void initState() {
    super.initState();
    homepageJson();
    // timer for the animation
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if(_visible){
          _visible = !_visible;
        } else {
          _visible = !_visible;
          if(_count != 4){
            _count += 1;
          } else {
            _count = 0;
          }
        }
      });
    });
  }

  Widget _image() {
    if(homepageData.isEmpty){
      return Image.asset(
        'assets/images/person.png'
      );
    } else {
      return Image.asset(
        homepageData[_count]['png']
      );
    }
  }
  
  Widget _imageText() {
    if(homepageData.isEmpty){
      return const Text(
        "قم بتسجيل الدخول",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32, fontFamily: 'Markazi'),
      );
    } else {
      return Text(
        homepageData[_count]['text'],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 32, fontFamily: 'Markazi'),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                  child: Image.asset(
                    'assets/images/ucforpubg_main.png'
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 175,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0, 
                    duration: const Duration(milliseconds: 300),
                    child: _image(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0, 
                    duration: const Duration(milliseconds: 300),
                    child: _imageText(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                  color: const Color(0xFF7fffda),
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/freefire_logo.png',
                            width: physicalWidth * 0.08,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/images/pubg_logo.png',
                            width: physicalWidth * 0.08,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/images/paypal_logo.jpg',
                            width: physicalWidth * 0.08,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                      child: const Text(
                        'يمكنك باستخدام هذا التطبيق شحن النقاط أو العملات في أي لعبة مختلفة تقريبًا. يمكنك أيضًا شحن حسابك على بايبال كخيار ثان.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color:Color(0xFF092c4a) , fontFamily: 'Markazi'),
                      ),
                    )
                  ]),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 50.0, bottom: 50.0, right: 15, left: 15),
                  color: const Color(0xFF26a18d),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/rules.png',
                        width: physicalWidth * 0.08,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'لا تستخدم عدة حسابات غوغل',
                          style: TextStyle(fontSize: 24, color:Colors.white , fontFamily: 'Markazi'),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'استخدم دائمًا حسابًا واحدًا. وجود حسابات متعددة يعتبر غشًا',
                          style: TextStyle(fontSize: 16, color:Colors.white , fontFamily: 'Markazi'),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'VPN لا تستخدم أي تطبيقات',
                          style: TextStyle(fontSize: 24, color:Colors.white , fontFamily: 'Markazi'),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'استخدام VPN. قد يتسبب في بعض المشاكل مع تجربتك أثناء إكمال المهام',
                          style: TextStyle(fontSize: 16, color:Colors.white , fontFamily: 'Markazi'),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'عليك اكمال المهام الالزامية قبل طلب الجائزة',
                          style: TextStyle(fontSize: 24, color:Colors.white , fontFamily: 'Markazi'),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'قبل تقديم طلب المكافأة. يجب أن تكون قد أكملت المهام الإلزامية على الأقل. مثل مهمة يوتيوب',
                          style: TextStyle(fontSize: 16, color:Colors.white , fontFamily: 'Markazi'),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Flexible(
                              child: Text(
                                'ملاحظة: اي محاولة غش. سيتم تجاهل طلباتك الخاصة بالمكافأة المستقبلية',
                                style: TextStyle(fontSize: 24, color:Colors.white , fontFamily: 'Markazi'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/images/warning.png',
                              width: physicalWidth * 0.03,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0, right: 15, left: 15),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/youtube.png',
                        width: physicalWidth * 0.08,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'عند دخولك لاول مرة قم بوضع صح في كل الخيارات كما في الصورة التالية',
                          style: TextStyle(fontSize: 24, fontFamily: 'Markazi'),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/agree.png',
                          width: physicalWidth * 0.3,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'تطبيقنا آمن وموثوق به',
                            style: TextStyle(fontSize: 24, fontFamily: 'Markazi'),
                          ),
                          const SizedBox( width: 10,),
                          Image.asset(
                            'assets/images/shield.png',
                            width: physicalWidth * 0.08,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: physicalWidth * 0.5,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            // ? ###########################################################################################################################################
                          print('button Clicked!');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF02cc66),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                            'ابدا الان',
                            style: TextStyle(fontSize: 18, fontFamily: 'Markazi'),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            //backgroundColor: Colors.red,
                            foregroundColor: Colors.grey,
                            splashFactory: NoSplash.splashFactory,
                          ),
                          onPressed: () {
                            // ? ###########################################################################################################################################
                            print('privacy button clicked!');
                          },
                          child: Column(children: const [
                              Text(
                                'بالضغط على ابدا الان فانك توافق على',
                                style: TextStyle(fontSize: 16, fontFamily: 'Markazi'),
                              ),
                              Text(
                                'privacy policy و terms & conditions',
                                style: TextStyle(fontSize: 16, fontFamily: 'Markazi'),
                              )
                            ]
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}