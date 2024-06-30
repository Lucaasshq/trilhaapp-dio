import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ImageAssestsPage extends StatefulWidget {
  const ImageAssestsPage({super.key});

  @override
  State<ImageAssestsPage> createState() => _ImageAssestsPageState();
}

class _ImageAssestsPageState extends State<ImageAssestsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 50,
        ),
        Image.asset(
          AppImages.user2,
          height: 50,
        ),
        Image.asset(
          AppImages.user3,
          height: 50,
        ),
        Image.asset(
          AppImages.paisagem1,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem2,
          height: 50,
        ),
        Image.asset(
          AppImages.paisagem3,
          height: 50,
        )
      ],
    );
  }
}
