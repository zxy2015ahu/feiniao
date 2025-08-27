import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ThemeModeItem {
  final ThemeMode themeMode;
  final IconData iconData;
  final String label;

  const ThemeModeItem({
    required this.themeMode,
    required this.iconData,
    required this.label,
  });
}

class ThemeFragment extends StatelessWidget {
  const ThemeFragment({super.key});

  Widget _themeModeCheckBox({
    required BuildContext context,
    bool? isSelected,
    required ThemeModeItem themeModeItem,
  }) {
    return CommonCard(
      isSelected: isSelected,
      onPressed: () {
        context.appController.config.themeMode = themeModeItem.themeMode;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Icon(themeModeItem.iconData),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                themeModeItem.label,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _primaryColorCheckBox({
    required BuildContext context,
    bool? isSelected,
    Color? color,
  }) {
    return ColorSchemeBox(
      isSelected: isSelected,
      primaryColor: color,
      onPressed: () {
        context.appController.config.primaryColor = color?.value;
      },
    );
  }

  Widget _itemCard({
    required BuildContext context,
    required Info info,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          InfoHeader(
            info: info,
          ),
          child,
        ],
      ),
    );
  }

  Widget _getThemeCard(BuildContext context) {
    List<ThemeModeItem> themeModeItems = [
      ThemeModeItem(
        iconData: Icons.auto_mode,
        label: appLocalizations.auto,
        themeMode: ThemeMode.system,
      ),
      ThemeModeItem(
        iconData: Icons.light_mode,
        label: appLocalizations.light,
        themeMode: ThemeMode.light,
      ),
      ThemeModeItem(
        iconData: Icons.dark_mode,
        label: appLocalizations.dark,
        themeMode: ThemeMode.dark,
      ),
    ];
    List<Color?> primaryColors = [
      null,
      appConstant.defaultPrimaryColor,
      Colors.pinkAccent,
      Colors.greenAccent,
      Colors.yellowAccent,
      Colors.purple
    ];
    return Column(
      children: [
        _itemCard(
          context: context,
          info: Info(
            label: appLocalizations.themeMode,
            iconData: Icons.brightness_high,
          ),
          child: Selector<Config, ThemeMode>(
            selector: (_, config) => config.themeMode,
            builder: (_, themeMode, __) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: themeModeItems.length,
                  itemBuilder: (_, index) {
                    final themeModeItem = themeModeItems[index];
                    return _themeModeCheckBox(
                      isSelected: themeMode == themeModeItem.themeMode,
                      context: context,
                      themeModeItem: themeModeItem,
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: 16,
                    );
                  },
                ),
              );
            },
          ),
        ),
        _itemCard(
          context: context,
          info: Info(
            label: appLocalizations.themeColor,
            iconData: Icons.palette,
          ),
          child: Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            height: 88,
            child: Selector<Config, int?>(
              selector: (_, config) => config.primaryColor,
              builder: (_, currentPrimaryColor, __) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final primaryColor = primaryColors[index];
                    return _primaryColorCheckBox(
                      context: context,
                      isSelected: currentPrimaryColor == primaryColor?.value,
                      color: primaryColor,
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: 16,
                    );
                  },
                  itemCount: primaryColors.length,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeCard = _getThemeCard(context);
    final previewCard = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CommonCard(
        info: Info(
          label: appLocalizations.preview,
          iconData: Icons.looks,
        ),
        child: Container(
          height: 200,
        ),
      ),
    );
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          previewCard,
          themeCard,
        ],
      ),
    );
  }
}
