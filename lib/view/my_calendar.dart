import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/event_detail_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../common_widgets/common.dart';
import '../utilities/colors.dart';
import '../utilities/string.dart';
import '../utilities/text_style.dart';
import 'more/My_Services/All_Services/all_services_tab/business_setup_tab.dart';
import 'more/My_Services/All_Services/all_services_tab/trademark_Tab.dart';

class MyCalender extends StatefulWidget {

  /// Creates the home page to display teh calendar widget.
   MyCalender({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCalenderState createState() => _MyCalenderState();
}

class _MyCalenderState extends State<MyCalender> {
  List<Tab> tabsCalender = [
    Tab(child: const Text("Calender").paddingSymmetric(horizontal: 20)),
    Tab(child: const Text("Events").paddingSymmetric(horizontal: 20)),
  ];
  List<Widget> tabsContent = [
    const Calender(),
    const Events(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Compliance Calender"),
        body: Hero(
          tag: CS.tag,
          child: DefaultTabController(
            length: tabsCalender.length,
            child: Scaffold(
              // appBar: AppBar(title: const Text("All Services")),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  PreferredSize(
                    preferredSize: const Size.fromHeight(30),
                    child: Container(
                      height: 40,
                      // color: colorFFFFFF,
                      child: TabBar(
                        indicatorColor: Colors.black,
                        isScrollable: true,
                        tabs: tabsCalender,
                        labelColor: colorFFFFFF,
                        indicator: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorPrimary),
                        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                        unselectedLabelColor: colorPrimary,
                        //labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: tabsContent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

  }



}


class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: MeetingDataSource(_getDataSource()),
            // by default the month appointment display mode set as Indicator, we can
            // change the display mode as appointment using the appointment display
            // mode property

            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          ),
        ),
      ],
    );
  }
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}


class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: ListView.builder(
            itemCount: 10+1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(index == 0)
                    Text("Calender 2022-23", style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 18),).paddingOnly(top: 10, left: 15, right: 15),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: colorFFFFFF, border: Border.all(color: colorPrimary, width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("INC-20A",style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 18)),
                        DottedLine(dashColor: colorPrimary,).paddingSymmetric(vertical: 15),
                        Text("INC-20A",style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 14)).paddingOnly(bottom: 10),
                        Row(
                          children: [

                            GestureDetector(
                                onTap: (){
                                  Get.to(()=>EventDetailScreen());
                                },
                                child: Text("Know More",style: themeData.textTheme.headline5?.copyWith(color: colorPrimary,decoration: TextDecoration.underline, fontSize: 15,),)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: colorPrimary),
                                child: Text("I'm Interested",style: themeData.textTheme.headline5?.copyWith(color: colorFFFFFF, fontSize: 15))),
                          ],
                        )

                      ],
                    ).paddingAll(10),
                  ).paddingOnly(top: 10, left: 15, right: 15),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
