import 'dart:async';

import 'package:fl_clash/common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class LogsFragment extends StatefulWidget {
  const LogsFragment({super.key});

  @override
  State<LogsFragment> createState() => _LogsFragmentState();
}

class _LogsFragmentState extends State<LogsFragment> {
  final logsNotifier = ValueNotifier<List<Log>>([]);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      logsNotifier.value = context.read<AppState>().logs;
      if (timer != null) {
        timer?.cancel();
        timer = null;
      }
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (mounted) {
          logsNotifier.value = context.read<AppState>().logs;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  _initActions() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final commonScaffoldState =
          context.findAncestorStateOfType<CommonScaffoldState>();
      commonScaffoldState?.actions = [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: LogsSearchDelegate(
                logs: logsNotifier.value.reversed.toList(),
              ),
            );
          },
          icon: const Icon(Icons.search),
        )
      ];
    });
  }

  _buildList() {
    return ValueListenableBuilder<List<Log>>(
      valueListenable: logsNotifier,
      builder: (_, List<Log> logs, __) {
        if (logs.isEmpty) {
          return NullStatus(
            label: appLocalizations.nullLogsDesc,
          );
        }
        logs = logs.reversed.toList();
        return ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: logs.length,
          itemBuilder: (BuildContext context, int index) {
            final log = logs[index];
            return LogItem(
              log: log,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 0,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AppState, bool?>(
      selector: (_, appState) =>
          appState.currentLabel == 'logs' ||
          context.isMobile && appState.currentLabel == "tools",
      builder: (_, isCurrent, child) {
        if (isCurrent == null || isCurrent) {
          _initActions();
        }
        return child!;
      },
      child: _buildList(),
    );
  }
}

class LogsSearchDelegate extends SearchDelegate {
  List<Log> logs = [];

  LogsSearchDelegate({
    required this.logs,
  });

  List<Log> get _results => logs
      .where(
        (log) =>
            (log.payload?.contains(query) ?? false) ||
            log.logLevel.name.contains(query),
      )
      .toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
            return;
          }
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _results.length,
      itemBuilder: (BuildContext context, int index) {
        final log = _results[index];
        return LogItem(
          log: log,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 0,
        );
      },
    );
  }
}

class LogItem extends StatelessWidget {
  final Log log;

  const LogItem({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SelectableText(log.payload ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: SelectableText(
              "${log.dateTime}",
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.colorScheme.primary),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: CommonChip(
              label: log.logLevel.name,
            ),
          ),
        ],
      ),
    );
  }
}
