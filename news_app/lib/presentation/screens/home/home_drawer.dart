import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/db/language.dart';
import 'package:news_app/presentation/widgets/gap.dart';
import 'package:news_app/presentation/widgets/theme_button.dart';

ValueNotifier<int> _buttonValue = ValueNotifier(0);

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        child: Container(
          width: (size.width * 3) / 4,
          // decoration: BoxDecoration(color: primary),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sm, horizontal: 15.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "News App",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Divider(),
                        ThemModeButton(),
                        Gap(H: 20.sm),
                        Text(
                          "Select Country",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Gap(H: 20.sm),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sm),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sm, vertical: 5.sm),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sm),
                                color: Theme.of(context)
                                    .cardColor
                                    .withOpacity(0.08)),
                            child: ValueListenableBuilder(
                                valueListenable: _buttonValue,
                                builder: (context, int val, _) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sm),
                                        title: Text(
                                          "UAE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 18.sm,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Radio<int>(
                                          groupValue: _buttonValue.value,
                                          value: 0,
                                          onChanged: ((value) async {
                                            await DbFunctions
                                                .saveCurrentLanguage(value!);
                                            log(langs[value]);
                                            Global.lang = langs[value];

                                            _buttonValue.value = value;
                                            _buttonValue.notifyListeners();
                                          }),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sm),
                                        title: Text(
                                          "USA",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 18.sm,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Radio<int>(
                                          groupValue: _buttonValue.value,
                                          value: 1,
                                          onChanged: ((value) async {
                                            await DbFunctions
                                                .saveCurrentLanguage(value!);
                                            log(langs[value]);
                                            Global.lang = langs[value];
                                            _buttonValue.value = value;
                                            _buttonValue.notifyListeners();
                                          }),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sm),
                                        title: Text(
                                          "INDIA",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 18.sm,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Radio<int>(
                                          groupValue: _buttonValue.value,
                                          value: 2,
                                          onChanged: ((value) async {
                                            await DbFunctions
                                                .saveCurrentLanguage(value!);
                                            log(langs[value]);

                                            Global.lang = langs[value];
                                            _buttonValue.value = value;
                                            _buttonValue.notifyListeners();
                                          }),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sm),
                                        title: Text(
                                          "UKRAINE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 18.sm,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Radio<int>(
                                          groupValue: _buttonValue.value,
                                          value: 3,
                                          onChanged: ((value) async {
                                            await DbFunctions
                                                .saveCurrentLanguage(value!);
                                            log(langs[value]);
                                            Global.lang = langs[value];

                                            _buttonValue.value = value;
                                            _buttonValue.notifyListeners();
                                          }),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sm),
                                        title: Text(
                                          "RUSSIA",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 18.sm,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Radio<int>(
                                          groupValue: _buttonValue.value,
                                          value: 4,
                                          onChanged: ((value) async {
                                            await DbFunctions
                                                .saveCurrentLanguage(value!);
                                            log(langs[value]);
                                            Global.lang = langs[value];
                                            _buttonValue.value = value;
                                            _buttonValue.notifyListeners();
                                          }),
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.sm),
                                        title: Text(
                                          "CANADA",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 18.sm,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Radio<int>(
                                          groupValue: _buttonValue.value,
                                          value: 5,
                                          onChanged: ((value) async {
                                            await DbFunctions
                                                .saveCurrentLanguage(value!);
                                            log(langs[value]);
                                            Global.lang = langs[value];
                                            _buttonValue.value = value;
                                            _buttonValue.notifyListeners();
                                          }),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class SelectCountryWidget extends StatelessWidget {
//   const SelectCountryWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       insetPadding: EdgeInsets.zero,
//       titlePadding: EdgeInsets.zero,
//       // contentPadding: EdgeInsets.zero,
//       buttonPadding: EdgeInsets.zero,
//       actionsPadding: EdgeInsets.zero,
//       content: Container(
//         height: (MediaQuery.of(context).size.height * 2) / 3,
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.sm),
//               child: Container(
//                 height: 40.sm,
//                 constraints: BoxConstraints(maxWidth: 200.sm, minWidth: 80.sm),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor.withOpacity(0.1),
//                     border: Border.all(
//                       color: Theme.of(context).cardColor,
//                       width: 0.5.sm,
//                     ),
//                     borderRadius: BorderRadius.circular(5.sm)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("UAE",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20.sm, fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.sm),
//               child: Container(
//                 height: 40.sm,
//                 constraints: BoxConstraints(maxWidth: 200.sm, minWidth: 80.sm),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor.withOpacity(0.1),
//                     border: Border.all(
//                       color: Theme.of(context).cardColor,
//                       width: 0.5.sm,
//                     ),
//                     borderRadius: BorderRadius.circular(5.sm)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("USA",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20.sm, fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.sm),
//               child: Container(
//                 height: 40.sm,
//                 constraints: BoxConstraints(maxWidth: 200.sm, minWidth: 80.sm),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor.withOpacity(0.1),
//                     border: Border.all(
//                       color: Theme.of(context).cardColor,
//                       width: 0.5.sm,
//                     ),
//                     borderRadius: BorderRadius.circular(5.sm)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("INDIA",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20.sm, fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.sm),
//               child: Container(
//                 height: 40.sm,
//                 constraints: BoxConstraints(maxWidth: 200.sm, minWidth: 80.sm),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor.withOpacity(0.1),
//                     border: Border.all(
//                       color: Theme.of(context).cardColor,
//                       width: 0.5.sm,
//                     ),
//                     borderRadius: BorderRadius.circular(5.sm)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("UKRAINE",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20.sm, fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.sm),
//               child: Container(
//                 height: 40.sm,
//                 constraints: BoxConstraints(maxWidth: 200.sm, minWidth: 80.sm),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor.withOpacity(0.1),
//                     border: Border.all(
//                       color: Theme.of(context).cardColor,
//                       width: 0.5.sm,
//                     ),
//                     borderRadius: BorderRadius.circular(5.sm)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Russia",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20.sm, fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 5.sm),
//               child: Container(
//                 height: 40.sm,
//                 constraints: BoxConstraints(maxWidth: 200.sm, minWidth: 80.sm),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor.withOpacity(0.1),
//                     border: Border.all(
//                       color: Theme.of(context).cardColor,
//                       width: 0.5.sm,
//                     ),
//                     borderRadius: BorderRadius.circular(5.sm)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("CANADA",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20.sm, fontWeight: FontWeight.w500)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
