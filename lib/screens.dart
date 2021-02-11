import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'modal-screen.dart';
import 'package:flutter_app/color_filters.dart';


class MainScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const MainScreen(
      {Key key,
        this.menuScreenContext,
        this.onScreenHideButtonPressed,
        this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: SizedBox(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       child: Scaffold(
  //         backgroundColor: Colors.grey,
  //         body: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             Center(
  //               child: RaisedButton(
  //                 color: Colors.blue,
  //                 onPressed: () {
  //                   pushNewScreenWithRouteSettings(
  //                       context,
  //                       settings: RouteSettings(name: '/home'),
  //                       screen: MainScreen2(),
  //                       pageTransitionAnimation:
  //                       PageTransitionAnimation.fade
  //                   );
  //                 },
  //                 child: Text(
  //                   "Go to Second Screen -> -> ->",
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 60.0,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
class MyHomePage   extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            stretch: true,
            floating: true,

            pinned: true,

            onStretchTrigger: () {
              // Refresh the list, maybe?
              return;
            },
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://www.advpulse.com/wp-content/uploads/2020/03/Sjaak-Lucassen-North-Pole-Yamaha-R1-2.jpg', fit: BoxFit.cover),
              title: Text('Y1R Airoli'),
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [ //cards ref : https://github.com/JohannesMilke/card_example/blob/master/lib/main.dart

                buildImageInteractionCard(),
                buildImageInteractionCard(),
                buildImageInteractionCard(),
                buildImageInteractionCard(),
                buildImageInteractionCard(),
                buildImageInteractionCard(),
                buildImageInteractionCard(),
                // ColorBox(color: Colors.purple),
                // ColorBox(color: Colors.green),
                // ColorBox(color: Colors.orange),
                // ColorBox(color: Colors.yellow),
                // ColorBox(color: Colors.deepPurple),
                // ColorBox(color: Colors.teal),
                // ColorBox(color: Colors.lightGreen),
                // ColorBox(color: Colors.yellowAccent),
                // ColorBox(color: Colors.pink),
                // ColorBox(color: Colors.tealAccent),
                // ColorBox(color: Colors.amber),
                // ColorBox(color: Colors.cyan),
                // ColorBox(color: Colors.lime),
                // ColorBox(color: Colors.deepOrange),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget buildImageInteractionCard() => Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: Column(
    children: [
      Stack(
        children: [
          Ink.image(
            image: NetworkImage(
              'https://media.zigcdn.com/media/model/2020/Feb/mt-15-bs6_360x240.jpg',
            ),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            height: 240,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              'Yamaha R1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(16).copyWith(bottom: 0),
        child: Text(
          'Type : Sports Bike\n Brand : Yamaha \n  Price : 1000 Rs/Day \n Pick-up location : \n Sai Riddhi asdfj asdf asdf asd fasd fasd fad fasdf dsf ',

          style: TextStyle(fontSize: 16),
        ),
      ),

      ButtonBar(
        alignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: Text('Edit'),
            onPressed: () {},
          ),
          // FlatButton(
          //   child: Text('Sold Out'),
          //   onPressed: () {},
          // )
        ],
      )
    ],
  ),
);


class Name {
  String firstName;
  String lastName;

  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName: "Pawan", lastName: "Kumar"),
  Name(firstName: "Aakash", lastName: "Tewari"),
  Name(firstName: "Rohan", lastName: "Singh"),
];

Widget buildImageCard() => Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Ink.image(
        image: NetworkImage(
          'https://media.zigcdn.com/media/model/2020/Feb/mt-15-bs6_360x240.jpg',
        ),
        colorFilter: ColorFilters.greyscale,
        child: InkWell(
          onTap: () {},
        ),
        height: 240,
        fit: BoxFit.cover,
      ),
      Text(
        'Card With Splash',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ],
  ),
);
class ColorBox extends StatelessWidget {
  final Color color;

  const ColorBox({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
    );
  }
}

// class MainScreen extends StatelessWidget {
//   final BuildContext menuScreenContext;
//   final Function onScreenHideButtonPressed;
//   final bool hideStatus;
//   const MainScreen(
//       {Key key,
//         this.menuScreenContext,
//         this.onScreenHideButtonPressed,
//         this.hideStatus = false})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Scaffold(
//           backgroundColor: Colors.black,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 30.0, vertical: 20.0),
//                 child: TextField(
//                   decoration: InputDecoration(hintText: "Test Text Field"),
//                 ),
//               ),
//               Center(
//                 child: RaisedButton(
//                   color: Colors.blue,
//                   onPressed: () {
//                     pushNewScreenWithRouteSettings(
//                       context,
//                       settings: RouteSettings(name: '/home'),
//                       screen: MainScreen2(),
//                       pageTransitionAnimation:
//                       PageTransitionAnimation.fade
//                     );
//                   },
//                   child: Text(
//                     "Go to Second Screen ->",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: RaisedButton(
//                   color: Colors.deepOrange,
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       backgroundColor: Colors.white,
//                       useRootNavigator: true,
//                       builder: (context) => Center(
//                         child: RaisedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           color: Colors.blue,
//                           child: Text(
//                             "Exit",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Push bottom sheet on TOP of Nav Bar",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: RaisedButton(
//                   color: Colors.deepOrange,
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       backgroundColor: Colors.white,
//                       useRootNavigator: false,
//                       builder: (context) => Center(
//                         child: RaisedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           color: Colors.blue,
//                           child: Text(
//                             "Exit",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Push bottom sheet BEHIND the Nav Bar",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: RaisedButton(
//                   color: Colors.lime,
//                   onPressed: () {
//                     pushDynamicScreen(context,
//                         screen: SampleModalScreen(), withNavBar: true);
//                   },
//                   child: Text(
//                     "Push Dynamic/Modal Screen",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: RaisedButton(
//                   color: Colors.purpleAccent,
//                   onPressed: () {
//                     this.onScreenHideButtonPressed();
//                   },
//                   child: Text(
//                     this.hideStatus
//                         ? "Unhide Navigation Bar"
//                         : "Hide Navigation Bar",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: RaisedButton(
//                   color: Colors.red,
//                   onPressed: () {
//                     Navigator.of(this.menuScreenContext).pop();
//                   },
//                   child: Text(
//                     "<- Main Menu",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 60.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MainScreen2 extends StatelessWidget {
  const MainScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "No Orders Found",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MainScreen3 extends StatelessWidget {

  const MainScreen3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.deepOrangeAccent,

    body: ListView(

      padding: EdgeInsets.all(40),
      children: [
        SizedBox(height: 20.0),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),
        buildColoredCard(),  buildColoredCard(),  buildColoredCard(),  buildColoredCard(),  buildColoredCard(),  buildColoredCard(),  buildColoredCard(),  buildColoredCard(),
        SizedBox(height: 60.0),


      ],
    ),
  );
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.deepOrangeAccent,
  //     body: Container(
  //       child: Center(
  //         child: RaisedButton(
  //           color: Colors.transparent,
  //           child: Text(
  //             "No Notifications Found.",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}


