import 'package:flutter/material.dart';
import 'package:mscapp/studentIssues.dart';
import 'package:mscapp/tabsPage.dart';
import 'raise_issue.dart';
import 'societies.dart';
import 'publish_opportunity.dart';
import 'add-event.dart';
import 'delete-event.dart';
import 'update-event.dart';
import 'alumnirecordAdm.dart';
import 'NAlumniFormAdm.dart';
//import 'package:intl/intl.dart';

void main() => runApp(Options());

class Options extends StatelessWidget {
  final List<String> optList = [
    " Add an event",
    " Update an existing event",
    " Delete an event",
    " View Raised Issues",
    " View Alumni Records",
    " Notable Alumni Form"
  ];

  final List<Function> funList = [
    () => Addevent(),
    () => UpdateEvent(),
    () => DeleteEvent(),
    () => RaisedStudentIssues(),
    () => AlumniRecord(),
    () => NAlumni(),
  ];

  final List<Icon> icoList = [
    Icon(
      Icons.emoji_emotions,
      size: 30.0,
    ),
    Icon(
      Icons.assignment_rounded,
      size: 30.0,
    ),
    Icon(
      Icons.group,
      size: 30.0,
    ),
    Icon(
      Icons.warning,
      size: 30.0,
    ),
    Icon(
      Icons.account_box,
      size: 30.0,
    ),
    Icon(
      Icons.school,
      size: 30.0,
    ),
  ];

  final List<Color> colList = [
    Colors.purple.shade300,
    Colors.purple.shade400,
    Colors.purple.shade500,
    Colors.purple.shade600,
    Colors.purple.shade700,
    Colors.purple.shade800,
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => tabsPage(selectedIndex: 0)),
        );
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Options"),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tabsPage(selectedIndex: 0)),
                    );
                    //Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          body: Container(
            child: new ListView.builder(
                itemCount: optList.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildOptCard(context, index)),
          )),
    );
  }

//   Widget buildOptCard(BuildContext context, int index) {
//     final allopts = optList[index];
//     final allico = icoList[index];
//     final allcol = colList[index];
//     final allfun = funList[index];

//     return new Container(
//       margin: EdgeInsets.all(10.0),
//       child: GestureDetector(
//         onTap: () {
//           Future.delayed(Duration.zero, () async {
//             Navigator.push(
//               context,
//               new MaterialPageRoute(
//                 builder: (context) => allfun(),
//               ),
//             );
//           });
//         },
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20), // if you need this
//             side: BorderSide(
//               color: Colors.grey.withOpacity(0.4),
//               width: 2,
//             ),
//           ),
//           color: allcol,

//           //

//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 40.0, bottom: 40.0, right: 40.0, left: 20.0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 8.0,
//                     bottom: 4.0,
//                   ),
//                   child: Row(children: <Widget>[
//                     allico,
//                     Text(
//                       allopts.toString(),
//                       style: new TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Spacer(),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
  Widget buildOptCard(BuildContext context, int index) {
    final allopts = optList[index];
    final allico = icoList[index];
    final allcol = colList[index];
    final allfun = funList[index];

    return new Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => allfun(),
              ),
            );
          });
        },
        style: ElevatedButton.styleFrom(
          primary: allcol,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // <-- Radius
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
              top: 40.0, bottom: 40.0, right: 40.0, left: 10.0),
          child: Row(
            children: <Widget>[
              allico,
              Expanded(
                child: Text(
                  allopts.toString(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /*
      margin: EdgeInsets.all(10.0),
      child: Card(
        color: allcol,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40.0, right: 40.0, left: 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 4.0,
                ),
                child: Row(children: <Widget>[
                  allico,
                  Text(
                    allopts.toString(),
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ]),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
