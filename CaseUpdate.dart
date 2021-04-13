import 'package:flutter/cupertino.dart';
import 'package:project_covidapp/constant.dart';
import 'package:project_covidapp/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_covidapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:project_covidapp/covid_today_result.dart';

class casepage extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();

}

class _InfoScreenState extends State<casepage> {
  final controller = ScrollController();
  double offset = 0;
  CovidTodayResult _dataFromWebAPI;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    controller.addListener(onScroll);
  }

  Future<void> getData() async{
    print('get data');
    var response = await http.get('https://covid19.th-stat.com/api/open/today');
    print(response.body);
    setState(() {
      _dataFromWebAPI = covidTodayResultFromJson(response.body);
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Case Update"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.withOpacity(0.9),elevation: 100,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            MyHeader(
              image:"assets/icons/casecovid.svg",
              textTop: "    Get to know",

              textBottom: "   Case Update",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Case Update",
                    style: kTitleTextstyle,
                  ),
                  Text("Date : "'${_dataFromWebAPI?.updateDate?? "..."}'
                    ),
                  PreventCard(
                    text: ('              ${_dataFromWebAPI?.newConfirmed?? "..."}'" People "),
                    image: "assets/images/sick.png",
                    title: "             New Confirmed",
                  ),
                  PreventCard(
                    text: ('               ${_dataFromWebAPI?.newRecovered?? "..."}'" People "),
                    image: "assets/images/recovery.png",
                    title: "             New Recovered",
                  ), PreventCard(
                    text: ('              ${_dataFromWebAPI?.newHospitalized?? "..."}'" People "),
                    image: "assets/images/hospital.jpg",
                    title: "             New Hospitalized",
                  ),PreventCard(
                    text: ('                ${_dataFromWebAPI?.newDeaths?? "..."}'"  People"),
                    image: "assets/images/dead.png",
                    title: "             New Death",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

