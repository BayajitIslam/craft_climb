import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/features/onboarding/domain/entities/role_entity.dart';

class RoleModel extends RoleEntity {
  RoleModel({
    required super.role,
    required super.title,
    required super.description,
    required super.image,
  });

  // Static roles list lives in the model (data concern)
  static final List<RoleModel> allRoles = [
    RoleModel(
      role: 'career_seeker',
      title: 'Career Seeker',
      description: AppStrings.findingJob,
      image: AppImages.onboardingCarrerSeeker,
    ),
    RoleModel(
      role: 'trade_person',
      title: 'Trade Person',
      description: AppStrings.letsRecruit,
      image: AppImages.onboardingTradePerson,
    ),
    RoleModel(
      role: 'employer',
      title: 'Employer',
      description: AppStrings.letsRecruit,
      image: AppImages.onboardingEmployer,
    ),
    RoleModel(
      role: 'trainer',
      title: 'Trainer',
      description: AppStrings.letsRecruit,
      image: AppImages.onboardingTrainer,
    ),
  ];
}
