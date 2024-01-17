import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

class AlarmRingScreen extends StatelessWidget {
  final AlarmSettings alarmSettings;

  const AlarmRingScreen({Key? key, required this.alarmSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Reminder to do your daily log",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text("📕", style: TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    AlarmSettings alarmSettingsN = alarmSettings;
                          alarmSettingsN = AlarmSettings(
                            id: alarmSettings.id,
                            dateTime: alarmSettings.dateTime.add(const Duration(days: 1)),
                            assetAudioPath: alarmSettings.assetAudioPath,
                            notificationTitle: alarmSettings.notificationTitle,
                            notificationBody: alarmSettings.notificationBody
                          );
                    Alarm.stop(alarmSettings.id)
                        .then((_) => Navigator.pop(context));
                    Alarm.set(alarmSettings: alarmSettingsN);
                  },
                  child: Text(
                    "Stop",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
