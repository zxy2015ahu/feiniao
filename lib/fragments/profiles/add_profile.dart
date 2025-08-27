import 'dart:io';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/pages/scan.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class AddProfile extends StatelessWidget {
  final BuildContext context;

  const AddProfile({super.key, required this.context});

  _handleAddProfileFormFile() async {
    context.appController.addProfileFormFile();
  }

  _handleAddProfileFormURL(String url) async {
    context.appController.addProfileFormURL(url);
  }

  _toScan() async {
    final url = await Navigator.of(context)
        .push<String>(MaterialPageRoute(builder: (_) => const ScanPage()));
    if (url != null) {
      _handleAddProfileFormURL(url);
    }
  }

  _toAdd() async {
    final url = await globalState.showCommonDialog<String>(
      child: const URLFormDialog(),
    );
    if (url != null) {
      _handleAddProfileFormURL(url);
    }
  }
 _toBuy() async {
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
  }
  @override
  Widget build(context) {
    return ListView(
      children: [
        if (Platform.isAndroid)
          ListItem(
            leading: const Icon(Icons.qr_code),
            title: Text(appLocalizations.qrcode),
            subtitle: Text(appLocalizations.qrcodeDesc),
            onTab: _toScan,
          ),
        ListItem(
          leading: const Icon(Icons.upload_file),
          title: Text(appLocalizations.file),
          subtitle: Text(appLocalizations.fileDesc),
          onTab: _handleAddProfileFormFile,
        ),
        ListItem(
          leading: const Icon(Icons.cloud_download),
          title: Text(appLocalizations.url),
          subtitle: Text(appLocalizations.urlDesc),
          onTab: _toAdd,
        ),
        ListItem(
          leading: const Icon(Icons.production_quantity_limits),
          title: Text(appLocalizations.taocan),
          subtitle: Text(appLocalizations.taocanDesc),
          onTab: _toBuy,
        )
      ],
    );
  }
}

class URLFormDialog extends StatefulWidget {
  const URLFormDialog({super.key});

  @override
  State<URLFormDialog> createState() => _URLFormDialogState();
}

class _URLFormDialogState extends State<URLFormDialog> {
  final urlController = TextEditingController();

  _handleAddProfileFormURL() async {
    final url = urlController.value.text;
    if (url.isEmpty) return;
    Navigator.of(context).pop<String>(url);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(appLocalizations.importFromURL),
      content: SizedBox(
        width: 300,
        child: Wrap(
          runSpacing: 16,
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: appLocalizations.url,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _handleAddProfileFormURL,
          child: Text(appLocalizations.submit),
        )
      ],
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