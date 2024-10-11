part of '/screens/login_screen.dart';

class InputSection extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool _obscurePasswordText;
  final Function()? _togglePasswordView;

  const InputSection({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool obscurePasswordText,
    Function()? togglePasswordView,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _obscurePasswordText = obscurePasswordText,
        _togglePasswordView = togglePasswordView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextInputFieldWithIcon(
          hintText: 'Email address',
          textEditingController: _emailController,
        ),
        const SizedBox(height: 15),
        CustomTextInputFieldWithIcon(
          hintText: 'Password',
          obscureText: _obscurePasswordText,
          textEditingController: _passwordController,
          trailingIcon: PasswordEye(onTap: _togglePasswordView),
        ),
        const SizedBox(height: 10),
        const ForgotPasswordButton(text: 'Forgot password?')
      ],
    );
  }
}
