# Flutter Desktop : Clean and Modular Architecture

### Author : James Brel

### Contact : thecoder38@gmail.com
---

<img src="img/flutter.png" alt="logo" width="200" height="200">

---
## Architecture 
   the architecture of each feature is based on the clean architecture of Uncle Bob which is constituted mainly of 3 layers :
   - Data
   - Domain
   - States Holder

```
📦features
 ┗ 📂fetch_hello_world
 ┃ ┣ 📂states_holder
 ┃ ┣ 📂data
 ┃ ┗ 📂domain
```

## General Folder Structure Tree 
```
📦project
 ┣ 📂.env
 ┃ ┣ 📜dev.json
 ┃ ┣ 📜prod.json
 ┃ ┗ 📜staging.json
 ┣ 📂.vscode
 ┃ ┗ 📜launch.json
 ┣ 📂assets
 ┃ ┣ 📂fonts
 ┃ ┣ 📂images
 ┃ ┃ ┣ 📂jpg
 ┃ ┃ ┣ 📂png
 ┃ ┃ ┗ 📂svg
 ┃ ┣ 📂languages
 ┃ ┃ ┣ 📜en.json
 ┃ ┃ ┗ 📜fr.json
 ┃ ┗ 📜readme.md
 ┣ 📂integration_test
 ┃ ┗ 📂views
 ┃ ┃ ┣ 📂screens
 ┃ ┃ ┗ 📂widgets
 ┣ 📂lib
 ┃ ┣ 📂src
 ┃ ┃ ┣ 📂core
 ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┣ 📂injectors_config
 ┃ ┃ ┃ ┃ ┃ ┣ 📜injector.config.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📜injector.dart
 ┃ ┃ ┃ ┃ ┣ 📂language_config
 ┃ ┃ ┃ ┃ ┃ ┣ 📜translations_delegate.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📜translator.dart
 ┃ ┃ ┃ ┃ ┗ 📂windows_config
 ┃ ┃ ┃ ┃ ┃ ┗ 📜window_config.dart
 ┃ ┃ ┃ ┣ 📂router
 ┃ ┃ ┃ ┃ ┣ 📜auto_routes.dart
 ┃ ┃ ┃ ┃ ┗ 📜auto_routes.gr.dart
 ┃ ┃ ┃ ┣ 📂themes
 ┃ ┃ ┃ ┃ ┣ 📜dark_theme.dart
 ┃ ┃ ┃ ┃ ┗ 📜light_theme.dart
 ┃ ┃ ┃ ┗ 📜init.dart
 ┃ ┃ ┣ 📂modules
 ┃ ┃ ┃ ┗ 📂hello_world_mod
 ┃ ┃ ┃ ┃ ┣ 📂features
 ┃ ┃ ┃ ┃ ┃ ┗ 📂fetch_hello_world
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂local_source
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂absts
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜say_the_hello_world_abst.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂impls
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜say_the_hello_world_impl.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂models
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂remote_source
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂absts
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂impls
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂models
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂reposit_impls
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜the_system_say_hello_world_reposit_impl.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂entities
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂reposit_absts
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜the_system_say_hello_world_reposit_abst.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂usecases
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜system_say_hello_world_usecase.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂states_holder
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂hello_world_bloc
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hello_world_bloc.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hello_world_event.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜hello_world_state.dart
 ┃ ┃ ┃ ┃ ┗ 📂ui
 ┃ ┃ ┃ ┃ ┃ ┣ 📂screens
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜welcome_screen.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂widgets
 ┃ ┃ ┗ 📂shared
 ┃ ┃ ┃ ┣ 📂constants
 ┃ ┃ ┃ ┃ ┣ 📜colors_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜double_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜envs_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜int_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜lang_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜pngs_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜routes_const.dart
 ┃ ┃ ┃ ┃ ┣ 📜string_const.dart
 ┃ ┃ ┃ ┃ ┗ 📜svgs_const.dart
 ┃ ┃ ┃ ┣ 📂extensions
 ┃ ┃ ┃ ┣ 📂global
 ┃ ┃ ┃ ┃ ┗ 📜string_variable.dart
 ┃ ┃ ┃ ┣ 📂helpers
 ┃ ┃ ┃ ┣ 📂services
 ┃ ┃ ┃ ┃ ┣ 📂cache
 ┃ ┃ ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜cache_instance.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜shared_preference_enum.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂shared_preference_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜shared_delete_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜shared_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜shared_put_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂shared_preference_streaming_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜stream_delete_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜stream_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜stream_put_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂storage_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜storage_delete_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜storage_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜storage_put_request.dart
 ┃ ┃ ┃ ┃ ┣ 📂connection
 ┃ ┃ ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜connection_instance.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜connection_checker_request.dart
 ┃ ┃ ┃ ┃ ┣ 📂firebase
 ┃ ┃ ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜firebase_config.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜firebase_instance.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂database
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜user_model.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂options
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dev
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜firebase_emulators_dev.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜firebase_options_dev.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂staging
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜firebase_options_staging.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂analytics_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜analytic_get_event_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜analytic_observer_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂auth_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜phone_auth_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firebase_storage_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜firebase_storage_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜firebase_storage_post_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂firestore_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜firestore_delete_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜firestore_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜firestore_post_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜firestore_update_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂firestore_stream_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜firestore_stream_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂utils
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜convert_util.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜root_util.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜status_util.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜string_util.dart
 ┃ ┃ ┃ ┃ ┣ 📂http
 ┃ ┃ ┃ ┃ ┃ ┣ 📂apis
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜name_of_api.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜http_overrides_helper.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜http_delete_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜http_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜http_post_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜http_update_request.dart
 ┃ ┃ ┃ ┃ ┣ 📂image
 ┃ ┃ ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜image_instance.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂messages
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜note_message.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜image_camera_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜image_compress_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜image_copper_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜image_gallery_request.dart
 ┃ ┃ ┃ ┃ ┣ 📂isar
 ┃ ┃ ┃ ┃ ┃ ┣ 📂configs
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜isar_config.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜isar_instance.dart
 ┃ ┃ ┃ ┃ ┃ ┣ 📂database
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂user_models
 ┃ ┃ ┃ ┃ ┃ ┣ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂isar_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜isar_delete_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜isar_get_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜isar_post_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜isar_update_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂isar_stream_requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜isar_get_stream_request.dart
 ┃ ┃ ┃ ┃ ┃ ┗ 📂utils
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜statuts_util.dart
 ┃ ┃ ┃ ┃ ┗ 📂security
 ┃ ┃ ┃ ┃ ┃ ┗ 📂requests
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜decrypt_request.dart
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜encrypt_request.dart
 ┃ ┃ ┃ ┗ 📂ui
 ┃ ┃ ┃ ┃ ┣ 📂screens
 ┃ ┃ ┃ ┃ ┗ 📂widgets
 ┃ ┗ 📜main.dart
 ┣ 📂test
 ┣ 📜.gitignore
 ┣ 📜analysis_options.yaml
 ┗ 📜flutter_native_splash.yaml
```