Widget buildColoredCard() => Card(
  shadowColor: Colors.red,
  elevation: 8,
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.redAccent, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Welcome to GYVOR\'s support team of rental service owners. Let us discuss if you have any further queries.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ),
);


class MainScreen5 extends StatelessWidget {
  const MainScreen5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text(
              "Page not developed yet.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
class MainScreen4 extends StatelessWidget {
  //https://camposha.info/flutter-stepper-example/
  const MainScreen4({Key key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return CupertinoApp(
  //
  //     debugShowCheckedModeBanner: false,
  //     home: StepperPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Stepper',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          accentColor: Colors.red,
          primaryColor: Colors.red,
          primaryColorDark: Colors.red),
      home: StepScreen(
        title: '',
      ),
    );
  }

}
class StepScreen extends StatefulWidget {
  final String title;

  StepScreen({this.title});

  @override
  _StepScreenState createState() => _StepScreenState();




}
class _StepScreenState extends State<StepScreen> {


  int _currentStep = 0;
  static int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    body: new Stepper(
    type: StepperType.vertical,
    currentStep: _currentStep,
    onStepTapped: (int step) => setState(() => _currentStep = step),
    onStepContinue: _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
    onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
      steps: <Step>[
        new Step(
          title: new Text('Shipping'),
          content: new Text('This is the first step.'),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
        ),
        new Step(
          title: new Text('Payment'),
          content: new Text('This is the second step.'),
          isActive: _currentStep >= 0,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        new Step(
          title: new Text('Order'),
          content: new Text('This is the third step.'),
          isActive: _currentStep >= 0,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
        ),
      ],
    )
    );

  }


}

/*HomeScreen Code start*/
class HomeScreen extends StatelessWidget {
  HomeScreen(this.userName);

  String userName;

  @override
  Widget build(BuildContext context) {
    return
      new Stack(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Welcome,    ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20.0)),
                    new Row(
                      children: <Widget>[],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(userName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: new Center(
              child: new Opacity(
                  opacity: 0.5,
                  child: new Image.asset(
                    "assets/images/logo.png",
                  )),
            ),
          ),
        ],
      );
    // TODO: implement build
  }
}
//
// class StepperPage extends StatefulWidget {
//   @override
//   _StepperPageState createState() => _StepperPageState();
// }
//
// class _StepperPageState extends State<StepperPage> {
//   int currentStep = 0;
//   Color getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//
//     if (hexColor.length == 6) {
//       hexColor = 'FF' + hexColor;
//     }
//
//     return Color(int.parse(hexColor, radix: 16));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       backgroundColor: getColorFromHex("#f1c40f"),
//       child: SafeArea(
//         child: OrientationBuilder(
//           builder: (BuildContext context, Orientation orientation) {
//             switch (orientation) {
//               case Orientation.portrait:
//                 return _buildStepper(StepperType.vertical);
//               case Orientation.landscape:
//                 return _buildStepper(StepperType.horizontal);
//               default:
//                 throw UnimplementedError(orientation.toString());
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   // for steppers refer : https://camposha.info/flutter-stepper-example/
//   CupertinoStepper _buildStepper(StepperType type) {
//     final canCancel = currentStep > 0;
//     final canContinue = currentStep < 3;
//     return CupertinoStepper(
//       type: type,
//       currentStep: currentStep,
//       onStepTapped: (step) => setState(() => currentStep = step),
//       onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
//       onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
//       steps: [
//
//         _buildStep(
//             title: Text('Basic information'),
//             isActive: false,
//             // state: i == currentStep
//             //     ? StepState.editing
//             //     : i < currentStep ? StepState.complete : StepState.indexed,
//             state: StepState.indexed
//         ),
//         _buildStep(
//           title: Text('Error'),
//           state: StepState.error,
//         ),
//         _buildStep(
//           title: Text('Disabled'),
//           state: StepState.disabled,
//         )
//       ],
//     );
//   }
//
//   Step _buildStep({
//     @required Widget title,
//     StepState state = StepState.indexed,
//     bool isActive = false,
//   }) {
//     return Step(
//       title: title,
//       subtitle: Text('Subtitle'),
//       state: state,
//       isActive: isActive,
//       content: LimitedBox(
//         maxWidth: 300,
//         maxHeight: 300,
//         child: Container(color: CupertinoColors.systemGrey),
//       ),
//     );
//   }
// }