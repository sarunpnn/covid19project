import 'package:project_covidapp/constant.dart';
import 'package:project_covidapp/widgets/counter.dart';
import 'package:project_covidapp/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:project_covidapp/covid_today_result.dart';
import 'package:project_covidapp/location.dart';
import 'package:location/location.dart';
import 'package:project_covidapp/CaseUpdate.dart';
import 'package:project_covidapp/Covidarea.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19 Finder',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;
  Covidarea _dataFromWebAPI2;
  CovidTodayResult _dataFromWebAPI;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocationPermission();
    print('init state');
    getData();
    controller.addListener(onScroll);
    getData2();
    controller.addListener(onScroll);
  }

  void _getLocationPermission() async {
    var location = new Location();
    try {
      location.requestPermission();
    } on Exception catch (_) {
      print('There was a problem allowing location access');
    }
  }

  Future<void> getData() async{
    print('get data');
    var response = await http.get('https://covid19.th-stat.com/api/open/today');
    print(response.body);
    setState(() {
      _dataFromWebAPI = covidTodayResultFromJson(response.body);
    });

  }
  Future<void> getData2() async{
    print('get data');
    var response2 = await http.get('https://covid19.th-stat.com/api/open/cases/sum');
    print(response2.body);
    setState(() {
      _dataFromWebAPI2 = covidareaFromJson(response2.body);
    });

  }




  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/2doc.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Thailand",
                      items: [
                        'Thailand'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      FlatButton(
                        child: Text("See details",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600,),
                        ),
                        onPressed: () => { Navigator.push( context, MaterialPageRoute(builder: (context) => casepage()),
                        ),
                        },
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number:('${_dataFromWebAPI?.confirmed?? "..."}'),
                          title: "ผู้ติดเชื้อสะสม",
                        ),
                        Counter(
                          color: kDeathColor,
                          number:('${_dataFromWebAPI?.deaths?? "..."}'),
                          title: "เสียชีวิต",
                        ),
                        Counter(
                          color: kRecovercolor,
                          number:('${_dataFromWebAPI?.recovered?? "..."}'),
                           title:"หายเเล้ว",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                           "Spread of Virus",
                         style: kTitleTextstyle,
                              ),
                      FlatButton(
                      child: Text("See details",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600,),
    ),
                           onPressed: () => { Navigator.push( context, MaterialPageRoute(builder: (context) => GMap()),
                            ),
                         },
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}