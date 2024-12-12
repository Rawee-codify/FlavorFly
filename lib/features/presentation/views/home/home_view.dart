import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:flutter_template/core/utils/enums.dart';

import 'package:flutter_template/features/presentation/widgets/app_button.dart';
import 'package:flutter_template/features/presentation/widgets/app_button_outline.dart';
import 'package:flutter_template/features/presentation/widgets/app_text_field.dart';

import '../../../../core/utils/locales/locales.dart';

import '../../../../core/utils/themes/theme_bloc.dart';
import '../../../../core/utils/themes/theme_event.dart';
import '../../../../core/utils/themes/theme_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            AppButton(
              radius: 10,
              buttonText: LocaleData.test.getString(context),
              onTapButton: () {},
              buttonType: ButtonType.ENABLED,
            ),
            const SizedBox(
              height: 50,
            ),
            AppTextField(
              hintText: LocaleData.test.getString(context),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Light Theme",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  width: 10,
                ),
                BlocBuilder(
                    bloc: BlocProvider.of<ThemeBloc>(context),
                    builder: (context, ThemeState state) => Switch(
                        value: state.isDark,
                        onChanged: (val) {
                          BlocProvider.of<ThemeBloc>(context)
                              .add(UpdateThemeEvent(val));
                        })),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Dark Theme",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            AppButtonOutlined(
                radius: 10, buttonText: "outlined button", onTapButton: () {})
          ],
        ),
      ),
    );
  }
}
