import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/auth/presentation/pages/login_and_signup_page.dart';
import 'package:craft_climb/features/onboarding/data/models/role_model.dart';
import 'package:craft_climb/features/onboarding/presentation/bloc/role_bloc.dart';

import 'package:craft_climb/features/onboarding/presentation/widgets/role_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionPage extends StatelessWidget {
  static final MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => const RoleSelectionPage(),
  );

  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoleBloc, RoleState>(
      listener: (context, state) {
        if (state is RoleSuccess) {
          Navigator.pushReplacement(
            context,
            LoginAndSignupPage.routeWith(initialTab: 0),
          );
        }
        if (state is RoleError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: AppBg(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: context.spacing32),
                Image.asset(AppImages.appLogo, width: 200),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.continueAs, style: AppTextStyle.s24w7i()),
                      Text(
                        AppStrings.tellUsWhoYouAre,
                        style: AppTextStyle.s14w4i(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: BlocBuilder<RoleBloc, RoleState>(
                    builder: (context, state) {
                      final selectedIndex = switch (state) {
                        RoleLoaded s => s.selectedIndex,
                        RoleSuccess s => s.selectedIndex,
                        _ => null,
                      };

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: RoleModel.allRoles.length,
                        itemBuilder: (context, index) {
                          final role = RoleModel.allRoles[index];
                          return RoleOptionCard(
                            role: role.role,
                            title: role.title,
                            description: role.description,
                            image: role.image,
                            isRoleSelected: selectedIndex == index,
                            onTap: () => context.read<RoleBloc>().add(
                              RoleSelectedEvent(index),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
