# Craft Climb

CraftClimb is an AI-powered mobile platform connecting the construction & trade industry. Employers post jobs, career seekers apply, trainers publish courses, and trade workers grow — all in one app with chat, forum & tools marketplace.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# CraftClimb — Flutter Clean Architecture Folder Structure

```
lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── app_assets.dart
│   │   └── app_dimensions.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── api_endpoints.dart
│   │   └── network_info.dart
│   ├── router/
│   │   ├── app_router.dart
│   │   └── route_names.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── text_styles.dart
│   │   └── app_icons.dart
│   ├── usecases/
│   │   └── usecase.dart                  # Abstract base UseCase
│   └── utils/
│       ├── validators.dart
│       ├── helpers.dart
│       └── extensions.dart
│
├── features/
│   │
│   ├── onboarding/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── onboarding_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── onboarding_model.dart
│   │   │   └── repositories/
│   │   │       └── onboarding_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── onboarding_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── onboarding_repository.dart
│   │   │   └── usecases/
│   │   │       └── get_onboarding_pages.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── onboarding_bloc.dart
│   │       │   ├── onboarding_event.dart
│   │       │   └── onboarding_state.dart
│   │       ├── pages/
│   │       │   ├── welcome_page.dart
│   │       │   └── onboarding_page.dart
│   │       └── widgets/
│   │           ├── onboarding_slide.dart
│   │           └── onboarding_indicator.dart
│   │
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_remote_datasource.dart
│   │   │   │   └── auth_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── sign_in_usecase.dart
│   │   │       ├── sign_up_usecase.dart
│   │   │       ├── forgot_password_usecase.dart
│   │   │       ├── verify_otp_usecase.dart
│   │   │       ├── reset_password_usecase.dart
│   │   │       └── sign_out_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── auth_bloc.dart
│   │       │   ├── auth_event.dart
│   │       │   └── auth_state.dart
│   │       ├── pages/
│   │       │   ├── sign_in_page.dart
│   │       │   ├── sign_up_page.dart
│   │       │   ├── forgot_password_page.dart
│   │       │   ├── otp_verification_page.dart
│   │       │   └── reset_password_page.dart
│   │       └── widgets/
│   │           ├── auth_text_field.dart
│   │           └── social_login_button.dart
│   │
│   ├── career_seeker/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── career_seeker_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── job_model.dart
│   │   │   │   ├── application_model.dart
│   │   │   │   └── resume_model.dart
│   │   │   └── repositories/
│   │   │       └── career_seeker_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── job_entity.dart
│   │   │   │   ├── application_entity.dart
│   │   │   │   └── resume_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── career_seeker_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_jobs_usecase.dart
│   │   │       ├── apply_for_job_usecase.dart
│   │   │       ├── get_my_applications_usecase.dart
│   │   │       ├── get_my_resume_usecase.dart
│   │   │       └── update_desire_profile_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── career_seeker_bloc.dart
│   │       │   ├── career_seeker_event.dart
│   │       │   └── career_seeker_state.dart
│   │       ├── pages/
│   │       │   ├── home_page.dart
│   │       │   ├── jobs_dashboard_page.dart
│   │       │   ├── job_detail_page.dart
│   │       │   ├── apply_job_page.dart
│   │       │   ├── my_applications_page.dart
│   │       │   ├── my_resume_page.dart
│   │       │   ├── certificates_page.dart
│   │       │   └── desire_profile_page.dart
│   │       └── widgets/
│   │           ├── job_card.dart
│   │           ├── application_card.dart
│   │           └── resume_section.dart
│   │
│   ├── employer/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── employer_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── job_post_model.dart
│   │   │   │   └── company_model.dart
│   │   │   └── repositories/
│   │   │       └── employer_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── job_post_entity.dart
│   │   │   │   └── company_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── employer_repository.dart
│   │   │   └── usecases/
│   │   │       ├── create_job_usecase.dart
│   │   │       ├── get_posted_jobs_usecase.dart
│   │   │       ├── update_company_profile_usecase.dart
│   │   │       └── get_job_applicants_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── employer_bloc.dart
│   │       │   ├── employer_event.dart
│   │       │   └── employer_state.dart
│   │       ├── pages/
│   │       │   ├── employer_home_page.dart
│   │       │   ├── create_job_page.dart
│   │       │   ├── jobs_dashboard_page.dart
│   │       │   ├── company_profile_page.dart
│   │       │   └── apply_trade_page.dart
│   │       └── widgets/
│   │           ├── job_post_card.dart
│   │           └── applicant_card.dart
│   │
│   ├── trainer/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── trainer_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── course_model.dart
│   │   │   │   └── module_model.dart
│   │   │   └── repositories/
│   │   │       └── trainer_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── course_entity.dart
│   │   │   │   └── module_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── trainer_repository.dart
│   │   │   └── usecases/
│   │   │       ├── create_course_usecase.dart
│   │   │       ├── get_my_courses_usecase.dart
│   │   │       ├── edit_course_usecase.dart
│   │   │       └── delete_course_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── trainer_bloc.dart
│   │       │   ├── trainer_event.dart
│   │       │   └── trainer_state.dart
│   │       ├── pages/
│   │       │   ├── trainer_home_page.dart
│   │       │   ├── my_courses_page.dart
│   │       │   ├── course_detail_page.dart
│   │       │   ├── create_course_page.dart
│   │       │   └── edit_course_page.dart
│   │       └── widgets/
│   │           ├── course_card.dart
│   │           └── module_tile.dart
│   │
│   ├── trade_person/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── trade_person_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── trade_profile_model.dart
│   │   │   └── repositories/
│   │   │       └── trade_person_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── trade_profile_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── trade_person_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_trade_jobs_usecase.dart
│   │   │       ├── update_trade_profile_usecase.dart
│   │   │       └── get_career_resources_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── trade_person_bloc.dart
│   │       │   ├── trade_person_event.dart
│   │       │   └── trade_person_state.dart
│   │       ├── pages/
│   │       │   ├── trade_home_page.dart
│   │       │   ├── trade_jobs_page.dart
│   │       │   ├── trade_job_detail_page.dart
│   │       │   └── career_resources_page.dart
│   │       └── widgets/
│   │           └── trade_job_card.dart
│   │
│   ├── courses/                          # Shared across Career Seeker & Trade Person
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── courses_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── course_model.dart
│   │   │   │   └── test_model.dart
│   │   │   └── repositories/
│   │   │       └── courses_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── course_entity.dart
│   │   │   │   └── test_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── courses_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_courses_usecase.dart
│   │   │       ├── enroll_course_usecase.dart
│   │   │       └── take_test_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── courses_bloc.dart
│   │       │   ├── courses_event.dart
│   │       │   └── courses_state.dart
│   │       ├── pages/
│   │       │   ├── courses_list_page.dart
│   │       │   ├── course_detail_page.dart
│   │       │   ├── video_learning_page.dart
│   │       │   └── test_page.dart
│   │       └── widgets/
│   │           ├── course_tile.dart
│   │           └── video_player_widget.dart
│   │
│   ├── forum/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── forum_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── post_model.dart
│   │   │   │   └── comment_model.dart
│   │   │   └── repositories/
│   │   │       └── forum_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── post_entity.dart
│   │   │   │   └── comment_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── forum_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_posts_usecase.dart
│   │   │       ├── create_post_usecase.dart
│   │   │       ├── like_post_usecase.dart
│   │   │       └── comment_on_post_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── forum_bloc.dart
│   │       │   ├── forum_event.dart
│   │       │   └── forum_state.dart
│   │       ├── pages/
│   │       │   ├── forum_page.dart
│   │       │   ├── create_post_page.dart
│   │       │   └── my_posts_page.dart
│   │       └── widgets/
│   │           ├── post_card.dart
│   │           └── comment_tile.dart
│   │
│   ├── tools/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── tools_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── product_model.dart
│   │   │   │   ├── cart_model.dart
│   │   │   │   └── order_model.dart
│   │   │   └── repositories/
│   │   │       └── tools_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── product_entity.dart
│   │   │   │   ├── cart_entity.dart
│   │   │   │   └── order_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── tools_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_products_usecase.dart
│   │   │       ├── add_to_cart_usecase.dart
│   │   │       ├── checkout_usecase.dart
│   │   │       └── get_my_orders_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── tools_bloc.dart
│   │       │   ├── tools_event.dart
│   │       │   └── tools_state.dart
│   │       ├── pages/
│   │       │   ├── tools_page.dart
│   │       │   ├── product_detail_page.dart
│   │       │   ├── cart_page.dart
│   │       │   ├── checkout_page.dart
│   │       │   └── my_orders_page.dart
│   │       └── widgets/
│   │           ├── product_card.dart
│   │           └── cart_item_tile.dart
│   │
│   ├── chat/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── chat_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── conversation_model.dart
│   │   │   │   └── message_model.dart
│   │   │   └── repositories/
│   │   │       └── chat_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── conversation_entity.dart
│   │   │   │   └── message_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── chat_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_conversations_usecase.dart
│   │   │       ├── send_message_usecase.dart
│   │   │       └── get_messages_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── chat_bloc.dart
│   │       │   ├── chat_event.dart
│   │       │   └── chat_state.dart
│   │       ├── pages/
│   │       │   ├── conversations_page.dart
│   │       │   └── chat_page.dart
│   │       └── widgets/
│   │           ├── conversation_tile.dart
│   │           ├── message_bubble.dart
│   │           └── chat_input_bar.dart
│   │
│   └── profile/                          # Shared profile settings across all roles
│       ├── data/
│       │   ├── datasources/
│       │   │   └── profile_remote_datasource.dart
│       │   ├── models/
│       │   │   └── profile_model.dart
│       │   └── repositories/
│       │       └── profile_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── profile_entity.dart
│       │   ├── repositories/
│       │   │   └── profile_repository.dart
│       │   └── usecases/
│       │       ├── get_profile_usecase.dart
│       │       ├── update_profile_usecase.dart
│       │       └── change_password_usecase.dart
│       └── presentation/
│           ├── bloc/
│           │   ├── profile_bloc.dart
│           │   ├── profile_event.dart
│           │   └── profile_state.dart
│           ├── pages/
│           │   ├── account_page.dart
│           │   ├── profile_page.dart
│           │   ├── profile_status_page.dart
│           │   ├── change_password_page.dart
│           │   ├── terms_conditions_page.dart
│           │   ├── privacy_policy_page.dart
│           │   └── faqs_page.dart
│           └── widgets/
│               ├── profile_avatar.dart
│               └── settings_tile.dart
│
└── injection_container.dart              # Dependency injection (get_it)
```

---

## Key Packages (pubspec.yaml)

```yaml
dependencies:
  flutter_bloc: ^8.x          # State management
  get_it: ^7.x                # Dependency injection
  dio: ^5.x                   # HTTP client
  equatable: ^2.x             # Value equality
  go_router: ^13.x            # Navigation
  hive_flutter: ^1.x          # Local storage
  shared_preferences: ^2.x    # Simple local storage
  dartz: ^0.10.x              # Functional programming (Either)
  flutter_secure_storage: ^9.x
  cached_network_image: ^3.x
  video_player: ^2.x
  image_picker: ^1.x
  firebase_core: ^2.x
  firebase_messaging: ^14.x   # Push notifications
```

---

## Clean Architecture Layer Rules

| Layer         | Can Depend On     | Cannot Depend On       |
|---------------|-------------------|------------------------|
| `domain`      | Nothing           | data, presentation     |
| `data`        | domain            | presentation           |
| `presentation`| domain            | data (directly)        |
| `core`        | Nothing           | features               |
