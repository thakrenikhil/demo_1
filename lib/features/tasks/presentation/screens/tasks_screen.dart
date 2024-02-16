import 'package:clean_todo/features/tasks/presentation/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/appbar_image.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../preferences/presentation/widgets/change_language_button.dart';
import '../../../preferences/presentation/widgets/change_theme_button.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  static String get routePath => "/";

  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: getVerticalSize(60.00),
            leadingWidth: 45,
            leading: AppbarImage(
                height: getSize(30.00),
                width: getSize(30.00),
                svgPath: ImageConstant.imgMenu,
                onTap: () {},
                //=> scaffoldKey.currentState?.openDrawer(),
                margin: getMargin(left: 15, top: 15, bottom: 15)),
            title: Container(
                height: 27,
                width: 168,
                child: Image.asset("assets/images/logo_main_appbar.png")),
            centerTitle: true,
            // title: AppbarTitle(text: "lbl_indhanpay".tr),
            styleType: Style.bgFillYellow200),
        // AppBar(
        //   elevation: 0.0,
        //   title: Text(AppLocalizations.of(context)!.listTasksScreenTitle),
        //   actions: const [
        //     ChangeLanguageButton(),
        //     AppThemeButton(),
        //   ],
        // ),
        body: const TasksListView(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffffd78a),
          foregroundColor: Colors.black,
          onPressed: () => context.push(AddTaskScreen.routePath),
          child: const Icon(Iconsax.add),
        ),
      ),
    );
  }
}
