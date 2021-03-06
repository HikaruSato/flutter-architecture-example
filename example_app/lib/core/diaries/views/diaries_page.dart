import 'package:example_app/core/diaries/controllers/diaries_controller.dart';
import 'package:example_app/shared/ui/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiariesPage extends HookConsumerWidget {
  const DiariesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(diariesControllerProvider.notifier);
    final state = ref.watch(diariesControllerProvider);

    useEffect(() {
      Future(() {
        controller.getDiaries(isInit: true, isLoadingIndicatorShown: true);
      });

      return;
    }, const []);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final exception = state.exception;
    if (exception != null) {
      Future(() {
        final snackBar = SnackBar(content: Text(exception.message ?? 'エラーが発生しました'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '日記一覧',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            const threshold = 0.9;
            final scrollProportion = scrollInfo.metrics.pixels / scrollInfo.metrics.maxScrollExtent;
            if (!state.isLoading && scrollProportion > threshold) {
              controller.getDiaries();
            }

            return false;
          },
          child: state.isLoading
              ? const Loading()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.getDiaries(isInit: true);
                  },
                  child: ListView.separated(
                    itemCount: state.diaries.length,
                    itemBuilder: (_, index) {
                      final diary = state.diaries[index];
                      return ListTile(
                        title: Text(diary.title),
                        subtitle: Text(diary.content),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(diary.imagePath),
                                fit: BoxFit.cover,
                              )),
                        ),
                        trailing: GestureDetector(
                          child: const Icon(Icons.more_horiz_rounded),
                          onTapDown: (details) {
                            final position = details.globalPosition;
                            showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
                              items: [
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text(
                                    'menuItem 1',
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 2,
                                  child: Text(
                                    'menuItem 2',
                                  ),
                                ),
                              ],
                              elevation: 8.0,
                            ).then((value) {
                              if (value == null) {
                                return;
                              }

                              debugPrint('menuItem $value tapped');
                            });
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  ),
                ),
        ),
      ),
    );
  }
}
