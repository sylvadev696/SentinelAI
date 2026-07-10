import 'package:flutter/material.dart';
import '../../core/navigation/main_navigation.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;
// ==========================================================
// REAL-TIME VALIDATION
// ==========================================================

String? emailError;

String? passwordError;
// ==========================================================
// INITIALIZE SCREEN
// ==========================================================

@override
void initState() {
  super.initState();

  emailController.addListener(validateInputs);
  passwordController.addListener(validateInputs);
}
// ==========================================================
// EMAIL VALIDATION
//
// Accepts only supported email providers.
//
// Supported:
//
// • Gmail
// • Outlook
// • Hotmail
// • Yahoo
// • Live
// • iCloud
// • Proton
// ==========================================================

bool isValidEmail(String email) {

  final emailRegex = RegExp(
    r'^[A-Za-z0-9._%+-]+@(gmail\.com|outlook\.com|hotmail\.com|yahoo\.com|live\.com|icloud\.com|proton\.me|protonmail\.com)$',
    caseSensitive: false,
  );

  return emailRegex.hasMatch(email.trim());
}
// ==========================================================
// PASSWORD VALIDATION
//
// Requirements:
//
// • Minimum 10 characters
// • One uppercase letter
// • One lowercase letter
// • One number
// • One special character
// ==========================================================

bool isValidPassword(String password) {

  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&^#()_+\-=\[\]{};:"\\|,.<>\/]).{10,}$',
  );

  return passwordRegex.hasMatch(password);
}
// ==========================================================
// VALIDATE INPUTS
//
// Runs every time the user types.
//
// Updates the UI instantly.
// ==========================================================

void validateInputs() {

  setState(() {

    final email = emailController.text.trim();
    final password = passwordController.text;

    emailError = null;
    passwordError = null;

    if (email.isNotEmpty && !isValidEmail(email)) {
      emailError = "Enter a valid email address!";
    }

    if (password.isNotEmpty &&
        !isValidPassword(password)) {

      passwordError =
          "Must be at least 10 characters\ncontain uppercase, lowercase,\nnumber and special character!";
    }

  });

}
void login() async {
  final email = emailController.text.trim();
  final password = passwordController.text;


  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter valid email and password!"),
      ),
    );
    return;
  }

if (!isValidEmail(email)) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Please enter a valid domain address.",
      ),
    ),
  );
  return;
}

  if (!isValidPassword(password)) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Password must contain at least 10 characters, including uppercase, lowercase, number and special character.",
      ),
    ),
  );
  return;
}

  setState(() {
    isLoading = true;
  });

  await Future.delayed(const Duration(seconds: 2));

  // ==========================================================
// SHOW LOADING INDICATOR
// ==========================================================
setState(() {
  isLoading = true;
});

// Simulate login request
await Future.delayed(const Duration(seconds: 2));

// If this widget has been removed from the widget tree,
// stop executing to avoid using an invalid BuildContext.
if (!mounted) return;

// Hide loading indicator
setState(() {
  isLoading = false;
});

// Navigate to the main application
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const MainNavigation(),
  ),
);
}
  @override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Sentinel AI"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),

                const Icon(
                  Icons.shield_rounded,
                  size: 90,
                  color: Color(0xFF0B3D91),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome....",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Sign in to continue protecting your device.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 35),

                TextField(
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    labelText: "Email",
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.email),

    // Shows validation error
    errorText: emailError,

    // Shows a green checkmark when valid
    suffixIcon: emailController.text.isEmpty
        ? null
        : (emailError == null
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.error,
                color: Colors.red,
              )),
  ),
),
 

                const SizedBox(height: 20),

                TextField(
  controller: passwordController,
  obscureText: obscurePassword,

  decoration: InputDecoration(
    labelText: "Password",

    border: const OutlineInputBorder(),

    prefixIcon: const Icon(Icons.lock),

    // Live validation message
    errorText: passwordError,

    suffixIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        // Validation icon
        if (passwordController.text.isNotEmpty)

          Icon(
            passwordError == null
                ? Icons.check_circle
                : Icons.error,
            color: passwordError == null
                ? Colors.green
                : Colors.red,
          ),

        IconButton(
          icon: Icon(
            obscurePassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),

          onPressed: () {

            setState(() {

              obscurePassword =
                  !obscurePassword;

            });

          },
        ),
      ],
    ),
  ),
),

                const SizedBox(height: 30),

                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B3D91),
                    ),
                    child: isLoading
    ? const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
    : const Text(
        "SIGN IN",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}