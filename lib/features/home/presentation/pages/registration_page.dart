import 'package:amrita_ayurvedic_app/core/constants/app_assets.dart';
import 'package:amrita_ayurvedic_app/core/constants/home_constants.dart';
import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:amrita_ayurvedic_app/core/widgets/button_widget.dart';
import 'package:amrita_ayurvedic_app/core/widgets/subtitle_widget.dart';
import 'package:amrita_ayurvedic_app/core/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPage extends HookWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final whatsappController = useTextEditingController();
    final addressController = useTextEditingController();
    final locationController = useTextEditingController();
    final branchController = useTextEditingController();
    final totalamountController = useTextEditingController();
    final discountamountController = useTextEditingController();
    final theme = AppTheme.of(context);
    final constants = HomeConstants();
    final appAssets = AppAssetsConstants();

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Register"),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: theme.spaces.space_200),
                  child: SvgPicture.asset(appAssets.icNotification),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: theme.spaces.space_400),
                child: Column(
                  children: [
                    SubTitleWidget(
                      title: constants.txtName,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnterName,
                      controller: nameController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtNumber,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtWhatsappNumber,
                      controller: whatsappController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtAddress,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnterAddress,
                      controller: addressController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtLocation,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: '',
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                      controller: locationController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtBranch,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                      labelText: '',
                      controller: branchController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtTotalAmount,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: '',
                      controller: totalamountController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtDiscountAmount,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: '',
                      controller: discountamountController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_400,
                    ),
                  ],
                ),
              ),
            ),
            extendBody: true,
            bottomNavigationBar: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: ButtonWidget(
                  buttonName: constants.txtSave,
                  onPressed: () async {
                    // await context.read<PatientProvider>().addPatient(nameController.text, phone, whatsappController.text, addressController.text, locationController.text,totalamountController.text, discountAmount, payment, balanceAmount, advanceAmount, treatmentDate, treatmentTime)
                  }),
            )),
      ),
    );
  }
}
