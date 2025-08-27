import 'package:fl_clash/fragments/profiles/edit_profile.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:webview_all/webview_all.dart';

import 'add_profile.dart';

enum PopupMenuItemEnum { delete, edit }

enum ProfileActions {
  edit,
  update,
  delete,
}

class ProfilesFragment extends StatefulWidget {
  const ProfilesFragment({super.key});

  @override
  State<ProfilesFragment> createState() => _ProfilesFragmentState();
}

class _ProfilesFragmentState extends State<ProfilesFragment> {

  String _getLastUpdateTimeDifference(DateTime lastDateTime) {
    final currentDateTime = DateTime.now();
    final difference = currentDateTime.difference(lastDateTime);
    final days = difference.inDays;
    if (days >= 365) {
      return "${(days / 365).floor()} ${appLocalizations.years}${appLocalizations.ago}";
    }
    if (days >= 30) {
      return "${(days / 30).floor()} ${appLocalizations.months}${appLocalizations.ago}";
    }
    if (days >= 1) {
      return "$days ${appLocalizations.days}${appLocalizations.ago}";
    }
    final hours = difference.inHours;
    if (hours >= 1) {
      return "$hours ${appLocalizations.hours}${appLocalizations.ago}";
    }
    final minutes = difference.inMinutes;
    if (minutes >= 1) {
      return "$minutes ${appLocalizations.minutes}${appLocalizations.ago}";
    }
    return appLocalizations.just;
  }

  String _convertExpireTimeToShow(int? expire) {
    if (expire == null || expire <= 0) {
      return "Infinite";
    }
    DateTime currentTime = DateTime.now();
    int timestamp = currentTime.millisecondsSinceEpoch;
    if (expire > timestamp) {
      return "${appLocalizations.expired}";
    }
    final expireDate = DateTime.fromMillisecondsSinceEpoch(expire * 1000);
    String formattedDate = DateFormat('yyyy-MM-dd').format(expireDate);
    return formattedDate;
  }
  _handleDeleteProfile(String id) async {
    context.appController.deleteProfile(id);
  }

  _handleUpdateProfile(String id) async {
    context.findAncestorStateOfType<CommonScaffoldState>()?.loadingRun(
          () => context.appController.updateProfile(id),
        );
  }

