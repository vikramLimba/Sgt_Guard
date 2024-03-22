import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_login/Login.dart';
import 'package:form_login/styles/colors.dart';
import 'package:form_login/shared/routes/routes.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const LoginForm());
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SGT Owner',
          theme: ThemeData(primarySwatch: AppColors.kThemeColor),
          initialRoute: "/",
          defaultTransition: Transition.cupertino,
          getPages: RouteClass.routes,
          home: const Login(),
          builder: EasyLoading.init(),
        );

        //  MaterialApp(
        //   theme: ThemeData(),
        //   debugShowCheckedModeBanner: false,
        //   home: Scaffold(
        //     appBar: AppBar(
        //       toolbarHeight: 10,
        //     ),
        //     body: const Login(),
        //   ),
        // );
      },
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           child: Text('Add entries'),
//           onPressed: () async {
//             List<PersonEntry> persons = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SOF(),
//               ),
//             );
//             if (persons != null) persons.forEach(print);
//           },
//         ),
//       ),
//     );
//   }
// }

// class SOF extends StatefulWidget {
//   @override
//   _SOFState createState() => _SOFState();
// }

// class _SOFState extends State<SOF> {
//   var nameTECs = <TextEditingController>[];
//   var ageTECs = <TextEditingController>[];
//   var jobTECs = <TextEditingController>[];
//   var cards = <Card>[];

//   Card createCard() {
//     var nameController = TextEditingController();
//     var ageController = TextEditingController();
//     var jobController = TextEditingController();
//     nameTECs.add(nameController);
//     ageTECs.add(ageController);
//     jobTECs.add(jobController);
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('Person ${cards.length + 1}'),
//           TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Full Name')),
//           TextField(
//               controller: ageController,
//               decoration: InputDecoration(labelText: 'Age')),
//           TextField(
//               controller: jobController,
//               decoration: InputDecoration(labelText: 'Study/ job')),
//         ],
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     cards.add(createCard());
//   }

//   _onDone() {
//     List<PersonEntry> entries = [];
//     for (int i = 0; i < cards.length; i++) {
//       var name = nameTECs[i].text;
//       var age = ageTECs[i].text;
//       var job = jobTECs[i].text;
//       entries.add(PersonEntry(name, age, job));
//     }
//     Navigator.pop(context, entries);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: cards.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return cards[index];
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextButton(
//               child: Text('add new'),
//               onPressed: () => setState(() => cards.add(createCard())),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton:
//           FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
//     );
//   }
// }

// class PersonEntry {
//   final String name;
//   final String age;
//   final String studyJob;

//   PersonEntry(this.name, this.age, this.studyJob);
//   @override
//   String toString() {
//     return 'Person: name= $name, age= $age, study job= $studyJob';
//   }
// }

