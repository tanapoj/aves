/// Generated File, Do not modify this file.
/// to generate, run: fvm flutter pub run aves:gen

Map<String,String> template = {
"view-blank.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

import 'package:aves/index.dart';
import 'package:flutter/material.dart';
import 'package:{{#projectName}}/app/index.dart' as app;
import '{{#class_name}}.logic.dart';

class {{#className}}View extends app.View<{{#className}}Logic> {
  const {{#className}}View({{#className}}Logic logic, {Key? key}) : super(logic, key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('placeholder for {{#className}}'),
    );
  }
}
""",
"model.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part '{{#class_name}}.g.dart';

//=========================================
// {{#className}}
//=========================================

@JsonSerializable(explicitToJson: true)
@immutable
class {{#className}} {

  // TODO: (1) add Model's Fields

  @JsonKey(name: 'example_field')
  final int? exampleField;

  // Do not modify this section

  factory {{#className}}.fromJson(Map<String, dynamic> json) => _\${{#className}}FromJson(json);

  Map<String, dynamic> toJson() => _\${{#className}}ToJson(this);

  // TODO: (2) generate Constructor, == and toString

  // TODO: (3) then run `flutter pub run aves build:model` or `fvm flutter pub run aves build:model`
}
""",
"view.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

import 'package:aves/index.dart';
import 'package:flutter/material.dart';
import 'package:{{#projectName}}/app/index.dart' as app;
import '{{#class_name}}.logic.dart';

class {{#className}}View extends app.View<{{#className}}Logic> {
  const {{#className}}View({{#className}}Logic logic, {Key? key}) : super(logic, key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('placeholder for {{#className}}'),
          \$watch(logic.\$counter, build: (_, int count) {
            return Text('count is \$count');
          }),
          ElevatedButton(
            onPressed: () {
              logic.increment();
            },
            child: const Text('increment'),
          ),
        ],
      ),
    );
  }
}
""",
"test.template": """class {{#className}}{
    int x = 0;
}""",
"logic-blank.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

import 'package:aves/index.dart';
import 'package:flutter/material.dart';
import 'package:{{#projectName}}/app/index.dart';
import '{{#class_name}}.view.dart';

class {{#className}}Logic extends ComponentLogic {
  @override
  String get name => '{{#class_name}}';

  {{#className}}Logic({
    Key? key,
    required Widget Function(ComponentLogic) builder,
  }) : super(key: key, builder: builder);

  factory {{#className}}Logic.build() {
    return {{#className}}Logic(
      builder: (logic) => {{#className}}View(logic as {{#className}}Logic),
    );
  }
}
""",
"logic.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

import 'package:aves/index.dart';
import 'package:flutter/material.dart';
import 'package:{{#projectName}}/app/index.dart';
import '{{#class_name}}.view.dart';

class {{#className}}Logic extends ComponentLogic {
  @override
  String get name => '{{#class_name}}';

  /// Class Parameters
  /// if you want to customize, add here, then add parameter to constructor and build
  final LifeCycleOwner? parent;

  {{#className}}Logic({
    Key? key,
    required Widget Function(ComponentLogic) builder,
    this.parent,
  }) : super(key: key, builder: builder);

  factory {{#className}}Logic.build({LifeCycleOwner? parent}) {
    return {{#className}}Logic(
      parent: parent,
      builder: (logic) => {{#className}}View(logic as {{#className}}Logic),
    );
  }

  /// Define LiveData
  late final LiveData<int> \$counter = LiveData(0).owner(this);
  late final LiveData<String?> \$nullable = LiveData<String?>(null).owner(this);

  /// LiveCycle Listener
  /// if no use, you can remove them

  @override
  onCreate() {
    super.onCreate();
    // TODO when page constructed
  }

  @override
  onInit() {
    super.onInit();
    // TODO when page start running
  }

  @override
  onResume() {
    super.onResume();
    // TODO when page resume after it paused
  }

  @override
  onPause() {
    // TODO when page leaving from display
    super.onPause();
  }

  @override
  onDispose() {
    // TODO when page destroy (end of running)
    super.onDispose();
  }

  /// Define action
  /// custom method, called by view
  increment() {
    \$counter.value++;
  }
}
""",
"init/build.yaml.template": """targets:
  \$default:
    builders:
      slang_build_runner:
        options:
          base_locale: en
          fallback_strategy: base_locale
          input_directory: assets/lang
          input_file_pattern: .lang.json
          output_directory: lib/config/lang
          # output_file_pattern: .g.dart # deprecated, use output_file_name
          output_file_name: translations.g.dart
          output_format: multiple_files #single_file
          locale_handling: true
          namespaces: false
          translate_var: slang_global_tt
          enum_name: AppLocale
          translation_class_visibility: public
          key_case: snake
          key_map_case: camel
          param_case: pascal
          string_interpolation: double_braces
          flat_map: false
          timestamp: true
          maps:
            - error.codes
            - category
            - iconNames
          pluralization:
            auto: cardinal
            cardinal:
              - someKey.apple
            ordinal:
              - someKey.place
          contexts:
            gender_context:
              enum:
                - male
                - female
              auto: false
              paths:
                - my.path.to.greet
          interfaces:
            PageData: onboarding.pages.*
            PageData2:
              paths:
                - my.path
                - cool.pages.*
              attributes:
                - String title
                - String? content""",
"init/main.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

import 'package:flutter/material.dart';
import 'package:bloc_builder/index.dart';
import 'package:{{#projectName}}/config/env/dev_mock.dart';
import 'package:{{#projectName}}/ui/main/startup.dart';
import 'package:{{#projectName}}/app/index.dart';
import 'package:{{#projectName}}/common/log.dart';
import 'package:{{#projectName}}/config/lang/translations.g.dart';

void main() {
  Environment env = DevMockEnvironment();

  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  sysLog.i('run app, using environment: \$env');

  runApp(MainApplication(
    env: env,
  ));
}

class MainApplication extends StatelessWidget {
  final Environment env;

  const MainApplication({
    Key? key,
    required this.env,
  }) : super(key: key);

  @override
  Widget build(BuildContext _context) {
    sysLog.i('build MainApplication');
    return App(
      env: env,
      child: Builder(
        builder: (BuildContext context) {
          sysLog.i('build AppProvider');
          var app = App.of(context);
          app.syncInit();
          return \$watch(
            app.\$state,
            build: (context, _) {

              /// Custom Code here...
              sysLog.i('build-render MaterialApp');
              return MaterialApp(
                title: app.env.appName,
                theme: app.ui.theme.themeData,
                home: StartupPage.build(),
              );
            },
          );
        },
      ),
    );
  }
}
""",
"init/ui/main/startup.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/ui/widgets/example_widget.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

class ExampleWidget {
}""",
"init/app/app_provider.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/app_translator.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/app_component.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/index.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/app_navigator.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/app_auth.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/environment.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/app/app_ui.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/.aves/aves_config.json.template": """{}""",
"init/common/helpers.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/common/extension/string.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/model/user.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/data/network/app_api.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/data/preference/app_pref.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
"init/data/db/database.template": """/// Project: {{#projectName}}
/// Author: {{#author}}
/// Created at: {{#createdAt}}

""",
};