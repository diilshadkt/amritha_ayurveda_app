import 'package:amrita_ayurvedic_app/core/constants/app_assets.dart';
import 'package:amrita_ayurvedic_app/core/constants/home_constants.dart';
import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/entity/patient_entity.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/provider/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatelessWidget {
  final List<PatientEntity> entity;
  const ListViewWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final constants = HomeConstants();
    final appAssets = AppAssetsConstants();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.3,
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<PatientProvider>().getPatient();
        },
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: entity.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: theme.spaces.space_250,
                vertical: theme.spaces.space_150,
              ),
              child: Container(
                  height: theme.spaces.space_500 * 4,
                  decoration: BoxDecoration(
                      color: theme.colors.textInverse,
                      borderRadius:
                          BorderRadius.circular(theme.spaces.space_150)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: theme.spaces.space_200,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: theme.spaces.space_200),
                        child: Text(
                          "${index + 1}.  ${entity[index].name}",
                          // entity[index].user,
                          style: theme.typography.h500.copyWith(
                            fontSize: theme.spaces.space_250,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: theme.spaces.space_300 * 1.8),
                        child: Text(
                          entity[index]
                              .patientdetailsSet
                              .first
                              .treatmentName
                              .toString(),
                          // entity[index].address,
                          style: theme.typography.h400.copyWith(
                            fontSize: theme.spaces.space_250,
                            color: theme.colors.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: theme.spaces.space_150,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: theme.spaces.space_300 * 1.8),
                        child: Row(
                          children: [
                            SvgPicture.asset(appAssets.icCalendar,
                                width: theme.spaces.space_250,
                                // ignore: deprecated_member_use
                                color: theme.colors.textSubtlest),
                            SizedBox(
                              width: theme.spaces.space_100,
                            ),
                            Text(
                              " ${entity[index].dateNdTime!.day.toString()}-${entity[index].dateNdTime!.month.toString()}-${entity[index].dateNdTime!.year.toString()}",
                              // entity[index].name,
                              style: theme.typography.h500.copyWith(
                                fontSize: theme.spaces.space_200,
                                color: theme.colors.textSubtle,
                              ),
                            ),
                            SizedBox(
                              width: theme.spaces.space_250,
                            ),
                            SvgPicture.asset(
                              appAssets.icUsers,
                              width: theme.spaces.space_250,
                              // ignore: deprecated_member_use
                              color: theme.colors.textSubtlest,
                            ),
                            SizedBox(
                              width: theme.spaces.space_100,
                            ),
                            Text(
                              "Jithesh",
                              // entity[index].name,
                              style: theme.typography.h500.copyWith(
                                fontSize: theme.spaces.space_200,
                                color: theme.colors.textSubtle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: theme.spaces.space_25,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: theme.spaces.space_300 * 1.8),
                        child: Row(
                          children: [
                            Text(
                              constants.txtViewBooking,
                              style: theme.typography.h400.copyWith(
                                fontSize: theme.spaces.space_200,
                              ),
                            ),
                            SizedBox(
                              width: theme.spaces.space_400 * 3.5,
                            ),
                            InkWell(
                              child: SvgPicture.asset(
                                appAssets.icArrowForward,
                                width: theme.spaces.space_300,
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}


//  final patientData = snapshot.data!;