## Usage and Configuration

Once you have created your application or flutter project, you clone the architecture from Github, to start on a good basis

Note: 
the predefined files, such as welcome.dart in the front end and other folders, as well as example_test file, are only files that will allow you to be on the right track and to get a good understanding of the architecture.

 - <span style="color:yellow">step_1</span>: Installation of pre_packages
    Inside the pubspec.yaml file, you must integrate firstly the following packages : 

   ```yaml
   -----------StartUp Packages------------
   flutter_localizations:
      sdk: flutter
   intl: ^0.18.0
   flutter_native_splash: ^2.3.2
   flutter_screenutil: ^5.9.0
   window_manager: ^0.3.7
   auto_route: ^7.8.4
   flutter_svg: ^2.0.7
   equatable: ^2.0.5
   get_it: ^7.6.2
   injectable: ^2.3.2
   flutter_secure_storage: ^9.0.0
   shared_preferences: ^2.2.1
   connectivity_plus: ^5.0.1
   internet_connection_checker: ^1.0.0+1
   streaming_shared_preferences: ^2.0.0
   ----------------------------
   flutter_bloc: ^8.1.3
   bloc: ^8.1.2
   fluttertoast: ^8.2.2
   multiple_result: ^5.1.0
   ----------------------------
   firebase_core: ^2.15.0
   firebase_app_check: ^0.1.5+2
   firebase_auth: ^4.7.2
   cloud_firestore: ^4.8.4
   firebase_storage: ^11.2.5
   firebase_messaging: ^14.6.5
   firebase_crashlytics: ^3.3.5
   firebase_analytics: ^10.4.5
   cloud_functions: ^4.4.0
   http: ^1.1.0
   ----------------------------
   image_picker: ^1.0.0
   flutter_native_image: ^0.0.6+1
   image_cropper: ^5.0.0
   cached_network_image: ^3.2.3
   ----------------------------
   url_launcher: ^6.1.14
   pin_code_fields: ^8.0.1
   intl_phone_number_input: ^0.7.3+1
   font_awesome_flutter: ^10.5.0
   isar: ^3.1.0+1
   isar_flutter_libs: ^3.1.0+1
   permission_handler: ^10.2.0
   ```
 - <span style="color:yellow">step_1</span>: Installation of dev_package
    Inside the pubspec.yaml file, you must integrate firstly the following packages :

   ```yaml
   auto_route_generator: ^7.3.2
   injectable_generator: ^2.4.1
   isar_generator: ^3.1.0+1
   build_runner: ^2.4.6
   bloc_test: ^9.1.1
   mocktail: ^0.3.0
   integration_test:
      sdk: flutter
   ```
    
    these packages will allow you to easily activate the various files imported into the architecture.
    then, you just have to follow, the readme.md in the folder **assets**

- <span style="color:yellow">step_2</span>: Integration of the architecture
   once in the mvc architecture folder, you copy all its content to paste it in your project.


---
<p style="text-align: center"> Copyright &copy; 2024 James Brel All Rights Reserved</p>
