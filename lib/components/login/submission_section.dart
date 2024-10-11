part of '/screens/login_screen.dart';

class SubmissionSection extends StatelessWidget {
  final bool isLoading;
  final Function()? _handleNextButtonOnTap;

  const SubmissionSection({
    super.key,
    required this.isLoading,
    required Function()? handleNextButtonOnTap,
  }) : _handleNextButtonOnTap = handleNextButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetectorContainer(
          isLoading: isLoading,
          text: 'Next',
          onTap: _handleNextButtonOnTap,
        ),
        const SizedBox(height: 15),
        const RegisterSection(),
      ],
    );
  }
}
