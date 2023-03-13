## Client app design system

### 1. Run this project

To run this project, it is necessary to run a few steps:

- run `flutter pub get` to download packages

```shell
flutter pub get
```

- run build runner to generate code

```shell
flutter packages pub run build_runner build --delete-conflicting-outputs
```

- After execute steps, enter in folder `playground` to run project executing this library
- run `flutter pub get` to download packages in playground
- to execute preview, run `flutter run` in playground

#### 1.1 Flutter FVM

This project uses FVM to manage flutter versions.

##### 1.1.1 Install FVM

[Official site](https://fvm.app/docs/getting_started/installation) to read documentation of FVM.

1. install using this command:

```bash
flutter pub global activate fvm
```

2. After installation, add this configuration in your vscode, see [documentation](https://fvm.app/docs/getting_started/configuration#vs-code)
3. Install flutter for current project using below command:

```bash
fvm install
```

### 2. To add new components in library

To add a new component, we must add it to the lib/components folder and decorate it with the decorator `@docWidget`, see this example bellow:

```dart
@docWidget
class CustomTypography extends StatelessWidget {}
```

after adding the component, it is necessary to run the `build_runner` command again, to generate the component documentation used in the playground.

Export the new component for use by others in the `client_app_design_system.dart` file.

```dart
library client_app_design_system;

export "components/custom_typography.dart";
export "components/new_component.dart";
```

#### 2.1 Viewing the created component

To show the newly created component we must add it to the `playground` project.

To add the new component to the playground project, it is necessary to create a new component in the `widgets` folder inside `playground/lib`, as follows:

```dart
final newComponentDoc = ElementPreview(
  document: NewComponentDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const NewComponentDocWidget(
			foo: "bar"
      ),
      description: 'A example of use for NewComponent',
    ),
   ],
);
```

After that, it is necessary to import the variable in the `playground/lib/main.dart` file

```dart
void main() {
  runApp(DocPreview(sections: [
    ElementsSection(
      title: 'Widgets',
      elements: [customTypographyDoc, newComponentDoc],
    )
  ]));
}
```

> to develop new projects, we use the convention of branches as being, the type of change being feat, fix, etc, followed by the name of the component being changed.
> Example: `feat/typography`

### 3. Using branches to develop new components

When creating a new component, it is necessary that the changes are merged into the `dev` branch, and later, the changes will be merged into the `master` branch, where a tag with the new version will be automatically created.

### 4. Using and configuring project using this library

#### 4.1 Typography

When adding this library to the project, it is important to configure the correct typography, for this the following code snippet must be used to import the correct fonts.

in pubspec.yaml, add this to your project:

```yaml
fonts:
  - family: plus_jakarta_sans
    fonts:
      - asset: packages/client_app_design_system/fonts/plus-Jakarta-Sans/PlusJakartaSans-Regular.ttf
        weight: 400
      - asset: packages/client_app_design_system/fonts/plus-Jakarta-Sans/PlusJakartaSans-Medium.ttf
        weight: 500
      - asset: packages/client_app_design_system/fonts/plus-Jakarta-Sans/PlusJakartaSans-SemiBold.ttf
        weight: 600
      - asset: packages/client_app_design_system/fonts/plus-Jakarta-Sans/PlusJakartaSans-Bold.ttf
        weight: 700
      - asset: packages/client_app_design_system/fonts/plus-Jakarta-Sans/PlusJakartaSans-ExtraBold.ttf
        weight: 800
```
