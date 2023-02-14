import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'utils/date_utils.dart' as date_util;

class UpComingApointments extends StatefulWidget {
  const UpComingApointments({super.key});

  @override
  State<UpComingApointments> createState() => _UpComingApointmentsState();
}

class _UpComingApointmentsState extends State<UpComingApointments> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 500.h,
                width: 839.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/head.png"),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          2.w.widthBox,
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.blue,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    16.h.heightBox,
                    Wrap(
                      // alignment: WrapAlignment.center,
                      spacing: 20.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LeftSidePanel(),
                            RightSidePanel(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container RightSidePanel() {
    return Container(
      width: 200.w,
      // height: 300.h,
      child: Column(
        children: [
          Table(
              // border: TableBorder(
              //                  horizontalInside: BorderSide(color: Colors.blue.shade400),
              //                 right: BorderSide(color: Colors.blue.shade400)
              //               ),
              border: TableBorder.all(
                  borderRadius: BorderRadius.circular(8.r),
                  width: 2,
                  color: Color(0xffECEDF3)),
              children: [
                TableRow(children: [
                  TableCell(
                      child: Container(
                    width: 200.w,
                    height: 70.h,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8.r),
                    //     border: Border.all(
                    //       color: Colors.grey,
                    //     )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 37.h,
                          child: ListView.builder(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: currentMonthList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return dateTimeView(index);
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                ]),
                TableRow(children: [
                  tableEventContainer(),
                ]),
                TableRow(children: [
                  tableEventContainer(),
                ]),
                TableRow(children: [
                  tableEventContainer(),
                ]),
                TableRow(children: [
                  tableEventContainer(),
                ]),
              ]),
        ],
      ),
    );
  }

  Padding tableEventContainer() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            height: 49.h,
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Colors.blue)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: ListTile(
                minLeadingWidth: 3.w,
                focusColor: Colors.transparent,
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                minVerticalPadding: 0.0,
                contentPadding: EdgeInsets.only(top: 0.0),
                leading: Icon(Icons.mic_external_off),
                title: Text(
                  "New Store Product Campaign",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "Marketing",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Container(
                  width: 15.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/p.png"),
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                        size: 25.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding LeftSidePanel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Event",
            softWrap: true,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),

          // ListView(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   physics: ScrollPhysics(),
          //   children: [
          //     ClinetUpcomingEvent(),
          //     ClinetUpcomingEvent(),
          //     ClinetUpcomingEvent(),
          //     ClinetUpcomingEvent(),
          //     ClinetUpcomingEvent(),
          //   ],
          // ),

          ClinetUpcomingEvent(),
          ClinetUpcomingEvent(),
          ClinetUpcomingEvent(),
          ClinetUpcomingEvent(),
          ClinetUpcomingEvent(),
          ClinetUpcomingEvent(),
          // ClinetUpcomingEvent(),
        ],
      ),
    );
  }

  Container ClinetUpcomingEvent() {
    return Container(
      width: 120.w,
      child: ListTile(
        leading: Image.asset(
          "assets/C.PNG",
          height: 20.h,
        ),
        minLeadingWidth: 10,
        title: Text(
          "Client XY",
          softWrap: true,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        // contentPadding: EdgeInsets.all(0),
        // horizontalTitleGap: 0.0,
        trailing: Container(
          width: 25.w,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 20.h,
              width: 10.w,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(40.r)),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            // 10.w.widthBox,
            Icon(
              Icons.more_horiz,
              color: Colors.grey,
            )
          ]),
        ),
      ),
    );
  }

  Widget dateTimeView(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
          });
        },
        child: Container(
          width: 10.w,
          decoration: BoxDecoration(
              color: (currentMonthList[index].day != currentDateTime.day)
                  ? Colors.transparent
                  : Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: (currentMonthList[index].day != currentDateTime.day)
                    ? Colors.white
                    : Color(0xff51CBFF),
              )
              // gradient: LinearGradient(
              //     colors: (currentMonthList[index].day != currentDateTime.day)
              //         ? [
              //             Colors.white.withOpacity(0.8),
              //             Colors.white.withOpacity(0.7),
              //             Colors.white.withOpacity(0.6)
              //           ]
              //         : [
              //             HexColor("ED6184"),
              //             HexColor("EF315B"),
              //             HexColor("E2042D")
              //           ],
              //     begin: const FractionalOffset(0.0, 0.0),
              //     end: const FractionalOffset(0.0, 1.0),
              //     stops: const [0.0, 0.5, 1.0],
              //     tileMode: TileMode.clamp),
              // borderRadius: BorderRadius.circular(40),
              // boxShadow: const [
              //   BoxShadow(
              //     offset: Offset(4, 4),
              //     blurRadius: 4,
              //     spreadRadius: 2,
              //     color: Colors.black12,
              //   )]
              ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentMonthList[index].day.toString(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                  // color:
                  //     (currentMonthList[index].day != currentDateTime.day)
                  //         ? HexColor("465876")
                  //         : Colors.white),
                ),
                Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)
                    // color:
                    //     (currentMonthList[index].day != currentDateTime.day)
                    //         ? HexColor("465876")
                    //         : Colors.white),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
