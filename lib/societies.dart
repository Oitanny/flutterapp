import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sideMenu.dart';
import 'society1.dart';
import 'centralSociety.dart';
import 'departmentalSociety.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Society extends StatefulWidget {
  _SocietyState createState() => _SocietyState();
}

class _SocietyState extends State<Society> {
  final pageViewController = PageController();

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Societies");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                ),
                onPressed: ()
                //showSearch(
                //context: context,
                // delegate to customize the search bar
                //delegate: CustomSearchDelegate());

                =>
                    Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: cusIcon,
        //     onPressed: () {
        //       {
        //         showSearch(
        //             context: context,
        //             // delegate to customize the search bar
        //             delegate: Search());
        //       }
        //
        //     },
        //   )
        // ],
        title: cusSearchBar,
        backgroundColor: Color(0xFF0091DE),
        centerTitle: true,
      ),
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn12',
        onPressed: () async {
          if(await canLaunchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"))) {
            await launchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"),mode: LaunchMode.externalApplication);
          } else {
            Fluttertoast.showToast(msg: "Launch Application not found");
          }
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/chatbot.jpg'), fit: BoxFit.fill),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg',
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Central Societies',
                                  style: TextStyle(
                                    color: Color(0xFF720972),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                new InkWell(
                                  child: new Text('More'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                centralSociety()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              addEvent("  Divinity\n  Society",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                              SizedBox(
                                width: 10.0,
                              ),
                              addEvent("   Cultural\n   Society",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                              SizedBox(
                                width: 10.0,
                              ),
                              addEvent("  Parindey",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                              SizedBox(
                                width: 10.0,
                              ),
                              addEvent("  Pratibimb",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Departmental Societies',
                                    style: TextStyle(
                                      color: Color(0xFF720972),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                new InkWell(
                                  child: new Text('More'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                departmentSociety()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              addEvent("  Kasak",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                              SizedBox(
                                width: 10.0,
                              ),
                              addEvent("  Polimates",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                              SizedBox(
                                width: 10.0,
                              ),
                              addEvent("  Statistika",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                              SizedBox(
                                width: 10.0,
                              ),
                              addEvent("  Invictus",
                                  "https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/7088/2019/6/1/Campus%20View%20of%20Mata%20Sundri%20College%20for%20Women%20New%20Delhi_Campus-View.jpg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class addEvent extends StatelessWidget {
  String Url;
  String heading;
  addEvent(this.heading, this.Url);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(

        child: Container(
          height: 170,
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                heading,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          decoration: new BoxDecoration(
            color: const Color(0x000000),
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              image: new NetworkImage(
                Url,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://docs.google.com/forms/d/e/1FAIpQLSfo8S2EKpNxXRhb4OmfULLTHZHF3rdSUhbtlBy6fdaRuX59Lg/viewform';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Search extends SearchDelegate<String> {
  String got = "";
  final socinclg = [
    "Divine Society",
    "Cultural Society",
    "Parindey",
    "Pratibimb",
    "Placement & Internship Cell",
    "Kasak",
    "Polimates",
    "Statistika",
    "Invictus"
  ];

  List<String> recentsrch = ["Statistika", "Invictus"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ]; //removes anything registered within the search bar
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on app bar on left side
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // when selected show results based on selections
    if (socinclg.indexOf(got) == 4) {
      //setState method before the build method had completed the process of building the widgets.
      //error occurs while showing widget before the completion of the build method,
      //so we use schedulerbinding
      Future.delayed(Duration.zero, () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Society1()),
        );
      });
    } else {
      return Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: (MediaQuery.of(context).size.width) - 20, //screen width -20
        child: Card(
            color: Colors.blue,
            child: Center(
              child: Text(got),
            )),
      );
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show relevant things when someone searches
    //-->query is a property that represents entered text by user
    final suggestionList = query.isEmpty
        ? recentsrch
        : socinclg
        .where((str) => str.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return new ListView.builder(
      itemBuilder: (context, index) => ListTile(
        //what happens when we click suggested search
          onTap: () {
            got = suggestionList[index];

            showResults(context);
          },
          leading: Icon(Icons.arrow_right),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.normal))
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
