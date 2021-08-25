import 'package:countdown_app/widgets/event/event_progress.dart';
import 'package:flutter/material.dart';
// import 'package:countdown_app/widgets/event/count_down.dart';
import 'package:countdown_app/constants/constants.dart';
import 'package:countdown_app/widgets/event/event.dart';

class CountDownPage extends StatelessWidget {
  final Event event;

  CountDownPage(this.event);

  Widget counter(String num, String unit, BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    print('MediaQuery:');
    double height = queryData.size.height;
    double width = queryData.size.width;

    return FittedBox(
      fit: BoxFit.fill,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '$num\t',
          style: TextStyle(
            // fontSize: 80,
            color: whiteTextColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: unit,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget counterblock(String num, String unit, BuildContext context) {
    return Expanded(
      // width: double.infinity,
      // margin: EdgeInsets.only(top: 40, left: 40),
      child: counter(num, unit, context),
    );
  }

  Widget topBar(MediaQueryData mqd) {
    double height = mqd.size.height;
    double width = mqd.size.width;

    return Container(
      height: height * 0.1,
      margin: EdgeInsets.only(top: height * 0.02, left: 10, right: 10, bottom: height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 14),
                    child: Icon(
                      IconData(event.eIconCodePoint, fontFamily: 'MaterialIcons'),
                      color: whiteTextColor,
                      size: width * 0.08,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        event.eTitle,
                        style: TextStyle(color: whiteTextColor, fontSize: width * 0.06),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Icon(Icons.fiber_manual_record_outlined, color: Color(event.eColor), size: width * 0.06),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    print('MediaQuery:');
    double height = queryData.size.height;
    double width = queryData.size.width;
    double mar = height / 40;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            topBar(queryData),
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       // Container(
            //       //   margin: EdgeInsets.only(bottom: 20),
            //       //   child: EventProgress(event: event),
            //       // ),
            //       LayoutBuilder(
            //         builder: (BuildContext context, BoxConstraints constraints) {
            //           print(constraints.maxHeight);
            //           return Container(
            //             height: constraints.maxHeight * 0.85,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 counterblock('20', 'D', context),
            //                 counterblock('04', 'H', context),
            //                 counterblock('08', 'M', context),
            //                 counterblock('05', 'S', context),
            //               ],
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      backgroundColor: backgroundBlack,
    );
  }
}
