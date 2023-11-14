import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/assets/text/text_extension.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:provider/provider.dart';

/// Photo details screen.
@RoutePage(name: AppRouteNames.photoDetailsScreen)
class PhotoDetailsScreen extends StatelessWidget {
  /// Default constructor.
  const PhotoDetailsScreen({
    required this.photo,
    super.key,
  });

  /// Photo details to show.
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              _Photo(photo: photo),
              _BackButton(
                textStyle: textTheme.regular.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                _LeftAlignText(
                  text: photo.username,
                  textStyle: textTheme.bold.copyWith(
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                _LeftAlignText(
                  text: '${photo.likesCount} likes',
                  textStyle: textTheme.bold.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LeftAlignText extends StatelessWidget {
  const _LeftAlignText({
    required this.text,
    required this.textStyle,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 30,
        ),
        child: TextButton(
          onPressed: () {
            context.read<IAppScope>().router.back();
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 10,
                color: Colors.white,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                'Back',
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.network(
          photo.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
