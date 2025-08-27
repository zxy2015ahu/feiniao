import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../profiles/add_profile.dart';

class NetworkDetection extends StatefulWidget {
  const NetworkDetection({super.key});

  @override
  State<NetworkDetection> createState() => _NetworkDetectionState();
}

class _NetworkDetectionState extends State<NetworkDetection> {
  Widget _buildDescription(String? currentProxyName, int? delay) {
    if (currentProxyName == null) {
      return GestureDetector(
              onTap: () {
              // 当点击时执行的操作
               showExtendPage(
              context,
            body: AddProfile(
              context: context,
            ),
          title: "${appLocalizations.add}${appLocalizations.profile}",
    );
              },
            child: TooltipText(
        text: Text(
          appLocalizations.noProxyDesc,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
        );
      // return TooltipText(
      //   text: Text(
      //     appLocalizations.noProxyDesc,
      //     style: Theme.of(context).textTheme.titleMedium?.copyWith(
      //           color: Theme.of(context).colorScheme.secondary,
      //         ),
      //     overflow: TextOverflow.ellipsis,
      //   ),
      // );
    }
    if (delay == 0 || delay == null) {
      return const AspectRatio(
        aspectRatio: 1,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
        ),
      );
    }
    if (delay > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TooltipText(
            text: Text(
              "$delay",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: context.textTheme.titleLarge
                  ?.copyWith(
                    color: context.colorScheme.primary,
                  )
                  .toSoftBold(),
            ),
          ),
          const Flexible(
            child: SizedBox(
              width: 4,
            ),
          ),
          Flexible(
            flex: 0,
            child: Text(
              'ms',
              style: Theme.of(context).textTheme.bodyMedium?.toLight(),
            ),
          ),
        ],
      );
    }
    return Text(
      "Timeout",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.red,
          ),
    );
  }

  _updateCurrentDelay(
    String? currentProxyName,
    int? delay,
    bool isCurrent,
    bool isInit,
  ) {
    if (!isCurrent || currentProxyName == null || !isInit) return;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (delay == null) {
        context.appController.setDelay(
          Delay(
            name: currentProxyName,
            value: 0,
          ),
        );
        globalState.updateCurrentDelay(
          currentProxyName,
        );
      }
    });
  }

  _updateCurrentDelayContainer(Widget child) {
    return Selector3<AppState, Config, ClashConfig,
        UpdateCurrentDelaySelectorState>(
      selector: (_, appState, config, clashConfig) {
        final proxyName = appState.getCurrentProxyName(
          config.currentProxyName,
          clashConfig.mode,
        );
        return UpdateCurrentDelaySelectorState(
          isInit: appState.isInit,
          currentProxyName: proxyName,
          delay: appState.delayMap[proxyName],
          isCurrent: appState.currentLabel == 'dashboard',
        );
      },
      builder: (_, state, __) {
        _updateCurrentDelay(
          state.currentProxyName,
          state.delay,
          state.isCurrent,
          state.isInit,
        );
        return child;
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      info: Info(
        iconData: Icons.network_check,
        label: appLocalizations.networkDetection,
      ),
      child: _updateCurrentDelayContainer(
        Selector3<AppState, Config, ClashConfig, NetworkDetectionSelectorState>(
          selector: (_, appState, config, clashConfig) {
            final proxyName = appState.getCurrentProxyName(
              config.currentProxyName,
              clashConfig.mode,
            );
            return NetworkDetectionSelectorState(
              isInit: appState.isInit,
              currentProxyName: proxyName,
              delay: appState.delayMap[proxyName],
            );
          },
          builder: (_, state, __) {
            return Container(
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 0,
                    child: TooltipText(
                      text: Text(
                        state.currentProxyName ?? appLocalizations.noProxy,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style:
                        Theme.of(context).textTheme.titleMedium?.toSoftBold(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Container(
                      height: context.appController.measure.titleLargeHeight,
                      alignment: Alignment.centerLeft,
                      child: FadeBox(
                        child: _buildDescription(
                          state.currentProxyName,
                          state.delay,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
