// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    Key? key,
    required this.illustration,
    required this.headline,
    this.subText,
    this.onTap,
    this.buttonText,
  }) : super(key: key);
  final String illustration;
  final String headline;
  final String? subText;
  final VoidCallback? onTap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    assert(onTap != null ? buttonText != null : true);

    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 380,
              ),
              child: Image.asset(
                illustration,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              headline,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 2),
            if (subText != null)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Text(
                  subText!,
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 20),
            if (onTap != null)
              ConstrainedBox(
                constraints: const BoxConstraints(
                  // maxWidth: 420,
                  minWidth: 500,
                ),
                child: OutlinedButton(
                  onPressed: onTap,
                  child: Text(buttonText!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
