part of '/screens/sign_up_screen.dart';

class InputSection extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final bool _obscurePasswordText;

  final bool _obscureConfirmPasswordText;
  final Function()? _togglePasswordView;
  final Function()? _toggleConfirmPasswordView;

  const InputSection({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required bool obscurePasswordText,
    required bool obscureConfirmPasswordText,
    Function()? togglePasswordView,
    Function()? toggleConfirmPasswordView,
  })  : _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _obscurePasswordText = obscurePasswordText,
        _obscureConfirmPasswordText = obscureConfirmPasswordText,
        _togglePasswordView = togglePasswordView,
        _toggleConfirmPasswordView = toggleConfirmPasswordView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 55),
        CustomTextInputFieldWithIcon(
          hintText: 'Full Name',
          textEditingController: _nameController,
        ),
        const SizedBox(height: 15),
        CustomTextInputFieldWithIcon(
          hintText: 'Email address',
          textEditingController: _emailController,
        ),
        const SizedBox(height: 15),
        CustomTextInputFieldWithIcon(
          hintText: 'Password',
          obscureText: _obscurePasswordText,
          textEditingController: _passwordController,
          trailingIcon: PasswordEye(
            onTap: _togglePasswordView,
          ),
        ),
        const SizedBox(height: 15),
        CustomTextInputFieldWithIcon(
          hintText: 'Confirm Password',
          obscureText: _obscureConfirmPasswordText,
          textEditingController: _confirmPasswordController,
          trailingIcon: PasswordEye(
            onTap: _toggleConfirmPasswordView,
          ),
        ),
      ],
    );
  }
}
