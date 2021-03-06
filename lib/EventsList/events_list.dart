import 'package:campus2/EventsDetail/events_details_widget.dart';
import 'package:campus2/ProfilePage/profile_page.dart';
import 'package:campus2/SignupScreen/model/user_model.dart';
import 'package:campus2/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:campus2/EventsDetail/model/event_list_model.dart';
import 'package:search_page/search_page.dart';


class EventsList extends StatefulWidget {
  const EventsList({Key? key}) : super(key: key);
  @override
  State<EventsList> createState() => _EventsList();
}

class _EventsList extends State<EventsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<EventListModel>(context, listen: false);
      provider.getEventsList();
      final userProvider = Provider.of<UserModel>(context, listen: false);
       userProvider.getUserData();

      // print('This is provider.event list ');
      // print(provider.eventsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventListModel>(context);
    // print(provider.eventsList);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<EventListModel>(context, listen: false);
      provider.getEventsList();
      // print('This is provider.event list ');
      // print(provider.eventsList);
    });
    return SafeArea(

        // top: true,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: activeGreenPrimary,
              title: Text('Events',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              actions: const [
                Icon(Icons.notifications_outlined, color: Colors.white),
                SizedBox(width: 5),
                Icon(Icons.near_me_outlined, color: Colors.white),
                SizedBox(width: 5),
                Icon(Icons.filter_alt_outlined, color: Colors.white)
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  const UserAccountsDrawerHeader(
                    accountName: Text("Ashish Rawat"),
                    accountEmail: Text("ashishrawat2911@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Ttem 1"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Item 2"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Profile Page"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const SettingsPage()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                  ),
                  ListTile(
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: bottomBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchBar(),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 0),
                  child: ListView(
                    children: [
                      for (Map<String, dynamic> event in provider.eventsList)
                        EventDetails(
                          imageUrl: event["image_url"],
                          eventName: event["event_name"],
                          subtitle: event["subtitle"],
                          date: event["event_date"],
                          place: event["place"],
                          totalInterested: event["total_interested"],
                          totalViews: event["total_views"],
                          organizerName: event["organizer_name"],
                          ticketPrice: event['ticket_price'],
                          totalTickets: event['total_tickets'],
                          dbReference: event['db_reference'],
                        ),
                      Visibility(
                          visible: provider.isLoading,
                          child: Column(children: const [
                            SizedBox(height: 30),
                            CircularProgressIndicator()
                          ])),
                      Visibility(
                          visible: provider.errMessage != null,
                          child: Column(children: [
                            const SizedBox(height: 30),
                            Text(provider.errMessage ?? "",
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                ))
                          ]))
                    ],
                  ),
                ))
              ],
            )));
  }

  Widget bottomBar() {
    return Container(
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
                  Icons.home,
                  color: Colors.white,
                ),
                Text('Home',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 12))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const AddNewEvent()));
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white70,
                    )),
                Text('Add New Event',
                    style: GoogleFonts.poppins(
                        color: Colors.white54, fontSize: 12))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.list_outlined,
                  color: Colors.white70,
                ),
                Text('Tab 3',
                    style: GoogleFonts.poppins(
                        color: Colors.white54, fontSize: 12))
              ],
            ),
          ],
        ));
  }

  Widget searchBar() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Search Events...",
                    contentPadding: const EdgeInsets.only(top: 30, left: 20),
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    )),
                    // onTap:() => showSearch(context: context, delegate: SearchPage<EventListModel>(builder: builder, filter: filter, items: ev)) ,
                    
                    ),
          )
        ],
      ),
    );
  }

  Widget topBar() {
    double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      Container(
          width: width,
          height: 100,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: activeGreenPrimary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // divider(),
              const Icon(Icons.menu, color: Colors.white),
              const SizedBox(width: 20),
              Text('Events',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.notifications_outlined, color: Colors.white),
                  SizedBox(width: 5),
                  Icon(Icons.near_me_outlined, color: Colors.white),
                  SizedBox(width: 5),
                  Icon(Icons.filter_alt_outlined, color: Colors.white)
                ],
              ))
            ],
          )),
      Container(
        height: 50,
        width: width,
        margin: const EdgeInsets.only(top: 70),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width - 40,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search Events...",
                      contentPadding: const EdgeInsets.only(top: 30, left: 20),
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                      ))),
            )
          ],
        ),
      )
    ]);
  }
}
