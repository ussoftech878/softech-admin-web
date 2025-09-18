import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:softech_admin/routes/router_config.dart';
import 'package:softech_admin/utils/images.dart';
import 'package:softech_admin/utils/theme.dart';
import 'package:softech_admin/view_model/Auth_viewmodel.dart';
import 'package:softech_admin/widgets/user_form_field_widgets.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(PngAssests.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0, // Adjust blur intensity
              sigmaY: 5.0,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.1), // Adjust overlay opacity
            ),
          ),
          Center(
            child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset(PngAssests.logo),
              ),
              const SizedBox(height: 32),
              EmailTextField(),
              const SizedBox(height: 16),
              PasswordTextField(),
                  
              const SizedBox(height: 24),
              Consumer<AuthViewmodel>(
                builder: (context, authViewmodel, child) {
                  return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     if (authViewmodel.signInValidation()) {
                       context.go(homeRoute);
                     }
                    },
                    child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Sign In'),
                    ),
                  ),
                  );
                }
              ),
            ],
            ),
                    ),
          ),
        ]
         
        
      ),
    );
  }
}