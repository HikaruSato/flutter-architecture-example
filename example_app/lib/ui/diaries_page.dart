import 'package:example_app/ui/components/loading.dart';
import 'package:example_app/view_models/diaries_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiariesPage extends HookConsumerWidget {
  const DiariesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(diariesPageViewModelProvider.notifier);
    final state = ref.watch(diariesPageViewModelProvider);

    useEffect(() {
      Future(() {
        viewModel.getDiaries(isInit: true, isLoadingIndicatorShown: true);
      });
    }, const []);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final exception = state.exception;
    if (exception != null) {
      Future(() {
        final snackBar =
            SnackBar(content: Text(exception.message ?? 'エラーが発生しました'));
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
            final scrollProportion =
                scrollInfo.metrics.pixels / scrollInfo.metrics.maxScrollExtent;
            if (!state.isLoading && scrollProportion > threshold) {
              viewModel.getDiaries();
            }

            return false;
          },
          child: state.isLoading
              ? const Loading()
              : RefreshIndicator(
                  onRefresh: () async {
                    await viewModel.getDiaries(isInit: true);
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
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
        ),
      ),
    );
  }
}
