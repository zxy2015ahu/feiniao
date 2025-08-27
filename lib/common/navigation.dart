import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/fragments/fragments.dart';
import 'package:fl_clash/models/models.dart';
import 'package:flutter/material.dart';

class Navigation {
  static Navigation? _instance;

  getItems({
    bool openLogs = false,
    bool hasProxies = false,
  }) {
    return [
      const NavigationItem(
        icon: Icon(Icons.space_dashboard),
        label: "dashboard",
        fragment: DashboardFragment(),
      ),
      NavigationItem(
        icon: const Icon(Icons.rocket),
        label: "proxies",
        fragment: const ProxiesFragment(),
        modes: hasProxies
            ? [NavigationItemMode.mobile, NavigationItemMode.desktop]
            : [],
      ),
      const NavigationItem(
        icon: Icon(Icons.folder),
        label: "profiles",
        fragment: ProfilesFragment(),
      ),
      NavigationItem(
        icon: const Icon(Icons.adb),
        label: "logs",
        fragment: const LogsFragment(),
        description: "logsDesc",
        modes: openLogs
            ? [NavigationItemMode.desktop, NavigationItemMode.more]
            : [],
      ),
      const NavigationItem(
        icon: Icon(Icons.construction),
        label: "tools",
        fragment: ToolsFragment(),
        modes: [NavigationItemMode.desktop, NavigationItemMode.mobile],
      ),
    ];
  }

  Navigation._internal();

  factory Navigation() {
    _instance ??= Navigation._internal();
    return _instance!;
  }
}

final navigation = Navigation();
