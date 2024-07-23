part of 'pages.dart';

class ApiUrlEditor extends StatelessWidget {
  const ApiUrlEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiConfigNotifier>(
        builder: (context, notifier, child) => Column(
              children: [
                TextFormFieldC(
                  name: "API Host",
                  initialValue: currentHost,
                  validator: (s) => null,
                  onChanged: notifier.setApiHost,
                ),
                Row(
                  children: [
                    const Text("HTTPS"),
                    Expanded(child: Container()),
                    Switch(
                      value: notifier.isSecure(),
                      onChanged: notifier.toggleSecure,
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => pushRoute(
                            context,
                            AboutUsRoute()
                        ),
                        child: Text("About Us")
                    )
                  ],
                )
              ],
            ));
  }
}