  Widget _profileItem({
    required Profile profile,
    required String? groupValue,
    required void Function(String? value) onChanged,
  }) {
    String useShow;
    String totalShow;
    double progress;
    String expireShow;
    final userInfo = profile.userInfo;
    if (userInfo == null) {
      useShow = "Infinite";
      totalShow = "Infinite";
      expireShow = "Infinite";
      progress = 1;
    } else {
      final use = userInfo.upload + userInfo.download;
      final total = userInfo.total;
      final expire = userInfo.expire;
      useShow = TrafficValue(value: use).show;
      totalShow = TrafficValue(value: total).show;
      expireShow = _convertExpireTimeToShow(expire);
      progress = total == 0 ? 0.0 : use / total;
    }
    return ListItem.radio(
      horizontalTitleGap: 16,
      delegate: RadioDelegate<String?>(
        value: profile.id,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      trailing: CommonPopupMenu<ProfileActions>(
        items: [
          CommonPopupMenuItem(
            action: ProfileActions.edit,
            label: appLocalizations.edit,
            iconData: Icons.edit,
          ),
          if (profile.url != null)
            CommonPopupMenuItem(
              action: ProfileActions.update,
              label: appLocalizations.update,
              iconData: Icons.sync,
            ),
          CommonPopupMenuItem(
            action: ProfileActions.delete,
            label: appLocalizations.delete,
            iconData: Icons.delete,
          ),
        ],
        onSelected: (ProfileActions? action) async {
          switch (action) {
            case ProfileActions.edit:
              _handleShowEditExtendPage(profile);
              break;
            case ProfileActions.delete:
              _handleDeleteProfile(profile.id);
              break;
            case ProfileActions.update:
              _handleUpdateProfile(profile.id);
              break;
            case null:
              break;
          }
        },
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                  "$useShow / $totalShow",
                  style: Theme.of(context).textTheme.labelMedium?.toLight(),
                ),
                ),
                // Flexible(
                //   child: Text(
                //     profile.lastUpdateDate != null
                //         ? _getLastUpdateTimeDifference(profile.lastUpdateDate!)
                //         : '',
                //     style: Theme.of(context).textTheme.labelMedium?.toLight(),
                //   ),
                // ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: LinearProgressIndicator(
                minHeight: 6,
                value: progress,
              ),
            ),
          ),
          Flexible(
                  child: Text(
                    "${appLocalizations.youxiaoqi}：$expireShow",
                    style: Theme.of(context).textTheme.labelMedium?.toLight(),
                  ),
          ),
        ],
      ),
    );
  }

  _handleShowAddExtendPage() {
    showExtendPage(
      context,
      body: AddProfile(
        context: context,
      ),
      title: "${appLocalizations.add}${appLocalizations.profile}",
    );
  }

  _handleShowEditExtendPage(Profile profile) {
    showExtendPage(
      context,
      body: EditProfile(
        profile: profile.copyWith(),
        context: context,
      ),
      title: "${appLocalizations.edit}${appLocalizations.profile}",
    );
  }

  _buildGrid({
    required ProfilesSelectorState state,
    int crossAxisCount = 1,
  }) {
    return SingleChildScrollView(
      padding: crossAxisCount > 1
          ? const EdgeInsets.symmetric(horizontal: 16)
          : EdgeInsets.zero,
      child: Grid.baseGap(
        crossAxisCount: crossAxisCount,
        children: [
          for (final profile in state.profiles)
            GridItem(
              child: _profileItem(
                profile: profile,
                groupValue: state.currentProfileId,
                onChanged: context.appController.changeProfileDebounce,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatLayout(
      floatingWidget: Container(
        margin: const EdgeInsets.all(kFloatingActionButtonMargin),
        child: FloatingActionButton(
          heroTag: null,
          onPressed: _handleShowAddExtendPage,
          child: const Icon(Icons.add),
        ),
      ),
      child: Selector<Config, ProfilesSelectorState>(
        selector: (_, config) => ProfilesSelectorState(
          profiles: config.profiles,
          currentProfileId: config.currentProfileId,
        ),
        builder: (context, state, child) {
          if (state.profiles.isEmpty) {
            TextStyle blackStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black); //黑色样式
            TextStyle redStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red); //红色样式
              return GestureDetector(
              onTap: () {
              // 当点击时执行的操作
               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewPage(
                  url: 'https://dt.duanju668.com.cn/#/dashboard', // 传入的 URL
                  title: '购买套餐', // 传入的标题
                  onBack: () {
                    // 定义返回事件，返回到上一个页面
                    Navigator.pop(context);
                  },
                  onWebViewCreated: () {
                    // 定义网页开始加载事件
                    
                  },
                  onWebViewLoaded: () {
                    // 定义网页加载完成事件
                    
                  },
                  onWebViewProgress: (int progress) {
                    // 定义网页加载进度事件
                    
                  }
                ),
              ),
            );
              },
            child: RichText(
            text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text:"${appLocalizations.goumaiDesc}", style: blackStyle), //第1个片段，红色样式
              TextSpan(text:"${appLocalizations.goumaiNew}", style: redStyle), //第1个片段，黑色样式
            ],
          ),
          textAlign: TextAlign.center,
        ),
        );
          }
          return Align(
            alignment: Alignment.topCenter,
            child: SlotLayout(
              config: {
                Breakpoints.small: SlotLayout.from(
                  key: const Key('profiles_grid_small'),
                  builder: (_) => _buildGrid(
                    state: state,
                    crossAxisCount: 1,
                  ),
                ),
                Breakpoints.medium: SlotLayout.from(
                  key: const Key('profiles_grid_medium'),
                  builder: (_) => _buildGrid(
                    state: state,
                    crossAxisCount: 1,
                  ),
                ),
                Breakpoints.large: SlotLayout.from(
                  key: const Key('profiles_grid_large'),
                  builder: (_) => _buildGrid(
                    state: state,
                    crossAxisCount: 2,
                  ),
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
// 定义一个有状态的小部件，用于显示 WebView 页面
class WebViewPage extends StatefulWidget {
  final String url; // 网页的 URL
  final String title; // 网页的标题
  final VoidCallback onBack; // 返回事件的回调
  final VoidCallback onWebViewCreated; // 网页开始加载的回调
  final VoidCallback onWebViewLoaded; // 网页加载完成的回调
  final Function(int)? onWebViewProgress; // 网页加载进度的回调
 
  // 构造函数，初始化各个参数
  const WebViewPage({
    Key? key,
    required this.url,
    required this.title,
    required this.onBack,
    required this.onWebViewCreated,
    required this.onWebViewLoaded,
    this.onWebViewProgress,
  }) : super(key: key);
 
  @override
  _WebViewPageState createState() => _WebViewPageState();
}


 // 定义 WebViewPage 的状态类
class _WebViewPageState extends State<WebViewPage> {
 
  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    // 返回一个 Scaffold，包含一个 AppBar 和一个 WebViewWidget
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, textAlign: TextAlign.center), // 设置标题栏的标题
        centerTitle: true, // 标题居中
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 设置返回按钮的图标
          onPressed: widget.onBack, // 设置返回按钮的点击事件
        ),
      ),
      body: Webview(url: widget.url), // 显示 WebView
    );
  }
}