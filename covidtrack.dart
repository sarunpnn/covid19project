import 'package:flutter/material.dart';
import 'package:project_covidapp/Covidarea.dart';
import 'package:project_covidapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Covid{
  int id;
  double lat1;
  double lat2;
  String title;
  String snippet ;

  Covid(
      {
        @required this.id,
        @required this.lat1,
        @required this.lat2,
        @required this.title,
        @required this.snippet});
}

List<Covid> covid = [

  Covid(
      id: 1,
      lat1: 13.7244416,
      lat2: 100.3529157,
      title:'Bangkok',
      snippet:'2774 คน',

  ),
Covid(
      id: 2,
      lat1: 18.7941937,
      lat2: 98.816391,
      title:'Chiang Mai',
      snippet:'67 คน',
),
  Covid(
    id: 3,
    lat1: 18.3082108,
    lat2: 98.3813915,
    title:'Lampang',
    snippet:'7 คน',
  ),
  Covid(
    id: 4,
    lat1: 18.0691191,
    lat2: 98.4369419,
    title:'Lamphun ',
    snippet:'6 คน',
  ),
  Covid(
    id: 5,
    lat1: 18.7249269,
    lat2: 96.8801958,
    title:'Mae Hong Son',
    snippet:'5 คน',
  ),
  Covid(
    id: 6,
    lat1: 18.822897,
    lat2: 99.728104,
    title:'Nan',
    snippet:'1 คน',
  ),
  Covid(
    id: 7,
    lat1: 19.2711428,
    lat2: 99.5968063,
    title:'Phayao',
    snippet:'4 คน',
  ),
  Covid(
    id: 8,
    lat1: 18.2609276,
    lat2: 98.8408949,
    title:'Phrae',
    snippet:'1 คน',
  ),
  Covid(
    id: 9,
    lat1: 17.7712815,
    lat2: 99.4259263,
    title:'Uttaradit',
    snippet:'6 คน',
  ),
  Covid(
    id: 10,
    lat1: 16.6418968,
    lat2: 102.5505047,
    title:'Kalasin',
    snippet:'3 คน',
  ),
  Covid(
    id: 11,
    lat1: 16.4441619,
    lat2: 102.6803511,
    title:'Khon Kaen',
    snippet:'12 คน',
  ),
  Covid(
    id: 12,
    lat1: 16.0074265,
    lat2: 100.7745601,
    title:'Chaiyaphum',
    snippet:'10 คน',
  ),
  Covid(
    id: 13,
    lat1: 17.4063232,
    lat2: 103.8354073,
    title:'Nakhon Phanom',
    snippet:'10 คน',
  ),
  Covid(
    id: 14,
    lat1: 14.9650771,
    lat2: 100.9781177,
    title:'Nakhon Ratchasima',
    snippet:'29 คน',
  ),
  Covid(
    id: 15,
    lat1:18.1096838,
    lat2: 103.1573242,
    title:'Bueng Kan',
    snippet:'2774',
  ),

  Covid(
    id: 16,
    lat1: 16.0250658,
    lat2: 102.6150866,
    title:'Maha Sarakham',
    snippet:'2 คน',
  ),
  Covid(
    id: 17,
    lat1: 16.5463017,
    lat2: 103.9651787,
    title:'Mukdahan',
    snippet:'4 คน',
  ),
  Covid(
    id: 18,
    lat1: 15.8195853,
    lat2: 103.852122,
    title:'Yasothon',
    snippet:'1 คน',
  ),
  Covid(
    id: 19,
    lat1: 15.9388287,
    lat2: 102.6928319,
    title:'Roi Et ',
    snippet:'4 คน',
  ),
  Covid(
    id: 20,
    lat1: 17.4862009,
    lat2: 100.3757822,
    title:'Loei ',
    snippet:'11 คน',
  ),
  Covid(
    id: 21,
    lat1: 17.4300725,
    lat2: 102.7232973,
    title:'Sakon Nakhon',
    snippet:'1 คน',
  ),
  Covid(
    id: 22,
    lat1: 14.9058421,
    lat2: 102.4720427,
    title:'Surin',
    snippet:'14 คน',
  ),
  Covid(
    id: 23,
    lat1: 14.9552378,
    lat2: 103.2862603,
    title:'Sisaket',
    snippet:'8 คน',
  ),
  Covid(
    id: 24,
    lat1: 17.9472015,
    lat2: 101.6174688,
    title:'Nong Khai',
    snippet:'5 คน',
  ),
  Covid(
    id: 25,
    lat1: 17.1659699,
    lat2: 102.3009685,
    title:'Nong Bua Lamphu',
    snippet:'4 คน',
  ),
  Covid(
    id: 26,
    lat1: 17.444593,
    lat2: 101.7232403,
    title:'Udon Thani',
    snippet:'11 คน',
  ),
  Covid(
    id: 27,
    lat1: 15.1537265,
    lat2: 103.885323,
    title:'Ubon Ratchathani',
    snippet:'18 คน',
  ),
  Covid(
    id: 28,
    lat1: 15.9113405,
    lat2: 104.1804623,
    title:'Amnat Charoen',
    snippet:'4 คน',
  ),
  Covid(
    id: 29,
    lat1: 16.3942114,
    lat2: 98.3949107,
    title:'Kamphaeng Phet',
    snippet:'2 คน',
  ),
  Covid(
    id: 30,
    lat1: 15.1613972,
    lat2: 99.4748241,
    title:'Chai Nat',
    snippet:'8 คน',
  ),
  Covid(
    id: 31,
    lat1: 14.2847614,
    lat2: 101.0359737,
    title:'Nakhon Nayok ',
    snippet:'5 คน',
  ),
  Covid(
    id: 32,
    lat1: 15.6212111,
    lat2: 98.8414518,
    title:'Nakhon Sawan ',
    snippet:'12 คน',
  ),
  Covid(
    id: 33,
    lat1: 13.8373063,
    lat2: 100.108901,
    title:'Nonthaburi  ',
    snippet:'355 คน',
  ),
  Covid(
    id: 34,
    lat1: 14.0967511,
    lat2:100.0827285,
    title:'Pathum Thani ',
    snippet:'112 คน',
  ),
  Covid(
    id: 35,
    lat1: 14.3937426,
    lat2: 99.9588949,
    title:'Phra Nakhon Si Ayutthaya  ',
    snippet:'34 คน',
  ),
  Covid(
    id: 36,
    lat1: 16.2812682,
    lat2: 99.8323869,
    title:'Phichit',
    snippet:'10 คน',
  ),
  Covid(
    id: 37,
    lat1: 16.9584194,
    lat2: 99.98136,
    title:'Phitsanulok  ',
    snippet:'7 คน',
  ),
  Covid(
    id: 38,
    lat1: 16.2478914,
    lat2:100.0956268,
    title:'Phetchabun',
    snippet:'4 คน',
  ),
  Covid(
    id: 39,
    lat1: 15.2022489,
    lat2: 100.3623787,
    title:'Lopburi  ',
    snippet:'23 คน',
  ),
  Covid(
    id: 40,
    lat1: 13.5984325,
    lat2: 100.1450949,
    title:'Samut Prakan ',
    snippet:'616 คน',
  ),
  Covid(
    id: 41,
    lat1: 13.3764581,
    lat2: 99.8223883,
    title:'Samut Songkhram ',
    snippet:'23 คน',
  ),
  Covid(
    id: 42,
    lat1: 13.5735902,
    lat2: 99.9440179,
    title:'Samut Sakhon ',
    snippet:'3613 คน',
  ),
  Covid(
    id: 43,
    lat1: 14.9165572,
    lat2: 100.1947952,
    title:'Sing Buri  ',
    snippet:'17 คน',
  ),Covid(
    id: 44,
    lat1: 17.2526839,
    lat2: 99.1516281,
    title:'Sukhothai ',
    snippet:'4 คน',
  ),
  Covid(
    id: 45,
    lat1: 14.569492,
    lat2: 98.6637708,
    title:'Suphan Buri ',
    snippet:'14 คน',
  ),
  Covid(
    id: 46,
    lat1: 14.6448576,
    lat2: 100.4555431,
    title:'Saraburi  ',
    snippet:'17 คน',
  ),
  Covid(
    id: 47,
    lat1: 13.7245599,
    lat2: 100.492682,
    title:'Ang Thong',
    snippet:'89 คน',
  ),
  Covid(
    id: 48,
    lat1:15.3697651,
    lat2: 98.4264545,
    title:'Uthai Thani ',
    snippet:'1 คน',
  ),
  Covid(
    id: 49,
    lat1: 12.5687981,
    lat2: 101.9987604,
    title:'Chanthaburi  ',
    snippet:'2774',
  ),
  Covid(
    id: 50,
    lat1: 13.6188815,
    lat2: 101.2646848,
    title:'Chachoengsao',
    snippet:'36 คน',
  ),
  Covid(
    id: 51,
    lat1: 13.0492654,
    lat2: 100.0634303,
    title:'Chonburi ',
    snippet:'1256 คน',
  ),
  Covid(
    id: 52,
    lat1: 12.1606837,
    lat2: 102.0161338,
    title:'Trat ',
    snippet:'2774',
  ),
  Covid(
    id: 53,
    lat1: 13.7245599,
    lat2: 100.492682,
    title:'Prachinburi ',
    snippet:'33 คน',
  ),
  Covid(
    id: 54,
    lat1: 12.8348473,
    lat2: 100.8488693,
    title:'Rayong',
    snippet:'569 คน',
  ),
  Covid(
    id: 55,
    lat1: 13.7224312,
    lat2: 101.2902479,
    title:'Sa Kaeo  ',
    snippet:'13 คน',
  ),
  Covid(
    id: 56,
    lat1: 14.6941736,
    lat2: 97.91619,
    title:'Kanchanaburi ',
    snippet:'14 คน',
  ),
  Covid(
    id: 57,
    lat1: 16.5239458,
    lat2: 97.4970872,
    title:'Tak',
    snippet:'89 คน',
  ),
  Covid(
    id: 58,
    lat1: 11.802663,
    lat2: 99.0308309,
    title:'Prachuap Khiri Khan',
    snippet:'18 คน',
  ),Covid(
    id: 59,
    lat1: 13.1028677,
    lat2: 99.9282039,
    title:'Phetchaburi  ',
    snippet:'31 คน',
  ),Covid(
    id: 60,
    lat1: 13.5474065,
    lat2: 99.0591157,
    title:'Ratchaburi ',
    snippet:'30 คน',
  ),
  Covid(
    id: 61,
    lat1: 8.0410268,
    lat2: 98.4348421,
    title:'Krabi ',
    snippet:'27 คน',
  ),Covid(
    id: 62,
    lat1: 10.3182459,
    lat2: 98.5250326,
    title:'Chumphon ',
    snippet:'21 คน',
  ),
  Covid(
    id: 63,
    lat1: 7.5408087,
    lat2: 99.4902448,
    title:'Trang ',
    snippet:'9 คน',
  ),
  Covid(
    id: 64,
    lat1: 8.5838088,
    lat2: 98.6668346,
    title:'Nakhon Si Thammarat  ',
    snippet:'16 คน',
  ),
  Covid(
    id: 65,
    lat1: 6.0035602,
    lat2: 100.3828591,
    title:'Narathiwat ',
    snippet:'46 คน',
  ),
  Covid(
    id: 66,
    lat1: 6.7523592,
    lat2: 100.8125761,
    title:'Pattani  ',
    snippet:'94 คน',
  ),
  Covid(
    id: 67,
    lat1: 8.6743068,
    lat2: 97.0505296,
    title:'Phang Nga ',
    snippet:'2 คน',
  ),
  Covid(
    id: 68,
    lat1: 7.4932415,
    lat2: 99.5215191,
    title:'Phatthalung ',
    snippet:'14 ตน',
  ),
  Covid(
    id: 69,
    lat1:7.8309258,
    lat2:98.0804233,
    title:'Phuket  ',
    snippet:'231 คน',
  ),
  Covid(
    id: 70,
    lat1: 10.04713,
    lat2: 98.0840896,
    title:'Ranong ',
    snippet:'1 คน',
  ),
  Covid(
    id: 71,
    lat1: 6.8169905,
    lat2: 98.5688577,
    title:'Satun ',
    snippet:'20 คน',
  ),
  Covid(
    id: 72,
    lat1: 7.115809,
    lat2:99.461344,
    title:'Songkhla  ',
    snippet:'136 คน',
  ),
  Covid(
    id: 73,
    lat1: 9.1713741,
    lat2: 98.640278,
    title:'Surat Thani  ',
    snippet:'30 คน',
  ),
  Covid(
    id: 74,
    lat1: 14.9950999,
    lat2: 103.1028153,
    title:'Buriram',
    snippet:'0 คน',
  ),
];