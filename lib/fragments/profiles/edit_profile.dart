import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final Profile profile;
  final BuildContext context;

  const EditProfile({
    super.key,
    required this.context,
    required this.profile,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController labelController;
  late TextEditingController urlController;
  late TextEditingController autoUpdateDurationController;
  late bool autoUpdate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    labelController = TextEditingController(text: widget.profile.label);
    urlController = TextEditingController(text: widget.profile.url);
    autoUpdate = widget.profile.autoUpdate;
    autoUpdateDurationController = TextEditingController(
      text: widget.profile.autoUpdateDuration.inMinutes.toString(),
    );
  }

  _handleConfirm() {
    if (!_formKey.currentState!.validate()) return;
    final config = context.read<Config>();
    final hasUpdate = widget.profile.url != urlController.text;
    widget.profile.url = urlController.text;
    widget.profile.label = labelController.text;
    widget.profile.autoUpdate = autoUpdate;
    widget.profile.autoUpdateDuration =
        Duration(minutes: int.parse(autoUpdateDurationController.text));
    config.setProfile(widget.profile);
    if (hasUpdate) {
      widget.context.findAncestorStateOfType<CommonScaffoldState>()?.loadingRun(
            () => context.appController.updateProfile(
              widget.profile.id,
            ),
          );
    }
    Navigator.of(context).pop();
  }

  _setAutoUpdate(bool value) {
    if (autoUpdate == value) return;
    setState(() {
      autoUpdate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      ListItem(
        title: TextFormField(
          controller: labelController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: appLocalizations.name,
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return appLocalizations.profileNameNullValidationDesc;
            }
            return null;
          },
        ),
      ),
      if (widget.profile.url != null)...[
        ListItem(
          title: TextFormField(
            controller: urlController,
            maxLines: 2,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: appLocalizations.url,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return appLocalizations.profileUrlNullValidationDesc;
              }
              if (!value.isUrl) {
                return appLocalizations.profileUrlInvalidValidationDesc;
              }
              return null;
            },
          ),
        ),
        ListItem.switchItem(
          title: Text(appLocalizations.autoUpdate),
          delegate: SwitchDelegate<bool>(
            value: autoUpdate,
            onChanged: _setAutoUpdate,
          ),
        ),
        if (autoUpdate)
          ListItem(
            title: TextFormField(
              controller: autoUpdateDurationController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: appLocalizations.autoUpdateInterval,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return appLocalizations
                      .profileAutoUpdateIntervalNullValidationDesc;
                }
                try {
                  int.parse(value);
                } catch (_) {
                  return appLocalizations
                      .profileAutoUpdateIntervalInvalidValidationDesc;
                }
                return null;
              },
            ),
          ),
      ]
    ];
    return FloatLayout(
      floatingWidget: FloatWrapper(
        child: FloatingActionButton.extended(
          heroTag: null,
          onPressed: _handleConfirm,
          label: Text(appLocalizations.save),
          icon: const Icon(Icons.save),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: ListView.separated(
            itemBuilder: (_, index) {
              return items[index];
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 24,
              );
            },
            itemCount: items.length,
          ),
        ),
      ),
    );
  }
}
