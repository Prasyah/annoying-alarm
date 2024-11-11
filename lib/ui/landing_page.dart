import 'package:annoying_alarm/core/app_export.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 112.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 44),
              _buildLogoSection(context),
              const Spacer(flex: 55),
              _buildBelieveUsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the centered logo section
  Widget _buildLogoSection(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _onTapLogoSection(context),
        child: SizedBox(
          height: 214.0,
          width: 318.0,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 28.0),
                child: Center(
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLogoLandingPage,
                    height: 214.0,
                    width: 252.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the "Believe Us" section
  Widget _buildBelieveUsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 26.0),
      child: const Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Never give you up | Never let you down",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Simple tap handler to show a snackbar when logo is tapped
  void _onTapLogoSection(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Logo tapped! Navigating to home..."),
      ),
    );
  }
}
