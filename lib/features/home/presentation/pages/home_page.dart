import 'package:amrita_ayurvedic_app/core/constants/app_assets.dart';
import 'package:amrita_ayurvedic_app/core/constants/home_constants.dart';
import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:amrita_ayurvedic_app/core/widgets/button_widget.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/pages/registration_page.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/provider/patient_provider.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final constants = HomeConstants();
    final appAssets = AppAssetsConstants();
    // final SearchController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: theme.spaces.space_100),
          child: Text(
            constants.txtHome,
            style: theme.typography.h600.copyWith(fontSize: 24),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: theme.spaces.space_200),
            child: SvgPicture.asset(appAssets.icNotification),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Searchfield
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: theme.spaces.space_300,
                  vertical: theme.spaces.space_50),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        // controller: SearchController,
                        decoration: InputDecoration(
                            fillColor: theme.colors.textInverse,
                            filled: true,
                            labelText: constants.txtSearchField,
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: theme.colors.textSubtle,
                            labelStyle:
                                TextStyle(color: theme.colors.textSubtle),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(theme.spaces.space_100),
                              borderSide: BorderSide(
                                color: theme.colors.textSubtle,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    theme.spaces.space_100),
                                borderSide: BorderSide(
                                    color: theme.colors.textSubtle))),
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colors.primary,
                            foregroundColor: theme.colors.secondary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () {},
                        child: Text("search")),
                  )
                ],
              ),
            ),
            // Sort by : part
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: theme.spaces.space_300,
                  vertical: theme.spaces.space_250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    constants.txtSortby,
                    style: theme.typography.h500,
                  ),
                  Container(
                    height: theme.spaces.space_400 * 1.2,
                    width: theme.spaces.space_300 * 6.8,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(theme.spaces.space_400),
                        border: Border.all(
                            color: theme.colors.textSubtle, width: 1.4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          constants.txtDate,
                          style: theme.typography.h500,
                        ),
                        SvgPicture.asset(appAssets.icArrowDownward)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: theme.colors.textSubtle,
              thickness: 1,
            ),
            // Listview widget
            Container(
              height: 620,
              child: FutureBuilder(
                  future: context.watch<PatientProvider>().patientsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListViewWidget(
                        entity: snapshot.data!,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colors.secondary),
                          onPressed: () {
                            context.read<PatientProvider>().getPatient();
                          },
                          child: const Text(
                            'cannot get,Retry',
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      ),
      // Register Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonWidget(
          buttonName: constants.txtRegister,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationPage(),
              ),
            );
          }),
    );
  }
}
























 // FutureBuilder(
            //   future: context.watch<PatientProvider>().getPatient(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return ListViewWidget(entity: snapshot.data!);
            //     } else if (snapshot.hasError) {
            //       return Center(
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: theme.colors.secondary),
            //           onPressed: () {
            //             context.read<PatientProvider>().getPatient();
            //           },
            //           child: const Text(
            //             'Retry',
            //           ),
            //         ),
            //       );
            //     }
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // )