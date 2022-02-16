import 'package:campus2/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:campus2/EventsDetail/model/event_list_model.dart';

class EventsList extends StatefulWidget {
  @override
  State<EventsList> createState() => _EventsList();
}

class _EventsList extends State<EventsList> {
  // var _eventsList = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _eventsList = Provider.of<EventListModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var _eventsList = Provider.of<EventListModel>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: Container(
          height: 70,
          padding: const EdgeInsets.only(left: 0, right: 0),
          decoration: BoxDecoration(
            color: activeGreenPrimary.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab1',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab2',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab3',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab4',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab5',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: activeGreenPrimary,
            ),
            child: Center(
                child: Text("Events",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, color: Colors.white))),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 10.0,
                ),
              ]),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    Text("Events",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                      height: 5,
                      width: 60,
                      color: Colors.green,
                    )
                  ]),
                  Text("Calendar",
                      style: GoogleFonts.poppins(color: Colors.black54)),
                  Text("Hosting",
                      style: GoogleFonts.poppins(color: Colors.black54))
                ],
              )),
          const SizedBox(height: 5),
          Expanded(
              child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 0),
            child: ListView.builder(
                itemCount: _eventsList.eventsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: Icon(Icons.list),
                      trailing: Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("List item $index"));
                }),
            // child: ListView(children: [
            //   Text("Upcoming Events",
            //       style: GoogleFonts.poppins(
            //           color: Colors.grey[800],
            //           fontSize: 12,
            //           fontWeight: FontWeight.w600)),
            //   const SizedBox(height: 10),
            // ]
          )),
        ],
      ),
    );
  }
}
