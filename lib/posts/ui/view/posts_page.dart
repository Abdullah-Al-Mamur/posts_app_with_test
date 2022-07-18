import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_with_test/common/ui/localization_cubit/localization_cubit.dart';
import 'package:posts_app_with_test/di/service_locator.dart';
import 'package:posts_app_with_test/l10n/l10n.dart';
import 'package:posts_app_with_test/posts/Ui/cubit/post_cubit.dart';
import 'package:posts_app_with_test/posts/Ui/widgets/post_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.posts),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: InkWell(
              onTap: () => sl<LocalizationCubit>().changeLocale(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: context.l10n.localeName == 'bn'
                      ? const Text('English')
                      : const Text('বাংলা'),
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => PostCubit()..fetchPosts(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostFetched) {
              return PostList(posts: state.posts ?? []);
            } else if (state is PostError) {
              return const Center(
                child: Text('something went wrong'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
