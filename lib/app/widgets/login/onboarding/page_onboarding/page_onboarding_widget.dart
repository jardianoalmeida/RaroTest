import 'package:flutter/material.dart';
import 'package:raro_test/app/styles/app_text_theme.dart';

class PageOnboardingWidget extends StatelessWidget {
  final String? title;
  final String? content;
  final double? paddingLeft;
  final String? image;

  const PageOnboardingWidget({
    Key? key,
    this.title,
    this.content,
    this.paddingLeft = 0,
    this.image,
  }) : super(key: key);

  final spacer = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 191,
            ),
            child: Image.asset(
              image!,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: paddingLeft!),
          child: card,
        )
      ],
    );
  }

  Widget get card => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            children: <Widget>[
              Text(
                title!,
                style: AppTextTheme.textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              spacer,
              Text(
                content!,
                style: AppTextTheme.textTheme.bodyText1!.copyWith(
                  height: 1.5,
                ),
              )
            ],
          ),
        ),
      );
}
