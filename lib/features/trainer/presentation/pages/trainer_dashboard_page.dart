import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_app_bar.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:flutter/material.dart';

class TrainerDashboardPage extends StatelessWidget {
  const TrainerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //App Bar
        CustomAppBar(name: 'Ovie Rahman', role: 'Trainer', badge: 'Wolf'),

        //Body
        SizedBox(
          height: context.screenHeight * 0.25,
          child: Stack(
            children: [
              //Container
              Container(
                width: context.screenWidth,
                height: context.screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: AppPallete.accent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(55, 33),
                    bottomRight: Radius.elliptical(55, 33),
                  ),
                ),
              ),

              Positioned(
                top: 33,
                left: 24,
                right: 24,
                child: CustomeSearchbar(),
              ),
            ],
          ),
        ),

        //rest of content
      ],
    );
  }
}
