// ignore_for_file: constant_identifier_names

enum GroupType { Selector, URLTest, Fallback }

extension GroupTypeExtension on GroupType {
  static List<String> get valueList => GroupType.values
      .map(
        (e) => e.toString().split(".").last,
      )
      .toList();

  static GroupType? getGroupType(String value) {
    final index = GroupTypeExtension.valueList.indexOf(value);
    if (index == -1) return null;
    return GroupType.values[index];
  }

  String get value => GroupTypeExtension.valueList[index];
}

enum UsedProxy { GLOBAL, DIRECT, REJECT }

extension UsedProxyExtension on UsedProxy {
  static List<String> get valueList => UsedProxy.values
      .map(
        (e) => e.toString().split(".").last,
      )
      .toList();

  String get value => UsedProxyExtension.valueList[index];
}

enum Mode { rule, global, direct }

enum LogLevel { debug, info, warning, error, silent }

enum TransportProtocol { udp, tcp }

enum TrafficUnit { B, KB, MB, GB, TB }

enum NavigationItemMode { mobile, desktop, more }

enum Network { tcp, udp }

enum ProxiesSortType { none, delay, name }

enum TunStack { gvisor, system, mixed }

enum AccessControlMode { acceptSelected, rejectSelected }

enum ProfileType { file, url }

enum ResultType { success, error }

enum MessageType { log, tun, delay, process }
