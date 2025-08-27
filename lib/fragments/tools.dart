import 'dart:io';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/fragments/about.dart';
import 'package:fl_clash/fragments/access.dart';
import 'package:fl_clash/fragments/application_setting.dart';
import 'package:fl_clash/fragments/config.dart';
import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'theme.dart';

class ToolsFragment extends StatefulWidget {
  const ToolsFragment({super.key});

  @override
  State<ToolsFragment> createState() => _ToolboxFragmentState();
}

class _ToolboxFragmentState extends State<ToolsFragment> {
  _buildNavigationMenuItem(NavigationItem navigationItem) {
    return ListItem.open(
      leading: navigationItem.icon,
      title: Text(Intl.message(navigationItem.label)),
      subtitle: navigationItem.description != null
          ? Text(Intl.message(navigationItem.description!))
          : null,
      delegate: OpenDelegate(
        title: Intl.message(navigationItem.label),
        widget: navigationItem.fragment,
      ),
    );
  }

  Widget _buildNavigationMenu(List<NavigationItem> navigationItems) {
    return Column(
      children: [
        for (final navigationItem in navigationItems) ...[
          _buildNavigationMenuItem(navigationItem),
          navigationItems.last != navigationItem
              ? const Divider(
                  height: 0,
                )
              : Container(),
        ]
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required Widget content,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: content,
        )
      ],
    );
  }

  String _getLocaleString(Locale? locale) {
    if (locale == null) return appLocalizations.defaultText;
    return Intl.message(locale.toString());
  }

  Widget _getOtherList() {
    List<Widget> items = [
      ListItem.open(
        leading: const Icon(Icons.info),
        title: Text(appLocalizations.about),
        delegate: OpenDelegate(
          title: appLocalizations.about,
          widget: const AboutFragment(),
        ),
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items) ...[
          item,
          if (item != items.last)
            const Divider(
              height: 0,
            ),
        ]
      ],
    );
  }

  Widget _getSettingList() {
    List<Widget> items = [
      Selector<Config, String?>(
        selector: (_, config) => config.locale,
        builder: (_, localeString, __) {
          final subTitle = localeString ?? appLocalizations.defaultText;
          final currentLocale = Other.getLocaleForString(localeString);
          return ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(appLocalizations.language),
            subtitle: Text(Intl.message(subTitle)),
            onTap: () {
              globalState.showCommonDialog(
                child: AlertDialog(
                  title: Text(appLocalizations.language),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  content: SizedBox(
                    width: 250,
                    child: Wrap(
                      children: [
                        for (final locale in [
                          null,
                          ...AppLocalizations.delegate.supportedLocales
                        ])
                          ListItem.radio(
                            delegate: RadioDelegate<Locale?>(
                              value: locale,
                              groupValue: currentLocale,
                              onChanged: (Locale? value) {
                                final config = context.read<Config>();
                                config.locale = value?.toString();
                                Navigator.of(context).pop();
                              },
                            ),
                            title: Text(_getLocaleString(locale)),
                          )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      ListItem.open(
        leading: const Icon(Icons.style),
        title: Text(appLocalizations.theme),
        subtitle: Text(appLocalizations.themeDesc),
        delegate: OpenDelegate(
            title: appLocalizations.theme,
            widget: const ThemeFragment(),
            extendPageWidth: 360),
      ),
      if (Platform.isAndroid)
        ListItem.open(
          leading: const Icon(Icons.view_list),
          title: Text(appLocalizations.accessControl),
          subtitle: Text(appLocalizations.accessControlDesc),
          delegate: OpenDelegate(
            title: appLocalizations.appAccessControl,
            widget: const AccessFragment(),
          ),
        ),
      ListItem.open(
        leading: const Icon(Icons.edit),
        title: Text(appLocalizations.override),
        subtitle: Text(appLocalizations.overrideDesc),
        delegate: OpenDelegate(
          title: appLocalizations.override,
          widget: const ConfigFragment(),
        ),
      ),
      ListItem.open(
        leading: const Icon(Icons.settings_applications),
        title: Text(appLocalizations.application),
        subtitle: Text(appLocalizations.applicationDesc),
        delegate: OpenDelegate(
          title: appLocalizations.application,
          widget: const ApplicationSettingFragment(),
        ),
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items) ...[
          item,
          if (item != items.last)
            const Divider(
              height: 0,
            ),
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      LayoutBuilder(builder: (context, container) {
        final isMobile = context.isMobile;
        if (!isMobile) {
          return Container(
            margin: const EdgeInsets.only(top: 18),
          );
        }
        return Selector<AppState, List<NavigationItem>>(
          selector: (_, appState) => appState.navigationItems,
          builder: (_, navigationItems, __) {
            final moreNavigationItems = navigationItems
                .where(
                  (element) => element.modes.contains(NavigationItemMode.more),
                )
                .toList();
            if (moreNavigationItems.isEmpty) {
              return Container();
            }
            return _buildSection(
              title: appLocalizations.more,
              content: _buildNavigationMenu(moreNavigationItems),
            );
          },
        );
      }),
      _buildSection(
        title: appLocalizations.settings,
        content: _getSettingList(),
      ),
      _buildSection(
        title: appLocalizations.other,
        content: _getOtherList(),
      ),
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) => items[index],
    );
  }
}
